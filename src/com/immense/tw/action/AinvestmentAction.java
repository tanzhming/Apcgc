package com.immense.tw.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.immense.tw.entity.Ainvestment;
import com.immense.tw.service.AinvestmentService;

@Controller
public class AinvestmentAction {

	protected final Log logger=LogFactory.getLog(getClass());
	
	@Resource
	private AinvestmentService investmentService;
	
	@RequestMapping(value="/index.action")
	public String invesList(Model model,String type,HttpServletRequest request){
		List<Ainvestment> InvesList = null;
		
		if(type==null||"".equals(type)){  // 没有传type类型，显示所有的投资项目
			InvesList = investmentService.getAllInvesList();
		}else{ 
			InvesList = investmentService.findInvesBytype(type);
		}
		model.addAttribute("InvesList", InvesList);
		model.addAttribute("type", type);
		return "Invest/Index.jsp";
	}
	
	@RequestMapping(value="/home.action")
	public String homeList(Model model){
		List<Ainvestment> invests = investmentService.get6Inves();
		model.addAttribute("invests", invests);
		return "Home.jsp";
	}
	
	
	@RequestMapping(value="/indextype.action")
	@ResponseBody
	public List<Ainvestment> findInvesBytype(String type,Model model){
		List<Ainvestment> investments = investmentService.findInvesBytype(type);
		model.addAttribute("investments", investments);
		System.out.println(model);
		return investments;
	}
	
	/**
	 * 投资项目纤细信息 列表
	 * @param inversid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Detail.action")
	public String InvesDetail(String inversid,Model model){
		Ainvestment investment = investmentService.findByinvesid(inversid);
		Date transfer = investment.getTransfer();  // 转让时间
		Calendar c=Calendar.getInstance();
		c.setTime(transfer);
		int deadline = investment.getDeadline();   // 期限   
		// 转让时间的月份 + 期限 == 债权到期时间
		int month = c.get(Calendar.MONTH);
		int transfer_year=c.get(Calendar.YEAR);
		int m=month+deadline;
		System.out.println("m="+m);
		if(m>12){
			transfer_year++;
			m=m-12;
		}
		String expire=transfer_year+"/"+m+"/"+23;
		model.addAttribute("investment", investment);
		model.addAttribute("expire", expire);
		return "Invest/IndexDetail.jsp";
	}
	
}
