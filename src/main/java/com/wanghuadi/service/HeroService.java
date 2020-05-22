package com.wanghuadi.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wanghuadi.beans.Camp;
import com.wanghuadi.beans.Hero;

public interface HeroService {
	public List<Hero> queryAll(Map<String,Object> map);
	public List<Camp> queryCampAll();
	public void insertHero(Hero hero);
	public Hero queryHeroById(Integer id);
	public void buy(Integer id);
}
