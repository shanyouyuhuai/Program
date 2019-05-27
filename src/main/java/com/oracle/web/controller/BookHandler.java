package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.SubBook;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value="prototype")
public class BookHandler {

	@Autowired
	private BookService bookservice;
	
	@Autowired
	private FenleiService fenleiservice;
	
	@RequestMapping(value="books",method=RequestMethod.GET)
	public String books(HttpServletRequest request){
		
		List<Book> list = bookservice.list();
		

		
		request.setAttribute("mlist", list);
		
		
		return "ShowBooks";
	}
	
	@RequestMapping(value="/addUI",method=RequestMethod.GET)
	
	public String addUI(HttpServletRequest request){
		
		List<Fenlei> flist=fenleiservice.list();
		
		request.setAttribute("flist", flist);
		
		return "addBook";
		
	}
	
	@RequestMapping(value="/book",method=RequestMethod.POST)
	
	public String add(Book book){
		
		bookservice.save(book);
		
		return "redirect:/books";
	}
}