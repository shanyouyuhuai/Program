package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.mapper.FenleiMapper;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.service.FenleiService;
@Service
public class FenleiServiceImpl implements FenleiService {
	
  @Autowired
  
  private FenleiMapper fenleiMapper;

	@Override
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
	}

}
