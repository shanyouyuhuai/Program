package com.oracle.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(Admin admin){  
		
		Admin admin1 = adminService.login(admin);
		
		if(admin1 == null){
			
			return "redirect:/Login.jsp";
			
		}
		
		if(!admin1.getPassword().equals(admin.getPassword())){
			
			return "redirect:/Login.jsp";
			
		}
		
		return "redirect:/Index.jsp";
		
	}
	
	
	//验证
	
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

}
