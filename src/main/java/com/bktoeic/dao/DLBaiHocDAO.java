package com.bktoeic.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bktoeic.model.Lessions;

@Repository
public class DLBaiHocDAO {

	private SessionFactory sessionFactory;

	@Autowired
	public final void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Lessions> topLession(String type){
		List<Lessions> top=new ArrayList<>();
		Session session=sessionFactory.getCurrentSession();
		String hql="from Lessions where Type=:type order by AccessCount DESC";
		Query query=session.createQuery(hql).setMaxResults(5);
		query.setParameter("type",type);
		top=query.list();
		if(!top.isEmpty()) {
			System.out.println("list done");
			return top;
		}
		System.out.println("list null");
		return top;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Lessions> newLession(String type){
		List<Lessions> newLessions = new ArrayList<>();
		Session session= sessionFactory.getCurrentSession();
		String hql="from Lessions where Type=:type order by Id DESC";	
		Query query=session.createQuery(hql).setMaxResults(5);
		query.setParameter("type",type);
		newLessions = query.list();
		if(!newLessions.isEmpty()) {
			System.out.println("list done");
		}else System.out.println("list faulse");
		return newLessions;
	}
	
}
