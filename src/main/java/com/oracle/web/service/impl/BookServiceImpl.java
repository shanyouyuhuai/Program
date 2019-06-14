package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.mapper.BookMapper;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;
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


//	@Override
//	@Transactional
//	public void delete(Book book) {
//		// TODO Auto-generated method stub
//		
//	 this.bookMapper.deleteByPrimaryKey(book.getBid());
//	}


	@Override
	@Transactional
	public void update(Book book) {
		// TODO Auto-generated method stub
		
		this.bookMapper.updateByPrimaryKey(book);
	}


	@Override
	@Transactional
	public Book queryone(Integer bid) {
		// TODO Auto-generated method stub
		return this.bookMapper.selectByPrimaryKey(bid);
	}


	@Override
	@Transactional
	public pageBean<SubBook> showAllByPage(Integer pageNow) {
		// TODO Auto-generated method stub
		
		pageBean<SubBook> pb =new pageBean<SubBook>();
		
		//当前页数据
		
		PageHelper.startPage(pageNow,5);
		
		// 已经是分页好的数据
		
		List<SubBook> list= this.bookMapper.showAllByPage();
		
		pb.setBeanList(list);
		
		// 总记录数
		
		PageInfo<SubBook> pl= new PageInfo<SubBook>(list);
		
		pb.setCounts((int) pl.getTotal());
		// 当前页 
		
		pb.setPageNow(pl.getPageNum());
		
		// 每页显示的条数 
		
		pb.setPageSize(pl.getPageSize());
		
		return pb;
	}


	@Override
	public List<Book> querybooks(String[] arr) {
		// TODO Auto-generated method stub
	
		return this.bookMapper.querybooks(arr);
	}


	@Override
	@Transactional
	public List<Book> list2() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll2();
	}


	@Override
	@Transactional
	public void delete(String[] arr) {
		// TODO Auto-generated method stub
		
	 this.bookMapper.deleteByPrimaryKey(arr);
	}

}
