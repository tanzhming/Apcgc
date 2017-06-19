package com.immense.tw.entity;

import java.util.Date;

/**
 * 平台公告实体类
 * @author Administrator
 *
 */
public class Anotices {

	private int id;
	private String noticesid;
	private String noticestitle;
	private String noticesfrom;
	private Date noticesdate;
	private String noticescontent;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNoticesid() {
		return noticesid;
	}
	public void setNoticesid(String noticesid) {
		this.noticesid = noticesid;
	}
	public String getNoticestitle() {
		return noticestitle;
	}
	public void setNoticestitle(String noticestitle) {
		this.noticestitle = noticestitle;
	}
	public String getNoticesfrom() {
		return noticesfrom;
	}
	public void setNoticesfrom(String noticesfrom) {
		this.noticesfrom = noticesfrom;
	}
	public Date getNoticesdate() {
		return noticesdate;
	}
	public void setNoticesdate(Date noticesdate) {
		this.noticesdate = noticesdate;
	}
	public String getNoticescontent() {
		return noticescontent;
	}
	public void setNoticescontent(String noticescontent) {
		this.noticescontent = noticescontent;
	}
	
	@Override
	public String toString() {
		return "Anews [id=" + id + ", noticesid=" + noticesid
				+ ", noticestitle=" + noticestitle + ", noticesfrom="
				+ noticesfrom + ", noticesdate=" + noticesdate
				+ ", noticescontent=" + noticescontent + "]";
	}
	
}
