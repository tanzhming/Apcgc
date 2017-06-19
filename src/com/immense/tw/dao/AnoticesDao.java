package com.immense.tw.dao;

import java.util.List;

import com.immense.tw.entity.Anotices;

public interface AnoticesDao {

	/**
	 * 获取一条公告消息
	 * @return
	 */
	public Anotices get1notices();
	
	/**
	 * 获取所有的公告消息
	 * @return
	 */
	public List<Anotices> getAllnotices();
	
	/**
	 * 根据ID查询公告信息
	 * @param id
	 * @return
	 */
	public Anotices findnoticesByid(Integer id);
}
