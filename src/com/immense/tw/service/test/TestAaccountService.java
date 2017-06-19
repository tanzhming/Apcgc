package com.immense.tw.service.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.entity.Aaccount;
import com.immense.tw.service.AaccountService;

public class TestAaccountService {

	@Test
	public void Regist(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountService accountService=(AaccountService) ac.getBean("aaccountService");
		Aaccount account=new Aaccount();
		account.setUsername("jianruoning");
		account.setPassword("1514200039");
//		String str = accountService.Regist(account,);
//		System.out.println(str);
	}
	
	@Test
	public void findAccountBuname(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountService accountService=(AaccountService) ac.getBean("aaccountService");
		Aaccount account=new Aaccount();
		account.setUsername("jianruoning1");
		account.setPassword("1514200039");
		String str = accountService.findAccountBuname(account);
		System.out.println(str);
	}
}
