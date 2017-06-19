package com.immense.tw.service.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.entity.Ainvestment;
import com.immense.tw.service.AinvestmentService;

public class TestAinvestmentService {

	@Test
	public void findInvesBytype(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AinvestmentService invesService=(AinvestmentService) ac.getBean("ainvestmentService");
		List<Ainvestment> inves = invesService.findInvesBytype("AXZ");
		for (Ainvestment inve : inves) {
			System.out.println(inve);
		}
	}
}
