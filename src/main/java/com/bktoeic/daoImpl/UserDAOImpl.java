package com.bktoeic.daoImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bktoeic.dao.UserDAO;
import com.bktoeic.model.Account;
import com.bktoeic.model.Audio;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Discussion;
import com.bktoeic.model.Paragraph;
import com.bktoeic.model.Part1;
import com.bktoeic.model.Part2;
import com.bktoeic.model.Part3;
import com.bktoeic.model.Part4;
import com.bktoeic.model.Part5;
import com.bktoeic.model.Part6;
import com.bktoeic.model.Part7;
import com.bktoeic.model.Practice;
import com.bktoeic.model.ReplyComment;
import com.bktoeic.model.Report;
import com.bktoeic.model.Test;
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

	//get number page with type 
	@Transactional
	public int getNumberPage(String type, int pageSize) { // ham moi them
		Session session = sessionFactory.getCurrentSession();
		int numb = 0;
		switch (type) {
		case "account":
			numb = session.createCriteria(Account.class).list().size();
			break;
		case "practice":
			numb = session.createCriteria(Practice.class).list().size();
			break;
		case "test":
			numb = session.createCriteria(Test.class).list().size();
			break;
		case "part1":
			numb = session.createCriteria(Part1.class).list().size();
			break;
		case "part2":
			numb = session.createCriteria(Part2.class).list().size();
			break;
		case "part3":
			numb = session.createCriteria(Part3.class).list().size();
			break;
		case "part4":
			numb = session.createCriteria(Part4.class).list().size();
			break;
		case "part5":
			numb = session.createCriteria(Part5.class).list().size();
			break;
		case "part6":
			numb = session.createCriteria(Part6.class).list().size();
			break;
		case "part7":
			numb = session.createCriteria(Part7.class).list().size();
			break;
		case "audio":
			numb = session.createCriteria(Audio.class).list().size();
			break;
		case "paragraph":
			numb = session.createCriteria(Paragraph.class).list().size();
			break;
		default:
			System.out.println("Input type invalid!");
			break;
		}

		int numbPage = numb / pageSize;
		if (numb % pageSize != 0) {
			numbPage++;
		}
		System.out.println("total page:" + numbPage);
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
			cr.add(Restrictions.eq("Active", (byte) 1));
			list = cr.list();

			if (!list.isEmpty()) {
				System.out.println("get list discussion done");
			}
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return list;
	}

	// lay mot bai thao luan
	@SuppressWarnings("unchecked")
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
			Criteria cr2 = session.createCriteria(Comment.class);
			cr2.add(Restrictions.eq("discussion", discussion));
			cr2.add(Restrictions.eq("Active", (byte)1));
			cr2.addOrder(Order.desc("Id"));
			cr2.setFirstResult(0);
			cr2.setMaxResults(20);
			ArrayList<Comment> listComment =  (ArrayList<Comment>) cr2.list();
			Set<Comment> temp=new HashSet<>();
			temp.addAll(listComment);
			discussion.setCommentList(temp);
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

			Criteria cr1 = session.createCriteria(Account.class);
			cr1.add(Restrictions.eq("Id", comment.getUser().getId()));
			Account temp2 = (Account) cr1.uniqueResult();
			temp2.getCommentList().add(comment);
			session.merge(temp2);

			Criteria cr2 = session.createCriteria(Discussion.class);
			cr2.add(Restrictions.eq("Id", comment.getDiscussion().getId()));
			Discussion discuss = (Discussion) cr2.uniqueResult();
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
			Session session = sessionFactory.getCurrentSession();
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
			Session session = sessionFactory.getCurrentSession();
			Criteria cr = session.createCriteria(Comment.class);
			cr.add(Restrictions.eq("Id", id));
			Comment comment = (Comment) cr.uniqueResult();
			if (comment != null) {
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
		Session session = sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(Comment.class);
		cr.add(Restrictions.eq("Id", id));
		Comment comment = (Comment) cr.uniqueResult();
		if (comment != null && comment.getActive() == 1) {
			System.out.println("get comment done");
			return comment;
		}
		return null;
	}

	@Transactional
	public boolean report(Report report) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(report);
			System.out.println("report done");
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		System.out.println("report error");
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getListComment(int page, int pageSize,int discussionID) {
		Session session = sessionFactory.openSession();
		try {
			Criteria cr =session.createCriteria(Comment.class);
			
			cr.add(Restrictions.eq("discussion", getDiscussion(discussionID)));
			cr.add(Restrictions.eq("Active", (byte) 1));
			cr.setFirstResult(pageSize *(page-1));
			cr.setMaxResults(pageSize);
			List<Comment> listComment = cr.list();
			System.out.println("get comment page " +page);
			return listComment;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ReplyComment> getListReplyComment(int page, int pageSize, int commentID) {
		try {
			Session session = sessionFactory.openSession();
			Criteria cr =session.createCriteria(ReplyComment.class);
			cr.add(Restrictions.eq("Active", (byte) 1));
			Comment comment = getComment(commentID);
			cr.add(Restrictions.eq("comment", comment));
			cr.setFirstResult(pageSize *(page-1));
			cr.setMaxResults(pageSize);
			cr.addOrder(Order.desc("Time"));
			List<ReplyComment> replies = cr.list();
			System.out.println("get reply page " +page);
			return replies;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//reply comment in discussion

	@Override
	@Transactional
	public ReplyComment getReplyComment(int id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria cr = session.createCriteria(ReplyComment.class);
			cr.add(Restrictions.eq("Id", id));
			ReplyComment reply= (ReplyComment) cr.uniqueResult();
			if(reply!=null) System.out.println("get reply done");
			return reply;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("reply null");
		return null;
	}

	@Override
	@Transactional
	public ReplyComment addReplyComment(ReplyComment reply) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(reply);
			System.out.println("save done");
			return reply;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	@Transactional
	public boolean updateReplyComment(ReplyComment reply) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.merge(reply);
			System.out.println("update done");
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		System.out.println("update fail");
		return false;
	}

	@Override
	@Transactional
	public boolean deleteReplyComment(int id) {
		try {
			ReplyComment delReply = getReplyComment(id);
			Session session=sessionFactory.getCurrentSession();
			delReply.setActive((byte) 0);
			session.merge(delReply);
			System.out.println("delete reply done!");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public Test getTest(int testID) {
		try {
			Session session=sessionFactory.openSession();
			Criteria cr = session.createCriteria(Test.class);
			cr.add(Restrictions.eq("Id", testID));
			Test result = (Test) cr.uniqueResult();
			if(result !=null ) System.out.println("get test done");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("test error");
		return null;
	}

	@Override
	@Transactional
	public <T> Set<T> getPartTest(byte part, int testID) {
//		try {
//			Session session=sessionFactory.getCurrentSession();
//			Criteria cr = session.createCriteria(Test.class);
//			cr.add(Restrictions.eq("Id", testID));
//			Test result = (Test) cr.uniqueResult();
//			if()
//			return result;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("test error");
		return null;
	}
}
