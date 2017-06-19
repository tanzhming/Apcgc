package com.immense.tw.dao;

import java.util.List;

import com.immense.tw.entity.Anews;

/**
 * 公司新闻接口设计
 * @author Administrator
 *
 */
public interface AnewsDao {

	/**
	 * 获取所有的新闻
	 * @return
	 */
	public List<Anews> getAllnews();
	
	/**
	 * 根据id查询新闻
	 * @param id  前台传递过来的新闻id
	 * @return  返回一个对象
	 */
	public Anews findNewsByid(Integer id);
}
