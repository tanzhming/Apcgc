package com.immense.tw.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.immense.tw.entity.Aaccount;

public interface AaccountService {

	/**
	 * 用户注册
	 * @param account
	 */
	public String Regist(Aaccount account,HttpServletRequest request);
	
	/**
	 * 登录
	 * @param account
	 * @return
	 */
	public String Login(Aaccount account,HttpServletRequest request);
	
	/**
	 * 退出登录
	 * @return
	 */
	public String exitLogin(HttpServletRequest request);
	
	/**
	 * 设置账号的登录状态
	 */
	public void updateIslogin(Map<String, Object> param);
	
	/**
	 * 注册时，查询该账号是否已经存在
	 * @param account
	 */
	public String findAccountBuname(Aaccount account);
	
	/**
	 * 查询旧密码是否输入正确
	 * @param param
	 * @return
	 */
	public String findPwdByusername(Map<String, Object> param);
	
	/**
	 * 修改密码
	 */
	public String updatePwd(Map<String, Object> param);
}
