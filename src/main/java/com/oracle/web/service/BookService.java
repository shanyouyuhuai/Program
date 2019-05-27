package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;

public interface BookService {

	int save(Book book);

	List<Book> list();

	void delete(Book book);

	
}
