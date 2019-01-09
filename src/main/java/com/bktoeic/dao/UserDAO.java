package com.bktoeic.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bktoeic.model.Account;

@Repository
public class UserDAO {
	
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public boolean checkAccount(String username,String pass) {
		try {
			Session session=sessionFactory.getCurrentSession();
			String hql="from Account where Username=:username and Password =:pass";
			Query query=session.createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("pass", pass);
			Account acc = (Account) query.uniqueResult();
			if(acc!=null) return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Transactional
	public boolean addUser(Account account) {
		try {
			Session session=sessionFactory.getCurrentSession();
			session.save(account);
			System.out.println("save account done...");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Transactional
	public Account getUser(String username) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from Account where username =:username";
		Query query=session.createQuery(hql);
		query.setParameter("username", username);
		Account user=(Account) query.uniqueResult();
		return user;
	}
	
	@Transactional
	public boolean updateUser(Account account) {
		Session session=sessionFactory.getCurrentSession();
		String hql="UPDATE Account SET Name = :name, DateOfBirth=:DateOfBirth,Gender=:Gender,"
				+ "Email=:Email where Id=:Id";
		Query query=(Query) session.createQuery(hql);
		query.setParameter("name", account.getName());
		query.setParameter("DateOfBirth", account.getDateOfBirth());
		query.setParameter("Gender", account.getGender());
		query.setParameter("Email", account.getEmail());
		query.setParameter("Id", account.getId());
		int a=query.executeUpdate();
		if(a>0) {
			System.out.println("update account done.");
			return true;
		}
		System.out.println("update fail");
		return false;
	}
}
