package com.immense.tw.dao;

import java.util.List;

import com.immense.tw.entity.Atype;

public interface AtypeDao {

	/**
	 * 获取所有的投资列表
	 * @return
	 */
	public List<Atype> getAllTypes();
}
