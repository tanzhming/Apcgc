package com.immense.tw.entity;

import java.util.Date;

/**
 * 用户的实体类
 * @author Administrator
 *
 */
public class Aaccount {

	private int id;
	private String username;
	private String password;
	private String referenceuser;  // 推荐人
	private Date registdate;
	private int islogin;
	
	public Aaccount(){
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReferenceuser() {
		return referenceuser;
	}
	public void setReferenceuser(String referenceuser) {
		this.referenceuser = referenceuser;
	}

	public Date getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}

	public int getIslogin() {
		return islogin;
	}

	public void setIslogin(int islogin) {
		this.islogin = islogin;
	}

	@Override
	public String toString() {
		return "Aaccount [id=" + id + ", username=" + username + ", password="
				+ password + ", referenceuser=" + referenceuser
				+ ", registdate=" + registdate + ", islogin=" + islogin + "]";
	}
}
