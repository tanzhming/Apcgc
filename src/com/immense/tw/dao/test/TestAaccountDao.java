package com.immense.tw.dao.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.dao.AaccountDao;
import com.immense.tw.entity.Aaccount;

public class TestAaccountDao {

	@Test
	public void add1Account(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountDao accountDao=(AaccountDao) ac.getBean("aaccountDao");
		Aaccount account=new Aaccount();
		account.setUsername("jianruoning");
		account.setPassword("1514200039");
		account.setReferenceuser("scabsM");
		accountDao.add1Account(account);
	}
	
	/**
	 * 查询是否已经存在该用户名
	 */
	@Test
	public void findAccountByname(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountDao accountDao=(AaccountDao) ac.getBean("aaccountDao");
		Aaccount account=new Aaccount();
		account.setUsername("jianruoning1");
		String str = accountDao.findAccountByname(account);
		System.out.println(str);
	}
	
	@Test
	public void findAccountBynameAndpwd(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountDao accountDao=(AaccountDao) ac.getBean("aaccountDao");
		Aaccount account=new Aaccount();
		account.setUsername("jianruoning");
		account.setPassword("151420039");
		Aaccount a = accountDao.findAccountBynameAndpwd(account);
		System.out.println(a);
	}
	
	@Test
	public void findAccountIsloginByname(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountDao accountDao=(AaccountDao) ac.getBean("aaccountDao");
		Aaccount account=new Aaccount();
		account.setUsername("jianruoning");
		account.setPassword("1514200039");
		Integer islogin = accountDao.findAccountIsloginByname(account);
		System.out.println(islogin);
	}
	
	@Test
	public void updateIslogin(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountDao accountDao=(AaccountDao) ac.getBean("aaccountDao");
		Map<String, Object> para=new HashMap<String, Object>();
		para.put("islogin", 0);
		para.put("id", 63310);
		accountDao.updateIslogin(para);
		System.out.println("结束");
	}
	
	/**
	 * 修改密码  判断旧密码是否输入正确
	 */
	@Test
	public void findPwdByusername(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountDao accountDao=(AaccountDao) ac.getBean("aaccountDao");
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("username", "jianruoning");
		param.put("password", "123");
		String str = accountDao.findPwdByusername(param);
		System.out.println(str);
	}
}
