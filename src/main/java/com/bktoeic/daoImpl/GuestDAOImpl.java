package com.bktoeic.daoImpl;

import java.util.Collection;
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
import com.bktoeic.model.Audio;
import com.bktoeic.model.Paragraph;
import com.bktoeic.model.Part1;
import com.bktoeic.model.Part2;
import com.bktoeic.model.Part3;
import com.bktoeic.model.Part4;
import com.bktoeic.model.Part6;
import com.bktoeic.model.Part7;
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
		} else if (part == 6) {
			Set<Paragraph> listPara = practice.getListParagraph();
			return (Set<T>) listPara;
		} else if (part == 7) {
			Set<T> result = new HashSet<T>();

			Set<Paragraph> listPara = new HashSet<Paragraph>();
			listPara = practice.getListParagraph();
			Iterator<Paragraph> it = listPara.iterator();
			while (it.hasNext()) {
				Set<T> temp = new HashSet<T>();
				Paragraph para = it.next();
				Set<Part7> part7 = para.getPart7();
				para.setPart7(part7);
				temp.add((T) para);
				result.add((T) temp);
			}
			return result;
		}
		return null;

	}

	@Transactional
	public Practice practice(int id, byte part) {
		try {
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(Practice.class);
			cr.add(Restrictions.eq("Id", id));
			cr.add(Restrictions.eq("Part", part));
			Practice practice = (Practice) cr.uniqueResult();
			if (practice != null) {
				Audio audio = practice.getAudio();
				if (part == 3) {
					Set<Part3> part3 = audio.getPart3();
					audio.setPart3(part3);
				} else if (part == 1) {
					Set<Part1> part1 = audio.getPart1();
					audio.setPart1(part1);
				} else if (part == 2) {
					Set<Part2> part2 = audio.getPart2();
					audio.setPart2(part2);
				}else if (part == 4) {
					Set<Part4> part4 = audio.getPart4();
					audio.setPart4(part4);
				}
				practice.setAudio(audio);
			}
			return practice;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Transactional
	public Set<Paragraph> getParagraphList(int id, byte part) {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Practice.class);

		cr.add(Restrictions.eq("Id", id));

		Practice practice = (Practice) cr.uniqueResult();
		Set<Paragraph> temp=practice.getListParagraph();
		
		System.out.println("done");
		return temp;
	}

}
