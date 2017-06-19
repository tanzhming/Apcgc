package com.immense.tw.dao;

import java.util.Map;

import com.immense.tw.entity.AautomaticBid;

/**
 * 自动投标设置
 * @author Administrator
 *
 */
public interface AautomaticBidDao {

	public AautomaticBid findByid(Integer accountid);  // 根据用户ID查询
	
	public void add1data(AautomaticBid automaticBid);
	
	public void updateIsopen(Map<String, Object> param);
	
	public void delete1data(Integer id);  //根据自动投标的表删除数据
}
