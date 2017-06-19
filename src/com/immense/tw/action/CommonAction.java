package com.immense.tw.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.immense.tw.entity.Aaccount;

@Controller
public class CommonAction {
	
	protected final Log logger=LogFactory.getLog(getClass());

	/**
	 * 进入  “更多” 列表页面
	 * @return
	 */
	@RequestMapping(value="/more.action")
	public String requestMore(){
		return "Home/More.jsp";
	}
	
	/**
	 * 进入帮助中心页面
	 */
	@RequestMapping(value="/help.action")
	public String requestHelp(){
		return "Home/HelpQuestion.jsp";
	}
	
	/**
	 * 進入關於平台頁面
	 * @return
	 */
	@RequestMapping(value="/AboutPlatform.action")
	public String requestAboutplat(){
		return "HelpQuestion/AboutPlatform.jsp";
	}
	
	/**
	 * 進入資金保障頁面
	 * @return
	 */
	@RequestMapping(value="/FinancialSecurity.action")
	public String requstFinancial(){
		return "HelpQuestion/FinancialSecurity.jsp";
	}
	
	/**
	 * 進入賬戶註冊頁面
	 * @return
	 */
	@RequestMapping(value="/AccountRegist.action")
	public String requestAccountRegister(){
		return "HelpQuestion/AccountRegist.jsp";
	}
	
	/**
	 * 進入我的賬戶界面
	 * @return
	 */
	@RequestMapping(value="/UserAccount.action")
	public String requestUserAccount(){
		return "HelpQuestion/UserAccount.jsp";
	}
	
	/**
	 * 進入賬戶安全界面
	 * @return
	 */
	@RequestMapping(value="/AccountSafe.action")
	public String requestAccountSafe(){
		return "HelpQuestion/AccountSafe.jsp";
	}
	
	/**
	 * 進入關於充值界面
	 * @return
	 */
	@RequestMapping(value="/AboutRecharge.action")
	public String requestAboutRecharge(){
		return "HelpQuestion/AboutRecharge.jsp";
	}
	
	/**
	 * 進入關於提現界面
	 * @return
	 */
	@RequestMapping(value="/AboutWithdrawal.action")
	public String requestAboutWithdrawal(){
		return "HelpQuestion/AboutWithdrawal.jsp";
	}
	
	/**
	 * 进入关于产品页面
	 * @return
	 */
	@RequestMapping(value="/AboutInvest.action")
	public String requestAboutInvest(){
		return "HelpQuestion/AboutInvest.jsp";
	}
	
	/**
	 * 进入撮合起息界面
	 * @return
	 */
	@RequestMapping(value="/AboutInvest2.action")
	public String requestAboutInvest2(){
		return "HelpQuestion/AboutInvest2.jsp";
	}
	
	/**
	 * 进入回收本息界面
	 * @return
	 */
	@RequestMapping(value="/AboutInvest3.action")
	public String requestAboutInvest3(){
		return "HelpQuestion/AboutInvest3.jsp";
	}
	
	/**
	 * 进入债权转出界面
	 * @return
	 */
	@RequestMapping(value="/AboutZQ.action")
	public String requestAboutZQ(){
		return "HelpQuestion/AboutZQ.jsp";
	}
	
	/**
	 * 进入债权转出界面
	 * @return
	 */
	@RequestMapping(value="/AboutZQ2.action")
	public String requestAboutZQ2(){
		return "HelpQuestion/AboutZQ2.jsp";
	}
	
	/**
	 * 进入联系我们页面
	 * @return
	 */
	@RequestMapping(value="/LinkUs.action")
	public String requestLinkUs(){
		return "Home/LinkUs.jsp";
	}
	
	/**
	 * 会员中心
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/user.action")
	public String requestAccount(HttpServletRequest request){
		HttpSession session = request.getSession();
		Aaccount accountSession = (Aaccount) session.getAttribute("accountSession");
		
		if(accountSession==null){
			return "Home/Login.jsp";
		}else {
			return "User.jsp";
		}
	}
	
	/**
	 * 进入登录界面
	 */
	@RequestMapping("/Login.action")
	public String requestLogin(){
		return "Home/Login.jsp";
	}
	
	/**
	 * 进入用户注册界面
	 * @return
	 */
	@RequestMapping(value="/RegistMobile.action")
	public String requestRegistMobile(){
		return "User/RegistMobile.jsp";
	}
	
	/**
	 * 进入账户管理界面
	 * @return
	 */
	@RequestMapping(value="/SecurySet.action")
	public String requestSerueySet(){
		return "User/SecurySet.jsp";
	}
	
	/**
	 * 注册结果界面
	 */
	@RequestMapping(value="/regResut.action")
	public String requestRegistResult(){
		return "MSG/1.jsp";
	}
	
	/**
	 * 进入账户管理界面下的手机设置界面
	 */
	@RequestMapping(value="/SetMobileSecond.action")
	public String requestSerueySetSecond(){
		return "User/SetMobileSecond.jsp";
	}
	
	/**
	 * 进入忘记密码界面
	 */
	@RequestMapping("/ForgetPassword.action")
	public String requestForgetPwd() {
		return "User/ForgetPassword.jsp";
	}
	
	/**
	 * 进入用户注册协议页面
	 */
	@RequestMapping("/RegistContent.action")
	public String requestRegProcotol(){
		return "User/RegistContent.jsp";
	}
	
	/**
	 * 进入我的礼金券界面  myAllGiftVoucher.action
	 */
	@RequestMapping("/myAllGiftVoucher.action")
	public String requestMyGiftVoucher(){
		return "User/myAllGiftVoucher.jsp";
	}
	
	/**
	 * 进入自动投标界面  
	 */
	@RequestMapping("/AutomaticBidSet.action")
	public String requestAutomaticBidSet(){
		return "User/AutomaticBidSet.jsp";
	}
	
	/** 
	 * 进入资金记录界面  
	 */
	@RequestMapping("/MyFlowFund.action")
	public String requestMyFlowFund(){
		return "User/MyFlowFund.jsp";
	}
	
	/**
	 * 进入投资统计界面  
	 */
	@RequestMapping("/InvestStatistics.action")
	public String requestInvestStatitics(){
		return "User/InvestStatistics.jsp";
	}
	
	/**
	 * 进入我的债权页面
	 */
	@RequestMapping("/MyInvest.action")
	public String requestMyInvest(Model model,String id){
		model.addAttribute("id", id);
		return "User/MyInvest.jsp";
	}
	
	/**
	 * 充值  
	 */
	@RequestMapping("/UserRecharge.action")
	public String requestUserRecharge(){
		return "User/UserRecharge.jsp";
	}
	
	/**
	 * 提现  Withdrawal.action
	 */
	@RequestMapping("/Withdrawal.action")
	public String requestWithdrawal(){
		return "User/Withdrawal.jsp";
	}
}
