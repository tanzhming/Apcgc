package com.immense.tw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.immense.tw.dao.AtypeDao;
import com.immense.tw.entity.Atype;
import com.immense.tw.service.AtypeService;

@Service(value="atypeService")
@Transactional
public class AtypeServiceImpl implements AtypeService{
	
	@Resource
	private AtypeDao atypeDao;

	public List<Atype> getAllTypes() {
		return atypeDao.getAllTypes();
	}

}
