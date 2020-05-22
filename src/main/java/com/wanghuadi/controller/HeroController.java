package com.wanghuadi.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wanghuadi.beans.Camp;
import com.wanghuadi.beans.Hero;
import com.wanghuadi.service.HeroService;
import com.wanghuadi.utils.FileUtils;

@Controller
public class HeroController {
	
	@Resource
	private HeroService heroService;

	@RequestMapping("queryAll")
	public String queryAll(@RequestParam(defaultValue="1")Integer pageNum,Model model
			,Integer cid,Integer status,Double startPrice,Double endPrice){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cid", cid);
		System.out.println(status);
		map.put("status2", status);
		map.put("startPrice", startPrice);
		map.put("endPrice", endPrice);
		PageHelper.startPage(pageNum, 2);
		List<Hero> list = heroService.queryAll(map);
		PageInfo<Hero> page = new PageInfo<>(list);
		model.addAttribute("page", page);
		
		//查询所有阵营
		List<Camp> campList = heroService.queryCampAll();
		model.addAttribute("campList", campList);
		return "list";
	}

	
	@RequestMapping("queryCampAll")
	@ResponseBody
	public List<Camp> queryCampAll(){
		//查询所有阵营
		List<Camp> campList = heroService.queryCampAll();
		return campList;
	}
	
	
	@RequestMapping("addHer")
	public String addHero(Hero hero,MultipartFile file) throws IllegalStateException, IOException{
		try {
			//上传图片返回路径
			String upload = FileUtils.upload(file);
			//将图片路径报错到对象中
			hero.setPicurl(upload);
			//添加数据库
			heroService.insertHero(hero);
			
			return "redirect:queryAll";
		} catch (Exception e) {
			e.printStackTrace();
			return "add";
		}
		
	}
	
	
	@RequestMapping("lookImg")
	public void lookImg(String path,HttpServletRequest request,HttpServletResponse response){
		FileUtils.lookImg(path, request, response);
	}
	
	@RequestMapping("queryHeroById")
	public String queryHeroById(Integer id,Model model){
		Hero hero = heroService.queryHeroById(id);
		model.addAttribute("hero", hero);
		
		
		//查询所有阵营
		List<Camp> campList = heroService.queryCampAll();
		model.addAttribute("campList", campList);
		return "show";
		
	}
	
	@RequestMapping("toBuy")
	public String toBuy(Integer id,Model model){
		Hero hero = heroService.queryHeroById(id);
		model.addAttribute("hero", hero);
		
		
		//查询所有阵营
		List<Camp> campList = heroService.queryCampAll();
		model.addAttribute("campList", campList);
		return "buy";
		
	}
	
	@RequestMapping("buy")
	@ResponseBody
	public boolean buy(Integer id){
		
		try {
			heroService.buy(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
}
