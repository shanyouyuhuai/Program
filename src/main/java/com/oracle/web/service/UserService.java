package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.pageBean;
import com.oracle.web.bean.User;

public interface UserService {

	int save(User user);

	List<User> list();

	pageBean<User> selectByPage(Integer pageNow,int pageSize);
	
	pageBean<User> selectAllPage(Integer pageNow);

	void  delete(User user);

	User queryOneUser(Integer id);

	void update(User user);

	List<User> showUserByIds(String[] arr);

	
  
}
