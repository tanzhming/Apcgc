package com.immense.tw.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.immense.tw.entity.Aaccount;
import com.immense.tw.service.AaccountService;

public class SessionListener implements HttpSessionListener,ServletContextListener{
	
	private AaccountService accountService;

	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("session被创建");
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		synchronized (this) {
			System.out.println("session销毁被触发");
			HttpSession session = se.getSession();
			Aaccount account = (Aaccount) session.getAttribute("accountSession");
			System.out.println(account);
			Map<String, Object> param=new HashMap<String, Object>();
			param.put("islogin", 0);
			param.put("id", account.getId());
			System.out.println(param);
			//为什么不执行！！！
			try {
				accountService.updateIslogin(param);

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("------------");
				e.printStackTrace();
			}
			System.out.println("xxxxx");
			System.out.println("session被销毁");
		}
	}
	
	/**
	 * 测试
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		AaccountService accountService = (AaccountService) ac.getBean("aaccountService");
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("islogin", 0);
		param.put("id", 63310);
		accountService.updateIslogin(param);
	}

	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	public void contextInitialized(ServletContextEvent sce) {
		accountService=WebApplicationContextUtils.getRequiredWebApplicationContext(sce.getServletContext()).getBean(AaccountService.class);
	}

}
