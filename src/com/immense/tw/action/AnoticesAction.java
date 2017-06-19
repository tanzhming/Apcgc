package com.immense.tw.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.immense.tw.entity.Anotices;
import com.immense.tw.service.AnoticesService;

@Controller
public class AnoticesAction {
	
	protected final Log logger=LogFactory.getLog(getClass());
	
	@Resource
	private AnoticesService noticeService;

	/**
	 * 首页显示一条新闻公告
	 * @param model
	 * @return
	 */
	@RequestMapping(value="show1notices.action")
	@ResponseBody
	public Anotices get1notices(){
		Anotices news =noticeService.get1notices();
		return news;
	}
	
	/**
	 *取得所有的公告新闻
	 * @param model
	 * @return
	 */
	@RequestMapping(value="showAllnotices.action")
	public String getAllnotices(Model model){
		List<Anotices> allnotices = noticeService.getAllnotices();
		model.addAttribute("allnotices", allnotices);
		return "Home/Notice.jsp";
	}
	
	/**
	 * 根据ID查询公告新闻
	 * @param NewsID
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="noticesDetail.action")
	public String findnoticesByid(Integer NoticesID,Model model){
		Anotices notices = noticeService.findnoticesByid(NoticesID);
		model.addAttribute("notices", notices);
		return "Home/NoticesDetail.jsp";  
	}
}
