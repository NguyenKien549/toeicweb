package com.bktoeic.daoImpl;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bktoeic.dao.AdminDAO;
import com.bktoeic.model.Account;
import com.bktoeic.model.Audio;
import com.bktoeic.model.Paragraph;
import com.bktoeic.model.Part1;
import com.bktoeic.model.Part2;
import com.bktoeic.model.Part3;
import com.bktoeic.model.Part4;
import com.bktoeic.model.Part5;
import com.bktoeic.model.Part6;
import com.bktoeic.model.Part7;
import com.bktoeic.model.Practice;
import com.bktoeic.model.Test;

@Repository
public class AdminDAOImpl<T> implements AdminDAO<T> {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public boolean save(T obj) {
		Session session = sessionFactory.getCurrentSession();
		try {
			if(obj instanceof Part5)
			session.save(obj);
			System.out.println("save done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("false");
		return false;
	}

	@Transactional
	public boolean update(T obj) {
		Session session = sessionFactory.getCurrentSession();
		try {
			if(obj instanceof Part5) {
				session.merge(obj);
			}
			System.out.println("update done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Transactional
	public boolean delete(String type, int[] ids) {
		Session session = sessionFactory.getCurrentSession();
		try {
			if (type.equals("account")) {
				for (int i = 0; i < ids.length; i++) {
					Account delAcc = (Account) session.get(Account.class, ids[i]);
					session.delete(delAcc);
				}
				System.out.println("delete done");
				return true;
			}
			if (type.equals("part5")) {
				for (int i = 0; i < ids.length; i++) {
					Part5 delQuestion = (Part5) session.get(Part5.class, ids[i]);
					session.delete(delQuestion);
				}
				System.out.println("delete done");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("delete fail");
		return false;
	}

	// get list entity with 'type'
	@SuppressWarnings("unchecked")
	@Transactional
	public List<T> getList(String type, int page) {
		Session session = sessionFactory.getCurrentSession();
		Criteria cr = null;
		try {
			switch (type) {
			case "account":
				cr = session.createCriteria(Account.class);
				break;
			case "practice":
				cr = session.createCriteria(Practice.class);
				break;
			case "test":
				cr = session.createCriteria(Test.class);
				break;
			case "part1":
				cr = session.createCriteria(Part1.class);
				break;
			case "part2":
				cr = session.createCriteria(Part2.class);
				break;
			case "part3":
				cr = session.createCriteria(Part3.class);
				break;
			case "part4":
				cr = session.createCriteria(Part4.class);
				break;
			case "part5":
				cr = session.createCriteria(Part5.class);
				break;
			case "part6":
				cr = session.createCriteria(Part6.class);
				break;
			case "part7":
				cr = session.createCriteria(Part7.class);
				break;
			case "audio":
				cr = session.createCriteria(Audio.class);
				break;
			case "paragraph":
				cr = session.createCriteria(Paragraph.class);
				break;
			default:
				System.out.println("Input type invalid!");
				break;
			}
			cr.setFirstResult(10 * (page - 1));
			cr.setMaxResults(10 * page);
			List<T> list = cr.list();
			if (!list.isEmpty()) {
				System.out.println("page list: " + list.size());
				return list;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		System.out.println("null");
		return null;
	}

}
