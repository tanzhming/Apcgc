package com.immense.tw.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.immense.tw.entity.Aaccount;



public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	// 拦截的地址
	private static final String[] IGNORE_URL={"SecurySet.action","SetMobileSecond.action","MyInvest.action","MyFlowFund.action","InvestStatistics.action","myAllGiftVoucher.action","AutomaticBidSet.action"};
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean falg=false;
		String url=request.getRequestURL().toString();
		//拦截上面的路径
		for (String str : IGNORE_URL) {
			if(url.contains(str)){
				falg=true;
				break;
			}
		}
		if(falg){
			Aaccount account = (Aaccount) request.getSession().getAttribute("accountSession");
			if(account!=null){
				falg=true;
			}else {
				response.sendRedirect("/Apcgc/Login.action");
				return false;
			}
		}
		return true;
	}
}
