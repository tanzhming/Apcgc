package com.immense.tw.dao.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.dao.AinvestmentDao;
import com.immense.tw.entity.Ainvestment;

public class TestAinvestmentDao {

	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AinvestmentDao invesDao=(AinvestmentDao) ac.getBean("ainvestmentDao");
		List<Ainvestment> inves = invesDao.getAllInves();
		for (Ainvestment inve : inves) {
			System.out.println(inve);  // ok
		}
	}
	
	@Test
	public void findInvesBytype(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AinvestmentDao invesDao=(AinvestmentDao) ac.getBean("ainvestmentDao");
		List<Ainvestment> inves = invesDao.findInvesBytype("AXZ");
		for (Ainvestment inve : inves) {
			System.out.println(inve);
		}
	}
	
	@Test
	public void findByInvesid(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AinvestmentDao invesDao=(AinvestmentDao) ac.getBean("ainvestmentDao");
		Ainvestment inves = invesDao.findByInvesid("CA00007947");
		System.out.println(inves);
	}
}
