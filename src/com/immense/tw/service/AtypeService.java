package com.immense.tw.service;

import java.util.List;

import com.immense.tw.entity.Atype;

public interface AtypeService {

	/**
	 * 获取所有的投资类型
	 * @return
	 */
	public List<Atype> getAllTypes();
}
