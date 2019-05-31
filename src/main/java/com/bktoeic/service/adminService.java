package com.bktoeic.service;

import java.util.List;

public interface adminService<T> {
 public boolean save(T obj);
 public boolean update(T obj);
 public boolean delete(String type,int[] ids);
 
 public List<T> getList(String type,int page,int pageSize);
 
 public T getObject(String type,int id);
 
 public boolean lock(String type, Integer[] ids);
 public boolean unlock(String type, Integer[] ids);
 
 public List<T> getQuestion(String type);
 public boolean addOrUpdateQuestionToDocument(String type,String part,int id,int[] ids);
 
 public List<T> getDocumentForLesson(String type,String kind);
 public boolean addorUpdateDocumentForLesson(String type,int id,int[] ids);
 
}
