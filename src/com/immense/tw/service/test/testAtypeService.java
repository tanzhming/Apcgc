package com.immense.tw.service.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.entity.Atype;
import com.immense.tw.service.AtypeService;

public class testAtypeService {

	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AtypeService service=(AtypeService) ac.getBean("atypeService");
		List<Atype> types = service.getAllTypes();
		for (Atype type : types) {
			System.out.println(type);
		}
	}
}
