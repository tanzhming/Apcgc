package com.immense.tw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.immense.tw.dao.AnewsDao;
import com.immense.tw.entity.Anews;
import com.immense.tw.service.AnewsService;

@Service(value="anewsService")
@Transactional
public class AnewsServiceImpl implements AnewsService{
	
	@Resource
	private AnewsDao newsDao;

	public List<Anews> getAllnews() {
		return newsDao.getAllnews();
	}

	public Anews findNewsByid(Integer id) {
		return newsDao.findNewsByid(id);
	}
	
}
