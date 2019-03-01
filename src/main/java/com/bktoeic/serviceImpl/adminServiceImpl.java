package com.bktoeic.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bktoeic.dao.AdminDAO;
import com.bktoeic.service.adminService;

@Service
public class adminServiceImpl<T> implements adminService<T> {

	@Autowired
	private AdminDAO<T> adminDAO;
	
	public List<T> getList(String type,int page) {
		
		return adminDAO.getList(type,page);
	}

	public boolean save(T obj) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(T obj) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean delete(String type,int[] ids) {
		return adminDAO.delete(type,ids);
	}

}
