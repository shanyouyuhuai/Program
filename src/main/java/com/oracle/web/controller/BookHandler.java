package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
		
		for(Book b:list){
			
			System.out.println(b);
		}
		
		request.setAttribute("mlist", list);
		
		
		return "ShowBooks";
	}
	
	@RequestMapping(value="/addUI",method=RequestMethod.GET)
	
	public String addUI(HttpServletRequest request){
		
		List<Fenlei> flist=fenleiservice.list();
		
		request.getSession().setAttribute("flist", flist);
		
		return "redirect:/AddBook.jsp";
		
	}
	
	@RequestMapping(value="/book",method=RequestMethod.POST)
	
	public String add(Book book){
		
		bookservice.save(book);
		
		return "redirect:/books";
	}
	
	@RequestMapping(value="/book/{bid}" ,method=RequestMethod.DELETE)
	
	public String delete(@PathVariable("bid") Integer bid){
		
		Book book =new Book();
		
		book.setBid(bid);
		
		bookservice.delete(book);
		
		return "redirect:/books";
		
	}
	
	@RequestMapping(value="/book/{bid}", method=RequestMethod.GET)
	public String updateUI(@PathVariable("bid") Integer bid,HttpSession session){
		
		Book book =bookservice.queryone(bid);
		
		session.setAttribute("book", book);
		
		List<Fenlei> flist =fenleiservice.list();
		
		session.setAttribute("fList", flist);
		
		return "redirect:/ChangeBook.jsp";
		
	} 
	@RequestMapping(value="/book",method=RequestMethod.PUT)
	public String updatebook(Book book){
		
		bookservice.update(book);
		
		return "redirect:/books";
	}
}
