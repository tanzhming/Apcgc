package com.immense.tw.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.immense.tw.dao.AaccountDao;
import com.immense.tw.entity.Aaccount;
import com.immense.tw.service.AaccountService;

@Service(value="aaccountService")
@Transactional
public class AaccountServiceImpl implements AaccountService{
	
	@Resource
	private AaccountDao accountDao;

	/**
	 * 注册	
	 * 		1、判断该用户名是否存在
	 */
	public String Regist(Aaccount account,HttpServletRequest request) {
		String username = accountDao.findAccountByname(account);
		if(username==null){  //该账号不存在，可以注册
			accountDao.add1Account(account);
			Aaccount user = accountDao.findAccountBynameAndpwd(account);
			HttpSession session = request.getSession();
			session.setAttribute("accountSession", user);
			Map<String, Object> param=new HashMap<String, Object>();
			param.put("islogin", 0);
			param.put("id", user.getId());
			accountDao.updateIslogin(param);
			return "regSuccess";
		}else {  //账号已经存在，不能注册
			System.out.println("注册失败，该账号已经存在");
			return "regError";
		}
		
	}

	/**
	 * 登录实现
	 */
	public String Login(Aaccount account,HttpServletRequest request) {
//		System.out.println("用户信息:"+account);
		String returnStr="";
		Aaccount user = accountDao.findAccountBynameAndpwd(account);
		HttpSession session = request.getSession();
		if(user!=null){
			session.setAttribute("accountSession", user); // 将对象存为session域中
			Integer islogin = accountDao.findAccountIsloginByname(account);
			if(islogin==0){
				//将将账号设置已经登录
				Map<String, Object> param=new HashMap<String, Object>();
				param.put("islogin", 1);
				param.put("id", user.getId());
				updateIslogin(param);
				returnStr="nologin";
			}else if (islogin==1) {
				returnStr="islogin";
			}
		}else {
			returnStr="fail";
		}
		return returnStr;
	}

	/**
	 * 退出登录
	 */
	public String exitLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 设置账号未登录
		Map<String, Object>	param=new HashMap<String, Object>();
		param.put("islogin", 0);
		param.put("id", ((Aaccount) session.getAttribute("accountSession")).getId());
		
		updateIslogin(param);
		
		session.setAttribute("accountSession", null);
		return "exitsuccess";
	}

	

	/**
	 * 设置账号的登录状态
	 */
	public void updateIslogin(Map<String, Object> param) {
		accountDao.updateIslogin(param);
	}

	/**
	 * 注册时，查询该账号是否已经存在
	 */
	public String findAccountBuname(Aaccount account) {
		return accountDao.findAccountByname(account);
	}

	
	public String findPwdByusername(Map<String, Object> param) {
		return accountDao.findPwdByusername(param);
	}

	public String updatePwd(Map<String, Object> param) {
		String username = findPwdByusername(param);
		String results="";
		if(username==null){
			results="旧密码输入错误";
		}else {
			accountDao.updatePwd(param);
			results="success";
		}
		return results;
	}


}
