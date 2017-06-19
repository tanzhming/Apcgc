package com.immense.tw.action;

import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.immense.tw.entity.Aaccount;
import com.immense.tw.entity.AautomaticBid;
import com.immense.tw.image.ValidateCodeImage;
import com.immense.tw.service.AaccountService;
import com.immense.tw.service.AautomaticBidService;

@Controller
public class AaccountAction {
	
	protected final Log logger=LogFactory.getLog(getClass());
	
	@Resource
	private AaccountService accountService;
	
	@Resource
	private ValidateCodeImage yzmimage;
	
	@Resource
	private AautomaticBidService automaticBidService;
	
	private  String yzmCode="";

	/**
	 * 注册
	 * @return
	 */
	@RequestMapping(value="/RegistMobileSubmit.action")
	@ResponseBody
	public String regist(Aaccount account,String yzm,HttpServletRequest request){
		System.out.println("用户输入的用户名和密码:"+account);
		System.out.println("用户注册,系统产生的验证码:"+yzmCode.toLowerCase()+"   用户输入的验证码:"+yzm.toLowerCase());
		
		String returnStr="";
		/**
		 * 判断验证码输入是否正确
		 */
		if(yzm.toLowerCase().equals(yzmCode.toLowerCase())){
			//注册
			returnStr = accountService.Regist(account,request);
			
		}else {
			returnStr= "yzmError";
		}
		return returnStr;
	}
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping(value="/login.action")
	@ResponseBody
	public String login(Aaccount account,HttpServletRequest request){
		String login = accountService.Login(account,request);
		return login;
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value="/exitLogin.action")
	@ResponseBody
	public String exitLogin(HttpServletRequest request){
		String exitLogin = accountService.exitLogin(request);
		return exitLogin;
	}
	
	@RequestMapping(value="/yzm.action")
	@ResponseBody
	public String createYZMimage(HttpServletRequest request,HttpServletResponse response){
		Object[] objs = yzmimage.createImage();
		BufferedImage image=(BufferedImage) objs[1];
		System.out.println("验证码:"+objs[0]);
		yzmCode=(String) objs[0];
		//String path="";
		try {
			ImageIO.write(image, "gif", response.getOutputStream()); 
			
			/*path=request.getSession().getServletContext().getRealPath("/Common/validatecode/yzm.png");
//			String path=request.getContextPath()+"/Common/validatecode/yzm.png";
//			String path="E:/文档资料/项目/Apcgc/WebRoot/Common/validatecode/yzm.png";
			System.out.println("路径:"+path);
			OutputStream os = new FileOutputStream(path);
			ImageIO.write(image, "gif", os);
			os.close();*/
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "yzmSuccess";
	}
	
	/**
	 * 忘记密码
	 */
	@RequestMapping("/ForgetPasswordCheck.action")
	@ResponseBody
	public Map<String, Object> forgotPasswordCheck(Aaccount account){
		Map<String, Object> results=new HashMap<String, Object>();
		System.out.println("接收前台传递多来的用户名："+account);
		String user = accountService.findAccountBuname(account);
		if(user==null){
			results.put("result", "用户名不存在");
		}else {
			results.put("result", "success");
		}
		return results;
	}
	
	/**
	 * 修改登录密码
	 * @param password 旧密码
	 * @param newpsd  新密码
	 * @param request
	 * @return
	 */
	@RequestMapping("/ChangePassSuccess.action")
	@ResponseBody
	public Map<String, Object> changePwd(String password,String newpsd,HttpServletRequest request) {
		Map<String, Object> results=new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Aaccount account = (Aaccount) session.getAttribute("accountSession");
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("password", password);
		param.put("newpsd", newpsd);
		param.put("username", account.getUsername());
		String str = accountService.updatePwd(param);
		if(str.equals("success")){
			results.put("result", str);
		}else {
			results.put("result", str);
		}
		return results;
	}
	
	/**
	 * 自动投标
	 */
	@RequestMapping("/zidongtoubiao.action")
	@ResponseBody
	public AautomaticBid automaticBidSet(HttpServletRequest request){
		HttpSession session = request.getSession();
		Aaccount account = (Aaccount) session.getAttribute("accountSession");
//		System.out.println("用户ID="+account.getId());
		AautomaticBid automaticBid = automaticBidService.findByid(account.getId());
//		System.out.println("自动投标设置的数据"+automaticBid);
		return automaticBid;
	}
	
	/**
	 * 自动投标设置
	 */
	@RequestMapping("/AutoBiddingSet.action")
	@ResponseBody
	public String AutoBiddingSet(AautomaticBid autoBidding,HttpServletRequest request){
		//System.out.println("前台的数据autoBidding:"+autoBidding);
		HttpSession session = request.getSession();
		Aaccount account = (Aaccount) session.getAttribute("accountSession");
		autoBidding.setAccount(account);
		//System.out.println("前台的数据autoBidding:"+autoBidding);
		automaticBidService.add1data(autoBidding);
		return "success";
	}
	
	@RequestMapping("/AutomaticBid.action")
	public String AutomaticBid(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		Aaccount account = (Aaccount) session.getAttribute("accountSession");
		AautomaticBid auto = automaticBidService.findByid(account.getId());
		model.addAttribute("auto", auto);
		return "User/AutomaticBid.jsp";
	}
	
	@RequestMapping("/updateIsopen.action")
	@ResponseBody
	public void updateIsopen(Integer isopen,HttpServletRequest request){
		Map<String, Object> param=new HashMap<String, Object>();
//		System.out.println("前台传递数据isopen="+isopen);
		HttpSession session = request.getSession();
		Aaccount account = (Aaccount) session.getAttribute("accountSession");
		param.put("isopen", isopen);
		param.put("accountID", account.getId());
		System.out.println("map数据="+param);
		automaticBidService.updateIsopen(param);
	}
	
}
