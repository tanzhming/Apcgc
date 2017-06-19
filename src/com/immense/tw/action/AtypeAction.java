package com.immense.tw.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.immense.tw.entity.Atype;
import com.immense.tw.service.AtypeService;

@Controller
public class AtypeAction {

	protected final Log logger=LogFactory.getLog(getClass());
	
	@Resource
	private AtypeService typeService;
	
	@RequestMapping(value="/showTypes.action")
	@ResponseBody
	public List<Atype> showTypes(){
		List<Atype> types = typeService.getAllTypes();
		return types;
	}
}
