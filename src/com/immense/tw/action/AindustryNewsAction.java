package com.immense.tw.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.immense.tw.entity.AindustryNews;
import com.immense.tw.service.AindustryNewsService;

/**
 * 行业资讯控制器
 * @author Administrator
 *
 */
@Controller
public class AindustryNewsAction {
	
	protected final Log logger=LogFactory.getLog(getClass());

	@Resource
	private AindustryNewsService innewsService;
	
	/**
	 * 行业资讯主页
	 * @return
	 */
	@RequestMapping(value="/showAllinnews.action")
	public String showIndesryNews(Model model){
		List<AindustryNews> allinnews = innewsService.getAllinnews();
		model.addAttribute("allinnews", allinnews);
		return "Home/News.jsp";
	}
	
	/**
	 * 行业资讯详细信息
	 * @return
	 */
	@RequestMapping(value="/NewsDetail.action")
	public String showNewsDetail(String newsid,Model model){
		int id=Integer.parseInt(newsid);
		AindustryNews innews = innewsService.findInnewsByid(id);
		model.addAttribute("innews", innews);
		return "Home/NewsDetail.jsp";
	}
}
