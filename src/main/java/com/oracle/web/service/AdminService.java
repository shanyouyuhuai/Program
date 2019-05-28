package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin login(Admin admin);

	Admin queryOne(String username);

	int change(String password);

	Admin selectByPrimaryKey(String username);



	

}
