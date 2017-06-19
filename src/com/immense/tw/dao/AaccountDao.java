package com.immense.tw.dao;

import java.util.Map;

import com.immense.tw.entity.Aaccount;

/**
 * 用户 dao层
 * @author Administrator
 *
 */
public interface AaccountDao {

	/**
	 * 增加一条用户记录(注册)
	 * @param account
	 */
	public void add1Account(Aaccount account);
	
	/**
	 * 根据用户名和密码查询(登录)
	 * @return
	 */
	public Aaccount findAccountBynameAndpwd(Aaccount account);
	
	/**
	 * 根据用户名查询用户是否登录
	 * @return
	 */
	public Integer findAccountIsloginByname(Aaccount account);
	
	/**
	 * 查询是否已经存在该用户名
	 * @param account
	 * @return  返回用户名
	 */
	public String findAccountByname(Aaccount account);
	
	/**
	 * 设置账号的登录状态 0 表示未登录  1表示已经登录
	 * @param islogin
	 */
	public void updateIslogin(Map<String, Object> param);
	
	/**
	 * 修改登录密码
	 * @param username 用户名
	 * @param pwd 新密码
	 */
	public void updatePwd(Map<String, Object> param);
	
	/**
	 * 修改密码
	 * 		判断旧密码是否输入正确
	 * @return
	 */
	public String findPwdByusername(Map<String, Object> param);
	
}
