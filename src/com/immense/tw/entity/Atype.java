package com.immense.tw.entity;

/**
 * 投资类型实体类
 * @author Administrator
 *
 */
public class Atype {

	private int id;
	private String typename;
	private String typenickname;
	
	public String getTypenickname() {
		return typenickname;
	}
	public void setTypenickname(String typenickname) {
		this.typenickname = typenickname;
	}
	public Atype(){
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	@Override
	public String toString() {
		return "Atype [id=" + id + ", typename=" + typename + ", typenickname="
				+ typenickname + "]";
	}
	
	
}
