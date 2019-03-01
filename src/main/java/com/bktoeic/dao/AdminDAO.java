package com.bktoeic.dao;

import java.util.List;

public interface AdminDAO<T> {
	 public boolean save(T obj);
	 public boolean update(T obj);
	 public boolean delete(String type,int[] ids);
	 
	 public List<T> getList(String type,int page);
}
