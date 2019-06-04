package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin login(String username);

	Admin queryOne(String username);

	int change(String password);

	Admin selectByPrimaryKey(String uname);

	



	

}
