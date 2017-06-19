package com.immense.tw.dao.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.dao.AindustryNewsDao;
import com.immense.tw.entity.AindustryNews;

public class TestAindustryNewsDao {

	@Test
	public void getAllinnews(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AindustryNewsDao innewsDao=(AindustryNewsDao) ac.getBean("aindustryNewsDao");
		List<AindustryNews> allinnews = innewsDao.getAllinnews();
		for (AindustryNews innews : allinnews) {
			System.out.println(innews);
		}
	}
	
	@Test
	public void findInnewsByid(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AindustryNewsDao innewsDao=(AindustryNewsDao) ac.getBean("aindustryNewsDao");
		AindustryNews innews = innewsDao.findInnewsByid(1);
		System.out.println(innews);
	}
}
