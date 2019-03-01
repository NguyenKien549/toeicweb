package com.bktoeic.daoImpl;

import java.util.HashSet;

import java.util.Iterator;
import java.util.List;

import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bktoeic.dao.GuestDAO;
import com.bktoeic.model.Paragraph;
import com.bktoeic.model.Practice;

@Repository
public class GuestDAOImpl<T> implements GuestDAO<T> {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Practice> accessPractice(byte part) {
		Session session = sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(Practice.class);
		cr.add(Restrictions.eq("Part", part));
		List<Practice> list = cr.list();
		if (list.isEmpty())
			System.out.println("listpractice empty");
		return list;
	}


	@Transactional
	public Practice practiceReading(String code) {
		Session session = sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(Practice.class);
		cr.add(Restrictions.eq("Code", code));
		Practice practice = (Practice) cr.uniqueResult();
		if (practice != null)
			System.out.println("practice null");
		return practice;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Set<T> practiceReadingQues(int id, byte part) throws NullPointerException {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Practice.class);

		cr.add(Restrictions.eq("Id", id));

		Practice practice = (Practice) cr.uniqueResult();
		if (part == 5) {
			return (Set<T>) practice.getListPart5();
		} else if (part == 6 ) {
			Set<T> result=new HashSet<T>();
			
			Set<Paragraph> listPara= new HashSet<Paragraph>();
			listPara=practice.getListParagraph();
			Iterator<Paragraph> it = listPara.iterator();
			while(it.hasNext()) {
				Set<T> temp=new HashSet<T>();
				Paragraph para=it.next();
				temp.add((T)para);
				
				temp.add((T) para.getPart6());
				
				
				result.add((T) temp);
			}
			return result;
		}else if(part ==7) {
			Set<T> result=new HashSet<T>();
			
			Set<Paragraph> listPara= new HashSet<Paragraph>();
			listPara=practice.getListParagraph();
			Iterator<Paragraph> it = listPara.iterator();
			while(it.hasNext()) {
				Set<T> temp=new HashSet<T>();
				Paragraph para=it.next();
				temp.add((T)para );
				temp.add((T) para.getPart7());
				
				
				result.add((T) temp);
			}
			return result;
		}
		return null;

	}

	@Transactional
	public Practice practiceListening(String code) {
		// TODO Auto-generated method stub
		return null;
	}

}
