package com.immense.tw.dao.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.dao.AnoticesDao;
import com.immense.tw.entity.Anotices;

public class TestAnoticesDao {

	@Test
	public void get1news(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AnoticesDao noticeDao=(AnoticesDao) ac.getBean("anoticesDao");
		Anotices notices = noticeDao.get1notices();
		System.out.println(notices);
	}
	
	@Test
	public void getAllnews(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AnoticesDao newsDao=(AnoticesDao) ac.getBean("anoticesDao");
		List<Anotices> allnews = newsDao.getAllnotices();
		for (Anotices anews : allnews) {
			System.out.println(anews);
		}
	}
	
	@Test
	public void findnewsByid(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AnoticesDao newsDao=(AnoticesDao) ac.getBean("anoticesDao");
		Anotices news = newsDao.findnoticesByid(1);
		System.out.println(news);
	}
}
