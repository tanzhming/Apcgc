package com.immense.tw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.immense.tw.dao.AinvestmentDao;
import com.immense.tw.entity.Ainvestment;
import com.immense.tw.service.AinvestmentService;

@Service(value="ainvestmentService")
@Transactional
public class AinvestmentServiceImpl implements AinvestmentService{
	
	@Resource
	private AinvestmentDao investmentDao;

	public List<Ainvestment> getAllInvesList() {
		return investmentDao.getAllInves();
	}

	public List<Ainvestment> get6Inves() {
		return investmentDao.get6Inves();
	}

	public List<Ainvestment> findInvesBytype(String type) {
		return investmentDao.findInvesBytype(type);
	}

	public Ainvestment findByinvesid(String invesid) {
		return investmentDao.findByInvesid(invesid);
	}

}
