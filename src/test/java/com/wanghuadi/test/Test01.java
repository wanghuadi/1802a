package com.wanghuadi.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wanghuadi.beans.Hero;
import com.wanghuadi.mapper.HeroMapper;

public class Test01 {
	@Test
	public void test01() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		HeroMapper mapper = ac.getBean(HeroMapper.class);
		
		/*Map<String, Object> map = new HashMap<String, Object>();
		List<Hero> queryAll = mapper.queryAll(map );
		for (Hero hero : queryAll) {
			System.out.println(hero);
		}*/
		Hero hero = new Hero();
		mapper.insertHero(hero );
		
	}
}
