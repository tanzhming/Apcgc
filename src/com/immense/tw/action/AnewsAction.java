package com.immense.tw.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.immense.tw.entity.Anews;
import com.immense.tw.service.AnewsService;

@Controller
public class AnewsAction {

	protected final Log logger=LogFactory.getLog(getClass());
	
	@Resource
	private AnewsService newsService;
	
	/**
	 * 进入新闻消息页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/newsComm.action")
	public String showAllnews(Model model){
		try {
			List<Anews> newsList = newsService.getAllnews();
			model.addAttribute("newsList", newsList);
			return "Home/NewsCom.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	@RequestMapping(value="NewsCommDetail.action")
	public String showNewsCommDetail(Model model,String newsID){
		try {
			int id=Integer.parseInt(newsID);
			Anews news = newsService.findNewsByid(id);
			model.addAttribute("news", news);
			return "Home/NewsCommDetail.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
