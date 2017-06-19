package com.immense.tw.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.immense.tw.dao.AautomaticBidDao;
import com.immense.tw.entity.AautomaticBid;
import com.immense.tw.service.AautomaticBidService;

@Service(value="aautomaticBidService")
public class AautomaticBidServiceImpl implements AautomaticBidService{
	
	@Resource
	private AautomaticBidDao automaticBidDao;

	/**
	 * @param 用户ID
	 */
	public AautomaticBid findByid(Integer id) {
		System.out.println("service中接收的ID="+id);
		return automaticBidDao.findByid(id);
	}

	public void add1data(AautomaticBid automaticBid) {
		AautomaticBid a = findByid(automaticBid.getAccount().getId());
		if(a==null){
			automaticBidDao.add1data(automaticBid);
		}else {  //先删除原来的数据，然后 再 增加一条数据
			int id=a.getId();
			delete1data(id);
			automaticBidDao.add1data(automaticBid);
		}
	}

	/**
	 * 设置自动投标 OFF or ON
	 */
	public void updateIsopen(Map<String, Object> param) {
		automaticBidDao.updateIsopen(param);
	}

	/**
	 * 根据 自动投标表的ID删除数据
	 */
	public void delete1data(Integer id) {
		automaticBidDao.delete1data(id);
	}

}
