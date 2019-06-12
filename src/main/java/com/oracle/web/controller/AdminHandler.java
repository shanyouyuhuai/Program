package com.oracle.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Controller
@Scope(value = "prototype")
public class AdminHandler {
	
	private static final String NONE = null;
	
	@Autowired
	private AdminService adminService;
	
	//注册
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String register(Admin admin){
		
		int i = adminService.save(admin);
		
		if(i > 0){
			
			return "redirect:/Login.jsp";
			
		}else{
			
			return "redirect:/Register.jsp";
			
		}
		
	}
	
	//登录
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,@RequestParam("password") String password,
			Admin admin,HttpServletRequest req,HttpSession session){
		
		session.setAttribute("username", username);
		
		Admin admin1 = adminService.login(admin.getUsername());
		
		if(admin1 == null){
			
			return "redirect:/Login.jsp";
			
		}
		
		if(!admin1.getPassword().equals(admin.getPassword())){
			
			return "redirect:/Login.jsp";
			
		}
		
		return "redirect:/Index.jsp";
		
	}
	
	//验证密码
	@RequestMapping(value = "/queryByPassword")
	@ResponseBody
	public void queryByPassword(@RequestParam("password") String password,HttpServletResponse response,
			HttpServletRequest request,HttpSession session) throws IOException{
		
		response.setContentType("text/html;chatset=utf-8");
		
		String username = (String) session.getAttribute("username");
		
		session.getAttribute("password");
		
		Admin admin = new Admin();
		
		admin.setUsername(username);
		
		admin.setPassword(password);
		
		Admin a = adminService.queryByPassword(admin);
		
		response.getWriter().write(String.valueOf(a));
		
	} 
	
	
	//修改密码
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam("password") String password,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) {
		

	    String uname=(String) session.getAttribute("username");
		
	    String newpassword=request.getParameter("newpassword");
	    
	    Admin a=adminService.changePassword(uname,newpassword);
			
	    return  "ShowAdmin";

	}
		
	
	
	//验证用户名
	
	@RequestMapping(value = "/validate.action")
	@ResponseBody
	public String queryByMame(String username,HttpServletResponse response) throws IOException{
		
		Admin a = adminService.queryOne(username);
		
		response.setContentType("text/html;charset=utf-8");
		
		if(a != null){
			
			response.getWriter().write("{\"valid\":\"false\"}");
			
		}else{
			
			response.getWriter().write("{\"valid\":\"true\"}");//不存在
			
		}
		
		return NONE;
	}
	
	
	//查看管理员
	@RequestMapping(value = "/showAdmin",method = RequestMethod.GET)
	public String showAdmin(HttpSession session){
		
		String uname = (String) session.getAttribute("username");
		
		Admin a = adminService.selectByPrimaryKey(uname);
		
		session.setAttribute("admin", a);
		
		return  "redirect:/ShowAdmin.jsp";
		
	}
	
	@RequestMapping(value="/exit")
	public String exit(HttpSession session,HttpServletResponse resp){
		
		//1.清空session
		session.invalidate();
		
		//2.跳转到登录界面		
		return "redirect:/Login.jsp";
		
	}
	
	
	

}
