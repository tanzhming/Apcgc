package com.immense.tw.entity;

/**
 * 自动投标
 * @author Administrator
 *
 */
public class AautomaticBid {

	private int id;
	private Aaccount account;
	private int singlemoney;
	private int reservedmoney;
	private int notmoneyisinvest;
	private String income;
	private String borrowperiod;
	private String projecttype;
	private String repayment;
	private int isopen;
	
	public AautomaticBid(){
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Aaccount getAccount() {
		return account;
	}
	public void setAccount(Aaccount account) {
		this.account = account;
	}
	public int getSinglemoney() {
		return singlemoney;
	}
	public void setSinglemoney(int singlemoney) {
		this.singlemoney = singlemoney;
	}
	public int getReservedmoney() {
		return reservedmoney;
	}
	public void setReservedmoney(int reservedmoney) {
		this.reservedmoney = reservedmoney;
	}
	public int getNotmoneyisinvest() {
		return notmoneyisinvest;
	}
	public void setNotmoneyisinvest(int notmoneyisinvest) {
		this.notmoneyisinvest = notmoneyisinvest;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getBorrowperiod() {
		return borrowperiod;
	}
	public void setBorrowperiod(String borrowperiod) {
		this.borrowperiod = borrowperiod;
	}
	public String getProjecttype() {
		return projecttype;
	}
	public void setProjecttype(String projecttype) {
		this.projecttype = projecttype;
	}
	public String getRepayment() {
		return repayment;
	}
	public void setRepayment(String repayment) {
		this.repayment = repayment;
	}
	public int getIsopen() {
		return isopen;
	}
	public void setIsopen(int isopen) {
		this.isopen = isopen;
	}

	@Override
	public String toString() {
		return "AautomaticBid [id=" + id + ", account=" + account
				+ ", singlemoney=" + singlemoney + ", reservedmoney="
				+ reservedmoney + ", notmoneyisinvest=" + notmoneyisinvest
				+ ", income=" + income + ", borrowperiod=" + borrowperiod
				+ ", projecttype=" + projecttype + ", repayment=" + repayment
				+ ", isopen=" + isopen + "]";
	}
}
