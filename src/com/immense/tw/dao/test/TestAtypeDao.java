package com.immense.tw.dao.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.dao.AtypeDao;
import com.immense.tw.entity.Atype;

public class TestAtypeDao {

	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AtypeDao atypeDao=(AtypeDao) ac.getBean("atypeDao");
		List<Atype> types = atypeDao.getAllTypes();
		for (Atype atype : types) {
			System.out.println(atype);
		}
	}
}
