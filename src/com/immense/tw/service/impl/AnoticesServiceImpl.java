package com.immense.tw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.immense.tw.dao.AnoticesDao;
import com.immense.tw.entity.Anotices;
import com.immense.tw.service.AnoticesService;

@Service(value="anoticesService")
@Transactional
public class AnoticesServiceImpl implements AnoticesService{
	
	@Resource
	private AnoticesDao newsDao;

	/**
	 * 取一条新闻消息 
	 */
	public Anotices get1notices() {
		return newsDao.get1notices();
	}

	/**
	 * 取所有的新闻消息
	 */
	public List<Anotices> getAllnotices() {
		return newsDao.getAllnotices();
	}

	/**
	 * 根据ID查询公告新闻信息
	 */
	public Anotices findnoticesByid(Integer id) {
		return newsDao.findnoticesByid(id);
	}

}
