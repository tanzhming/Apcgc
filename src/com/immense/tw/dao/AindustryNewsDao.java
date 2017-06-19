package com.immense.tw.dao;

import java.util.List;

import com.immense.tw.entity.AindustryNews;

/**
 * 行业新闻dao层接口设计
 * @author Administrator
 *
 */
public interface AindustryNewsDao {
	
	/**
	 * 获取所有的行业资讯信息
	 * @return
	 */
	public List<AindustryNews> getAllinnews();
	
	/**
	 * 根据ID查询行业信息
	 * @param id
	 * @return
	 */
	public AindustryNews findInnewsByid(Integer id);
}
