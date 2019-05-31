package com.bktoeic.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bktoeic.dao.AdminDAO;
import com.bktoeic.service.adminService;

@Service("adminService")
public class adminServiceImpl<T> implements adminService<T> {

	@Autowired
	private AdminDAO<T> adminDAO;

	public List<T> getList(String type, int page, int pageSize) {

		return adminDAO.getList(type, page, pageSize);
	}

	public boolean save(T obj) {
		return adminDAO.save(obj);
	}

	public boolean update(T obj) {
		return adminDAO.update(obj);
	}

	public boolean delete(String type, int[] ids) {
		return adminDAO.delete(type, ids);
	}

	@Override
	public boolean lock(String type, Integer[] ids) {
		return adminDAO.lock(type, ids);
	}

	@Override
	public boolean unlock(String type, Integer[] ids) {
		return adminDAO.unlock(type, ids);
	}

	@Override
	public T getObject(String type, int id) {
		return adminDAO.getObject(type, id);
	}

	@Override
	public List<T> getQuestion(String type) {
		return adminDAO.getQuestion(type);
	}

	@Override
	public boolean addOrUpdateQuestionToDocument(String type, String part, int id, int[] ids) {
		return adminDAO.addOrUpdateQuestionToDocument(type, part, id, ids);
	}

	@Override
	public List<T> getDocumentForLesson(String type,String kind) {
		return adminDAO.getDocumentForLesson(type,kind);
	}

	@Override
	public boolean addorUpdateDocumentForLesson(String type, int id, int[] ids) {
		return adminDAO.addorUpdateDocumentForLesson(type, id, ids);
	}

}
