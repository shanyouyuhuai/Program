package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;

public interface BookService {

	int save(Book book);

	List<Book> list();

	void delete(Book book);
 
	void update(Book book);

	Book queryone(Integer bid);

	pageBean<SubBook> showAllByPage(Integer pageNow);

	
}
