package com.immense.tw.service;

import java.util.Map;

import com.immense.tw.entity.AautomaticBid;

/**
 * 自动投标设置
 * @author Administrator
 *
 */
public interface AautomaticBidService {

	public AautomaticBid findByid(Integer id);
	
	public void add1data(AautomaticBid automaticBid);
	
	public void updateIsopen(Map<String, Object> param);
	
	public void delete1data(Integer id);
}
