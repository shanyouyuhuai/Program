package com.oracle.mapper;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;

import java.util.List;

public interface BookMapper {
   
   // int deleteByPrimaryKey(Integer bid);

    int insert(Book record);
    
    Book selectByPrimaryKey(Integer bid);

    List<Book> selectAll();

    int updateByPrimaryKey(Book record);
    
    int selectCount();

	List<SubBook> showAllByPage();

	List<Book> querybooks(String[] arr);

	List<Book> selectAll2();

	int deleteByPrimaryKey(String[] arr);
    
}