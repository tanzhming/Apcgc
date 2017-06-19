package com.immense.tw.dao.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class StudentDaoTest {

	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		StudentDao studentDao=(StudentDao) ac.getBean("studentDao");
		List<Student> students = studentDao.testselect();
		for (Student student : students) {
			System.out.println(student);
		}
	}
}
