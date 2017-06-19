package com.immense.tw.entity;

import java.util.Date;

/**
 * 公司新闻
 * @author Administrator
 *
 */
public class Anews {

	private int id;
	private String newsid;
	private String newstitle;
	private String newscontent;
	private Date newsdate;
	
	public Anews(){
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNewsid() {
		return newsid;
	}
	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}
	public String getNewstitle() {
		return newstitle;
	}
	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}
	public String getNewscontent() {
		return newscontent;
	}
	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}
	public Date getNewsdate() {
		return newsdate;
	}
	public void setNewsdate(Date newsdate) {
		this.newsdate = newsdate;
	}
	
	@Override
	public String toString() {
		return "Anews [id=" + id + ", newsid=" + newsid + ", newstitle="
				+ newstitle + ", newscontent=" + newscontent + ", newsdate="
				+ newsdate + "]";
	}
}
