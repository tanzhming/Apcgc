package com.immense.tw.entity;

import java.util.Date;

/**
 * 投资项目实体类
 * @author Administrator
 *
 */
public class Ainvestment {

	private int id;
	private String inversid;
	private int deadline;  // 期限
	private double money;
	private double interestrate;
	private Date transfer;
	private int istranfer;
	private double income;  // 预期收益
	
	private Atype atype;  // 关联type表
	
	public Ainvestment(){
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInversid() {
		return inversid;
	}
	public void setInversid(String inversid) {
		this.inversid = inversid;
	}
	public int getDeadline() {
		return deadline;
	}
	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public double getInterestrate() {
		return interestrate;
	}
	public void setInterestrate(double interestrate) {
		this.interestrate = interestrate;
	}
	public Date getTransfer() {
		return transfer;
	}
	public void setTransfer(Date transfer) {
		this.transfer = transfer;
	}
	public int getIstranfer() {
		return istranfer;
	}
	public void setIstranfer(int istranfer) {
		this.istranfer = istranfer;
	}

	public Atype getAtype() {
		return atype;
	}

	public void setAtype(Atype atype) {
		this.atype = atype;
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	@Override
	public String toString() {
		return "Ainvestment [id=" + id + ", inversid=" + inversid
				+ ", deadline=" + deadline + ", money=" + money
				+ ", interestrate=" + interestrate + ", transfer=" + transfer
				+ ", istranfer=" + istranfer + ", income=" + income
				+ ", atype=" + atype + "]";
	}

	
}
