package com.immense.tw.service;

import java.util.List;

import com.immense.tw.entity.Anotices;

public interface AnoticesService {

	/**
	 * 获取一条新闻消息
	 * @return
	 */
	public Anotices get1notices();
	
	/**
	 * 获取所有的新闻消息
	 * @return
	 */
	public List<Anotices> getAllnotices();
	
	/**
	 * 根据id查询公告新闻消息
	 * @param id
	 * @return
	 */
	public Anotices findnoticesByid(Integer id);
}
