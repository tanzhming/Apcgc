package com.immense.tw.dao.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.immense.tw.dao.AautomaticBidDao;
import com.immense.tw.entity.Aaccount;
import com.immense.tw.entity.AautomaticBid;


public class TestAutomaticBidDao {

	@Test
	public void findByid(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AautomaticBidDao automaticBid = (AautomaticBidDao) ac.getBean("aautomaticBidDao");
		AautomaticBid test = automaticBid.findByid(63310);
		System.out.println(test);
	}
	
	@Test
	public void add1data(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AautomaticBidDao automaticBidDao = (AautomaticBidDao) ac.getBean("aautomaticBidDao");
		AautomaticBid automaticBid=new AautomaticBid();
		Aaccount account=new Aaccount();
		account.setId(63311);
		automaticBid.setAccount(account);
		automaticBid.setSinglemoney(200);
		automaticBid.setReservedmoney(20000);
		automaticBid.setIncome("简若宁");
		automaticBid.setBorrowperiod("12");
		automaticBid.setProjecttype("安心债");
		automaticBid.setRepayment("我的世界，台湾");
		automaticBidDao.add1data(automaticBid);
	}
}
