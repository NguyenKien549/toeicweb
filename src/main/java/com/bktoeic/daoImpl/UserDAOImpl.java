package com.bktoeic.daoImpl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bktoeic.dao.UserDAO;
import com.bktoeic.model.Account;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Discussion;
import com.bktoeic.model.Part1;
import com.bktoeic.model.Part2;
import com.bktoeic.model.Part3;
import com.bktoeic.model.Part4;
import com.bktoeic.model.Part5;
import com.bktoeic.model.Part6;
import com.bktoeic.model.Part7;
import com.bktoeic.model.Report;
import com.bktoeic.serviceImpl.MD5Lib;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Account checkAccount(String username, String pass) {
		Account acc = new Account();
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria cr = session.createCriteria(Account.class);
			cr.add(Restrictions.like("Username", username));
			acc = (Account) cr.uniqueResult();
			if (MD5Lib.md5_pass_salt(pass, acc.getSalt()).equals(acc.getPassword()) && acc.getActive() == 1) {
				System.out.println("login");
				return acc;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public boolean register(Account account) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(account);
			System.out.println("register done...");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Transactional
	public boolean updateUser(Account account) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "UPDATE Account SET Name = :name, DateOfBirth=:DateOfBirth,Gender=:Gender,"
				+ "Email=:Email where Id=:Id";
		Query query = (Query) session.createQuery(hql);
		query.setParameter("name", account.getName());
		query.setParameter("DateOfBirth", account.getDateOfBirth());
		query.setParameter("Gender", account.getGender());
		query.setParameter("Email", account.getEmail());
		query.setParameter("Id", account.getId());
		int a = query.executeUpdate();
		if (a > 0) {
			System.out.println("update account done.");
			return true;
		}
		System.out.println("update fail");
		return false;
	}

	@Transactional
	public int getNumberPage(String type,int pageSize) { // ham moi them
		Session session = sessionFactory.getCurrentSession();
		int numb=0;
		if(type.equals("account")) {
			numb = session.createCriteria(Account.class).list().size();
		}
		if(type.equals("part1")) {
			numb = session.createCriteria(Part1.class).list().size();
		}
		if(type.equals("part2")) {
			numb = session.createCriteria(Part2.class).list().size();
		}
		if(type.equals("part3")) {
			numb = session.createCriteria(Part3.class).list().size();
		}
		if(type.equals("part4")) {
			numb = session.createCriteria(Part4.class).list().size();
		}
		if(type.equals("part5")) {
			numb = session.createCriteria(Part5.class).list().size();
		}
		if(type.equals("part6")) {
			numb = session.createCriteria(Part6.class).list().size();
		}
		if(type.equals("part7")) {
			numb = session.createCriteria(Part7.class).list().size();
		}
		
		int numbPage = numb / pageSize;
		if (numb % pageSize != 0) {
			numbPage++;
		}
		System.out.println(numbPage);
		return numbPage;
	}

	// PHAN LIEN QUAN DEN FORUM

	// lay danh sach bai thao luan tren forum
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Discussion> getDiscussionList() {
		List<Discussion> list = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria cr = session.createCriteria(Discussion.class);
			list = cr.list();

			if (!list.isEmpty()) {
				System.out.println("get list discussion done");
				for (Discussion discussion : list) {
					if (discussion.getActive() == 0)
						list.remove(discussion);
				}
			}
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return list;
	}

	// lay mot bai thao luan
	@Transactional
	public Discussion getDiscussion(int id) {

		try {
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(Discussion.class);
			cr.add(Restrictions.eq("Id", id));
			Discussion discussion = (Discussion) cr.uniqueResult();
			if (discussion.getActive() == 0) {
				System.out.println("BTL bi vo hieu hoa");
				return null;
			}
			Set<Comment> listComment = discussion.getCommentList();
			
			//loai bo nhung comment bi vo hieu hoa
			Iterator<Comment> ite=listComment.iterator();
			while(ite.hasNext()) {
				Comment temp=ite.next();
				if(temp.getActive()==0)
					ite.remove();
			}
			discussion.setCommentList(listComment);
			return discussion;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean addDiscussion(Discussion discussion) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean updateDiscussion(Discussion discussion) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean deleteDiscussion(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	// LIEN QUAN DEN COMMENT
	@Transactional
	public boolean addComment(Comment comment) {
		try {
			Session session = sessionFactory.openSession();

			session.save(comment);

			Criteria cr1=session.createCriteria(Account.class);
			cr1.add(Restrictions.eq("Id", comment.getUser().getId()));
			Account temp2= (Account) cr1.uniqueResult();
			temp2.getCommentList().add(comment);
			session.merge(temp2);
			
			Criteria cr2=session.createCriteria(Discussion.class);
			cr2.add(Restrictions.eq("Id",comment.getDiscussion().getId() ));
			Discussion discuss=(Discussion) cr2.uniqueResult();
			discuss.getCommentList().add(comment);
			session.merge(discuss);
			System.out.println("comment done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("loi khi them comment");
		}
		return false;
	}

	@Transactional
	public boolean updateComment(Comment comment) {
		try {
			Session session =sessionFactory.getCurrentSession();
			session.merge(comment);
			System.out.println("update done");
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		System.out.println("update fail");
		return false;
	}

	@Transactional
	public boolean deleteComment(int id) {
		try {
			Session session= sessionFactory.getCurrentSession();
			Criteria cr=session.createCriteria(Comment.class);
			cr.add(Restrictions.eq("Id", id));
			Comment comment=(Comment) cr.uniqueResult();
			if(comment!=null) {
				comment.setActive((byte) 0);
				session.merge(comment);
				System.out.println("delete done");
			}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return false;
		
	}

	@Transactional
	public Comment getComment(int id) {
		Session session= sessionFactory.getCurrentSession();
		Criteria cr=session.createCriteria(Comment.class);
		cr.add(Restrictions.eq("Id", id));
		Comment comment=(Comment) cr.uniqueResult();
		if(comment != null && comment.getActive()==1) {
			System.out.println("get comment done");
			return comment;
		}
		return null;
	}

	@Transactional
	public boolean report(Report report) {
		try {
			Session session= sessionFactory.getCurrentSession();
			session.save(report);
			System.out.println("report done");
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}
}
