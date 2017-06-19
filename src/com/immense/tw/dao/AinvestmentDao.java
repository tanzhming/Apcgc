package com.immense.tw.dao;

import java.util.List;

import com.immense.tw.entity.Ainvestment;

public interface AinvestmentDao {

	public List<Ainvestment> getAllInves();
	
	public List<Ainvestment> get6Inves();
	
	/**
	 * 根据投资类型查询投资项目
	 * @param type
	 * @return
	 */
	public List<Ainvestment> findInvesBytype(String type);
	
	/**
	 * 根据投资项目的invesid查询投资项目
	 * @param invesid
	 * @return
	 */
	public Ainvestment findByInvesid(String invesid);
}
