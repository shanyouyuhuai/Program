package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.BookMapper;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired	
	private BookMapper bookMapper;

	@Override
	@Transactional
	public int save(Book book) {
		// TODO Auto-generated method stub
		
		return this.bookMapper.insert(book);
	}

	
	@Override
	@Transactional(readOnly=true)
	public List<Book> list() { 
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll();
	}

}