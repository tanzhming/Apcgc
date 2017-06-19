package com.immense.tw.service;

import java.util.List;

import com.immense.tw.entity.AindustryNews;

/**
 * 行业资讯接口设计
 * @author Administrator
 *
 */
public interface AindustryNewsService {

	/**
	 * 获取所有的行业资讯
	 * @return
	 */
	public List<AindustryNews> getAllinnews();
	
	/**
	 * 获取一条行业资讯
	 * @param id
	 * @return
	 */
	public AindustryNews findInnewsByid(Integer id);
	
}
