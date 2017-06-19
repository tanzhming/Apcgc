package com.immense.tw.entity;

import java.util.Date;

/**
 * 行业新闻实体类
 * @author Administrator
 *
 */
public class AindustryNews {

	private int id;
	private String innewsid;
	private String innewstitle;
	private String innewscontent;
	private Date innewsdate;
	
	public AindustryNews(){
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInnewsid() {
		return innewsid;
	}
	public void setInnewsid(String innewsid) {
		this.innewsid = innewsid;
	}
	public String getInnewstitle() {
		return innewstitle;
	}
	public void setInnewstitle(String innewstitle) {
		this.innewstitle = innewstitle;
	}
	public String getInnewscontent() {
		return innewscontent;
	}
	public void setInnewscontent(String innewscontent) {
		this.innewscontent = innewscontent;
	}
	public Date getInnewsdate() {
		return innewsdate;
	}
	public void setInnewsdate(Date innewsdate) {
		this.innewsdate = innewsdate;
	}
	
	@Override
	public String toString() {
		return "AindustryNews [id=" + id + ", innewsid=" + innewsid
				+ ", innewstitle=" + innewstitle + ", innewscontent="
				+ innewscontent + ", innewsdate=" + innewsdate + "]";
	}
}
