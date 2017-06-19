package com.immense.tw.service;

import java.util.List;

import com.immense.tw.entity.Ainvestment;

public interface AinvestmentService {

	/**
	 * 获取所有的投资项目
	 * @return
	 */
	public List<Ainvestment> getAllInvesList();
	
	/**
	 * 首页显示6行数据
	 * @return
	 */
	public List<Ainvestment> get6Inves();
	
	/**
	 * 根据投资类型查找投资项目
	 * @param type
	 * @return
	 */
	public List<Ainvestment> findInvesBytype(String type);
	
	/**
	 * 根据invesid查询投资项目
	 * @return
	 */
	public Ainvestment findByinvesid(String invesid);
}
