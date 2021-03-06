package com.bktoeic.daoImpl;


import java.util.HashSet;

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
			session.persist(account);
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

	// get number page with type
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
		case "discussion":
			numb = session.createCriteria(Discussion.class).list().size();
			break;
		case "report":
			numb = session.createCriteria(Report.class).list().size();
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
			cr.addOrder(Order.desc("Id"));
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
			Discussion discussion = (Discussion) session.get(Discussion.class, id);
			if (discussion.getActive() == 0) {
				System.out.println("BTL bi vo hieu hoa");
				return null;
			}

			long view = discussion.getView();

			Query query = session.createQuery("UPDATE Discussion SET AccessCount =:access WHERE Id=:id");
			query.setParameter("access", view + 1);
			query.setParameter("id", id);
			int i = query.executeUpdate();
			if (i > 0) {
				System.out.println("increase done");
			}

			Criteria cr = session.createCriteria(Comment.class);
			cr.add(Restrictions.eq("discussion", discussion));
			cr.add(Restrictions.eq("Active", (byte) 1));
			cr.addOrder(Order.desc("Id"));
			cr.setFirstResult(0);
			cr.setMaxResults(20);
			List<Comment> listComment = (List<Comment>) cr.list();
			Set<Comment> temp = new HashSet<>();
			temp.addAll(listComment);
			discussion.setCommentList(temp);

			return discussion;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public boolean addDiscussion(Discussion discussion) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(discussion);
			System.out.println("post discussion done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println("loi khi them topic");
		return false;
	}

	@Transactional
	public boolean updateDiscussion(Discussion discussion) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.merge(discussion);
			System.out.println("update done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Transactional
	public boolean deleteDiscussion(int id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Discussion delDiscussion = getDiscussion(id);
			if (delDiscussion != null) {
				delDiscussion.setActive((byte) 0);
				session.merge(delDiscussion);
				System.out.println("delete done");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// LIEN QUAN DEN COMMENT
	@Transactional
	public boolean addComment(Comment comment) {
		try {
			Session session = sessionFactory.openSession();

			session.saveOrUpdate(comment);

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
				comment.getReplies().clear();
				comment.getReports().clear();
				session.delete(comment);
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
		Session session = sessionFactory.openSession();
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
			if (report.getReportedReplyComment() != null) {
				ReplyComment reply = (ReplyComment) session.load(ReplyComment.class,
						report.getReportedReplyComment().getId());
				reply.getReports().add(report);
				session.merge(reply);
			} else if (report.getReportedDiscussion() != null) {
				Discussion discussion = (Discussion) session.load(Discussion.class,
						report.getReportedDiscussion().getId());
				discussion.getReportList().add(report);
				session.merge(discussion);
			}
			System.out.println("report done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("report error");
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getListComment(int page, int pageSize, int discussionID) {
		Session session = sessionFactory.openSession();
		try {
			Criteria cr = session.createCriteria(Comment.class);

			cr.add(Restrictions.eq("discussion", getDiscussion(discussionID)));
			cr.add(Restrictions.eq("Active", (byte) 1));
			cr.addOrder(Order.asc("Id"));
			cr.setFirstResult(pageSize * (page - 1));
			cr.setMaxResults(pageSize);
			List<Comment> listComment = cr.list();
			System.out.println("get comment page " + page);
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
			Criteria cr = session.createCriteria(ReplyComment.class);
			cr.add(Restrictions.eq("Active", (byte) 1));
			Comment comment = getComment(commentID);
			cr.add(Restrictions.eq("comment", comment));
			cr.setFirstResult(pageSize * (page - 1));
			cr.setMaxResults(pageSize);
			cr.addOrder(Order.desc("Time"));
			List<ReplyComment> replies = cr.list();
			System.out.println("get reply page " + page);
			return replies;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// reply comment in discussion

	@Override
	@Transactional
	public ReplyComment getReplyComment(int id) {
		try {
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(ReplyComment.class);
			cr.add(Restrictions.eq("Id", id));
			ReplyComment reply = (ReplyComment) cr.uniqueResult();
			if (reply != null)
				System.out.println("get reply done");
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
			Session session = sessionFactory.getCurrentSession();
			Comment comment = delReply.getComment();
			comment.getReplies().remove(delReply);
			session.merge(comment);
			System.out.println("delete reply done!");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public Test getTest(int testID,boolean increase,Account user) {
		try {
			Session session = sessionFactory.openSession();
			Test result = (Test) session.get(Test.class,testID);
			if(increase) {
				result.getUsers().add(user);
				
				long view = result.getView();
				Query query = session.createQuery("UPDATE Test SET AccessCount =:access WHERE Id=:id");
				query.setParameter("access", view + 1);
				query.setParameter("id", testID);
				int i = query.executeUpdate();
				if (i > 0) {
					System.out.println("increase done");
				}
			}
			if (result != null)
				System.out.println("get test done");
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
		// try {
		// Session session=sessionFactory.getCurrentSession();
		// Criteria cr = session.createCriteria(Test.class);
		// cr.add(Restrictions.eq("Id", testID));
		// Test result = (Test) cr.uniqueResult();
		// if()
		// return result;
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// System.out.println("test error");
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public <T> List<T> search(String type, String key, int page, byte pageSize) {
		try {
			Session session = sessionFactory.openSession();
			if (type.equals("discussion")) {
				Criteria cr = session.createCriteria(Discussion.class);
				cr.add(Restrictions.ilike("Title", "%" + key + "%"));
				cr.setFirstResult(pageSize * (page - 1));
				cr.setMaxResults(pageSize);
				List<Discussion> list = cr.list();
				System.out.println("search done");
				return (List<T>) list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	@Transactional
	public int searchNumbPage(String type, String key, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		int numb = 0;

		try {
			numb = ((Long) session.createQuery("select count(*) from Discussion where Title like '%" + key + "%'")
					.uniqueResult()).intValue();
			
			if (numb % 10 != 0) {
				numb = numb / 10 + 1;
			} else {
				numb = numb / 10;
			}
			System.out.println("numb search: " + numb);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return numb;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Test> getTestList() {
		Session session = sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(Test.class);
		List<Test> list = cr.list();
		return list;
	}
}
