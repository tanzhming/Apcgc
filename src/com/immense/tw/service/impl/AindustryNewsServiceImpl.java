package com.immense.tw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.immense.tw.dao.AindustryNewsDao;
import com.immense.tw.entity.AindustryNews;
import com.immense.tw.service.AindustryNewsService;

@Service(value="aindustryNewsService")
@Transactional
// @Transactional表示该类被Spring作为事务管理的类
public class AindustryNewsServiceImpl implements AindustryNewsService{
	
	@Resource
	private AindustryNewsDao innewsDao;

	public List<AindustryNews> getAllinnews() {
		return innewsDao.getAllinnews();
	}

	public AindustryNews findInnewsByid(Integer id) {
		return innewsDao.findInnewsByid(id);
	}

}
