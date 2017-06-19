package com.immense.tw.service;

import java.util.List;

import com.immense.tw.entity.Anews;

public interface AnewsService {

	/**
	 * 获取所有的新闻
	 * @return
	 */
	public List<Anews> getAllnews();
	
	/**
	 * 根据ID查询新闻
	 * @param id
	 * @return
	 */
	public Anews findNewsByid(Integer id);
}
