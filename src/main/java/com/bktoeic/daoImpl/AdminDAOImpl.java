package com.bktoeic.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bktoeic.dao.AdminDAO;
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

@Repository("adminDAO")
public class AdminDAOImpl<T> implements AdminDAO<T> {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("rawtypes")
	@Transactional
	public boolean save(T obj) {
		Session session = sessionFactory.getCurrentSession();
		try {
			if (obj instanceof Audio || obj instanceof Paragraph || obj instanceof Practice || obj instanceof Test) {

				session.persist(obj);
				System.out.println("persist");
				return true;
			} else if (obj instanceof List<?>) {
				for (Object doc : (List) obj) {
					session.persist(doc);
				}
				System.out.println("persist done " + obj.getClass());
				return true;
			}
			System.out.println("DAOImpl fail" + obj.getClass());
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
			if (obj instanceof Part5) {
				session.merge(obj);
			} else if (obj instanceof Part1) {
				Part1 temp = (Part1) session.merge(obj);
				session.update(temp);
			} else if (obj instanceof Part2) {
				Part2 temp = (Part2) session.merge(obj);
				session.update(temp);
			} else if (obj instanceof Part3) {
				Part3 temp = (Part3) session.merge(obj);
				session.update(temp);
			} else if (obj instanceof Part4) {
				Part4 temp = (Part4) session.merge(obj);
				session.update(temp);
			} else if (obj instanceof Part6) {
				Part6 temp = (Part6) session.merge(obj);
				session.update(temp);
			} else if (obj instanceof Part7) {
				Part7 temp = (Part7) session.merge(obj);
				session.update(temp);
			} else if (obj instanceof Audio) {
				Audio temp = (Audio) session.get(Audio.class, ((Audio) obj).getId());
				if (((Audio) obj).getPart1().isEmpty() && ((Audio) obj).getPart2().isEmpty()
						&& ((Audio) obj).getPart3().isEmpty() && ((Audio) obj).getPart4().isEmpty()) {
					((Audio) obj).setPart1(temp.getPart1());
					((Audio) obj).setPart2(temp.getPart2());
					((Audio) obj).setPart3(temp.getPart3());
					((Audio) obj).setPart4(temp.getPart4());
					((Audio) obj).setPractice(temp.getPractice());
					((Audio) obj).setTest(temp.getTest());
					Audio temp2 = (Audio) session.merge(obj);
					session.update(temp2);
					System.out.println("update script");
				} else {
					System.out.println(((Audio) obj).getPart1());
					((Audio) obj).setAudio(temp.getAudio());
					((Audio) obj).setScript(temp.getScript());
					((Audio) obj).setPractice(temp.getPractice());
					((Audio) obj).setTest(temp.getTest());
					Audio temp2 = (Audio) session.merge(obj);
					session.update(temp2);
					System.out.println("update question");
				}

			} else if (obj instanceof Paragraph) {
				Paragraph para = (Paragraph) session.get(Paragraph.class, ((Paragraph) obj).getId());
				if (((Paragraph) obj).getPart6() == null && ((Paragraph) obj).getPart7() == null) {
					((Paragraph) obj).setPart6(para.getPart6());
					((Paragraph) obj).setPart7(para.getPart7());
					((Paragraph) obj).setPractice(para.getPractice());
					((Paragraph) obj).setTest(para.getTest());
					session.merge(obj);
					System.out.println("update paragraph");
				} else {
					((Paragraph) obj).setParagraph(para.getParagraph());
					((Paragraph) obj).setPractice(para.getPractice());
					((Paragraph) obj).setTest(para.getTest());
					session.merge(obj);
					System.out.println("update question");
				}
			}else if(obj instanceof Practice) {
				Practice prac = (Practice) session.get(Practice.class,((Practice) obj).getId());
				if(((Practice) obj).getPart() != prac.getPart()) {
					
					Audio audio = prac.getAudio();
					if(audio != null) {
						audio.setPractice(null);
						session.merge(audio);
					}
					
					
					for (Part5 part5 : prac.getListPart5()) {
						part5.setPractice(null);
						session.merge(part5);
					}
					
					for (Paragraph para : prac.getListParagraph()) {
						para.setPractice(null);
						session.merge(para);
					}
					
					session.merge(obj);
					System.out.println("update succ");
					return true;
				}
				if(((Practice) obj).getListPart5() != null && ((Practice) obj).getListParagraph() !=null
						&& ((Practice) obj).getAudio()!=null) {
					((Practice) obj).setListParagraph(prac.getListParagraph());
					((Practice) obj).setListPart5(prac.getListPart5());
					((Practice) obj).setAudio(prac.getAudio());
				}
				session.merge(obj);
			}else if(obj instanceof Test) {
				Test test = (Test) session.get(Test.class, ((Test) obj).getId());
//				((Test) obj).setAudio(test.getAudio());
//				((Test) obj).setListPart5(test.getListPart5());
//				((Test) obj).setListParagraph(test.getListParagraph());
//				session.merge(obj);
				test.setTitle(((Test) obj).getTitle());
				test.setCode(((Test) obj).getCode());
				session.merge(test);
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
					for (Comment comment : delAcc.getCommentList()) {
						comment.setUser(null);
						// comment.setActive((byte) 0);
						session.merge(comment);
					}
					for (ReplyComment reply : delAcc.getReplies()) {
						reply.setUser(null);
						session.merge(reply);
					}
					for (Report report : delAcc.getReportList()) {
						report.setUser(null);
						session.merge(report);
					}
					session.delete(delAcc);
				}

			} else if (type.equals("part1")) {
				for (int i = 0; i < ids.length; i++) {
					Part1 delPart1 = (Part1) session.get(Part1.class, ids[i]);
					Audio audio = delPart1.getAudioPart1();
					if(audio!=null) {
//						audio.getPart1().remove(delPart1);
//						session.merge(audio);
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}else {
						session.delete(delPart1);
					}
					
				}
			} else if (type.equals("part2")) {
				for (int i = 0; i < ids.length; i++) {
					Part2 delPart2 = (Part2) session.get(Part2.class, ids[i]);
					Audio audio = delPart2.getAudioPart2();
					if(audio!=null) {
//						audio.getPart2().remove(delPart2);
//						session.merge(audio);
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}else {
						session.delete(delPart2);
					}
				}
			} else if (type.equals("part3")) {
				for (int i = 0; i < ids.length; i++) {
					Part3 del = (Part3) session.get(Part3.class, ids[i]);
					Audio audio = del.getAudioPart3();
					if(audio!=null) {
//						audio.getPart3().remove(del);
//						session.merge(audio);
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}else {
						session.delete(del);
					}
				}
			} else if (type.equals("part4")) {
				for (int i = 0; i < ids.length; i++) {
					Part4 del = (Part4) session.get(Part4.class, ids[i]);
					Audio audio = del.getAudioPart4();
					if(audio!=null) {
//						audio.getPart4().remove(del);
//						session.merge(audio);
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}else {
						session.delete(del);
					}
				}
			} else if (type.equals("part5")) {
				for (int i = 0; i < ids.length; i++) {
					Part5 delQuestion = (Part5) session.get(Part5.class, ids[i]);
					if(delQuestion.getPractice() != null || delQuestion.getTest() !=null) {
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}
					session.delete(delQuestion);
				}
			} else if (type.equals("part6")) {
				for (int i = 0; i < ids.length; i++) {
					Part6 delQuestion = (Part6) session.get(Part6.class, ids[i]);
					if(delQuestion.getParagraph() != null) {
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}
					session.delete(delQuestion);
				}
			} else if (type.equals("part7")) {
				for (int i = 0; i < ids.length; i++) {
					Part7 delQuestion = (Part7) session.get(Part7.class, ids[i]);
					if(delQuestion.getParagraph() != null) {
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}
					session.delete(delQuestion);
				}
			} else if (type.equals("audio")) {
				for (int i = 0; i < ids.length; i++) {
					Audio del = (Audio) session.get(Audio.class, ids[i]);
					if(del.getPractice() != null || del.getTest() !=null) {
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}
					for (Part1 part1 : del.getPart1()) {
						part1.setAudioPart1(null);
						session.merge(part1);
					}
					for (Part2 part2 : del.getPart2()) {
						part2.setAudioPart2(null);
						session.merge(part2);
					}
					for (Part3 part3 : del.getPart3()) {
						part3.setAudioPart3(null);
						session.merge(part3);
					}
					for (Part4 part4 : del.getPart4()) {
						part4.setAudioPart4(null);
						session.merge(part4);
					}
					session.delete(del);
				}
			} else if (type.equals("paragraph")) {
				for (int i = 0; i < ids.length; i++) {
					Paragraph del = (Paragraph) session.get(Paragraph.class, ids[i]);
					if(del.getPractice() != null || del.getTest() !=null) {
						System.out.println("dang nam trong bai hoc k xoa dc");
						return false;
					}
					for (Part6 part6 : del.getPart6()) {
						part6.setParagraph(null);
						session.merge(part6);
					}
					for (Part7 part7 : del.getPart7()) {
						part7.setParagraph(null);
						session.merge(part7);
					}
					session.delete(del);
				}
			} else if (type.equals("discussion")) {
				for (int i = 0; i < ids.length; i++) {
					Discussion delDiscuss = (Discussion) session.get(Discussion.class, ids[i]);
					session.delete(delDiscuss);
				}
			}else if (type.equals("practice")) {
				for (int i : ids) {
					Practice practice = (Practice) session.get(Practice.class, i);
					Audio audio = practice.getAudio();
					if(audio!=null) {
						audio.setPractice(null);
						session.merge(audio);
					}
					
					
					for (Paragraph  para : practice.getListParagraph()) {
						para.setPractice(null);
						session.merge(para);
					}
					
					for (Part5 part5 : practice.getListPart5()) {
						part5.setPractice(null);
						session.merge(part5);
					}
					session.delete(practice);
				}
			}else if (type.equals("test")) {
				for (int i : ids) {
					Test test = (Test) session.get(Test.class, i);
					Audio audio = test.getAudio();
					if(audio!=null) {
						audio.setTest(null);
						session.merge(audio);
					}
					
					
					for (Paragraph  para : test.getListParagraph()) {
						para.setTest(null);
						session.merge(para);
					}
					
					for (Part5 part5 : test.getListPart5()) {
						part5.setTest(null);
						session.merge(part5);
					}
					session.delete(test);
				}
			}else if(type.equals("report")){
				for (int i : ids) {
					Report report = (Report) session.get(Report.class, i);
					if(report.getReportedComment() != null) {
						Comment comment = report.getReportedComment();
						comment.getReports().remove(report);
						session.merge(comment);
					}else if(report.getReportedDiscussion() != null) {
						Discussion discuss = report.getReportedDiscussion();
						discuss.getReportList().remove(report);
						session.merge(discuss);
					}else if(report.getReportedReplyComment() !=null) {
						ReplyComment reply = report.getReportedReplyComment();
						reply.getReports().remove(report);
						session.merge(reply);
					}
					Account acc = report.getUser();
					acc.getReportList().remove(report);
					session.update(acc);
					System.out.println("delete report done");
				}
			}else {
				System.out.println("invalid type");
			}
			System.out.println("delete done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("delete fail");
		return false;
	}

	// get list entity with 'type'
	@SuppressWarnings("unchecked")
	@Transactional
	public List<T> getList(String type, int page, int pageSize) {
		Session session = sessionFactory.openSession();
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
			case "discussion":
				cr = session.createCriteria(Discussion.class);
				break;
			case "report":
				cr = session.createCriteria(Report.class);
				break;
			default:
				System.out.println("Input type invalid!");
				break;
			}
			cr.setFirstResult(pageSize * (page - 1));
			cr.setMaxResults(pageSize);
			List<T> list = cr.list();
			if (!list.isEmpty()) {
				System.out.println("page list: " + list.size());
				return list;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		System.out.println("get null");
		return null;
	}

	@Override
	@Transactional
	public boolean lock(String type, Integer[] ids) {
		Session session = sessionFactory.getCurrentSession();
		try {
			for (int i : ids) {
				if (type == "discussion") {
					Discussion discussion = (Discussion) session.get(Discussion.class, i);
					discussion.setActive((byte) 0);
					session.merge(discussion);
				} else if (type == "account") {
					Account acc = (Account) session.get(Account.class, i);
					acc.setActive((byte) 0);
					session.merge(acc);
				}
			}
			System.out.println("done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	@Transactional
	public boolean unlock(String type, Integer[] ids) {
		Session session = sessionFactory.getCurrentSession();
		try {
			for (int i : ids) {
				if (type == "discussion") {
					Discussion discussion = (Discussion) session.get(Discussion.class, i);
					discussion.setActive((byte) 1);
					session.merge(discussion);
				} else if (type == "account") {
					Account acc = (Account) session.get(Account.class, i);
					acc.setActive((byte) 1);
					session.merge(acc);
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public T getObject(String type, int id) {
		Session session = sessionFactory.openSession();
		if (type.equals("audio")) {
			return (T) session.get(Audio.class, id);
		} else if (type.equals("paragraph")) {
			return (T) session.get(Paragraph.class, id);
		} else if (type.equals("practice")) {
			return (T) session.get(Practice.class, id);
		} else if (type.equals("test")) {
			return (T) session.get(Test.class, id);
		}
		System.out.println("get object fail");
		return null;
	}

	@SuppressWarnings({ "unchecked" })
	@Override
	@Transactional
	public List<T> getQuestion(String type) {
		List<T> list = null;
		Criteria cr = null;
		try {
			Session session = sessionFactory.getCurrentSession();

			if (type.equals("part1")) {
				cr = session.createCriteria(Part1.class);
				cr.add(Restrictions.isNull("audioPart1"));
			} else if (type.equals("part2")) {
				cr = session.createCriteria(Part2.class);
				cr.add(Restrictions.isNull("audioPart2"));
			} else if (type.equals("part3")) {
				cr = session.createCriteria(Part3.class);
				cr.add(Restrictions.isNull("audioPart3"));
			} else if (type.equals("part4")) {
				cr = session.createCriteria(Part4.class);
				cr.add(Restrictions.isNull("audioPart4"));
			} else if (type.equals("part6")) {
				cr = session.createCriteria(Part6.class);
				cr.add(Restrictions.isNull("paragraph"));
			} else if (type.equals("part7")) {
				cr = session.createCriteria(Part7.class);
				cr.add(Restrictions.isNull("paragraph"));
			} else if (type.equals("test")) {
				boolean check = false;
				list = new ArrayList<>();
				cr = session.createCriteria(Part1.class);
				cr.add(Restrictions.isNull("audioPart1"));
				check = list.add((T) cr.list());
				if (!check)
					return null;
				cr = session.createCriteria(Part2.class);
				cr.add(Restrictions.isNull("audioPart2"));
				if (check)
					check = list.add((T) cr.list());
				else
					return null;
				cr = session.createCriteria(Part3.class);
				cr.add(Restrictions.isNull("audioPart3"));
				if (check)
					check = list.add((T) cr.list());
				else
					return null;
				cr = session.createCriteria(Part4.class);
				cr.add(Restrictions.isNull("audioPart4"));
				if (check)
					list.add((T) cr.list());
				else
					return null;
				System.out.println("get test question");
				return list;
			}

			list = cr.list();
			if (list != null) {
				System.out.println("get question done");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	@Transactional
	public boolean addOrUpdateQuestionToDocument(String type, String part, int id, int[] ids) {
		Session session = sessionFactory.getCurrentSession();
		try {
			if (type.equals("audio")) {
				Audio audio = (Audio) session.get(Audio.class, id);
				for (Part1 i : audio.getPart1()) {
					i.setAudioPart1(null);
					session.merge(i);
				}
				for (Part2 i : audio.getPart2()) {
					i.setAudioPart2(null);
					session.merge(i);
				}
				for (Part3 i : audio.getPart3()) {
					i.setAudioPart3(null);
					session.merge(i);
				}
				for (Part4 i : audio.getPart4()) {
					i.setAudioPart4(null);
					session.merge(i);
				}
				System.out.println("set done");

				if (part.equals("test")) {
					audio.setPart((byte) 8);
					Audio temp = (Audio) session.merge(audio);
					int count = 1;
					Part1 part1 = null;
					Part2 part2 = null;
					Part3 part3 = null;
					Part4 part4 = null;
					for (int i : ids) {
						if (i == 0) {
							count++;
							continue;
						}
						if (count == 1) {
							part1 = (Part1) session.get(Part1.class, i);
							part1.setAudioPart1(temp);
							session.merge(part1);
						} else if (count == 2) {
							part2 = (Part2) session.get(Part2.class, i);
							part2.setAudioPart2(temp);
							session.merge(part2);
						} else if (count == 3) {
							part3 = (Part3) session.get(Part3.class, i);
							part3.setAudioPart3(temp);
							session.merge(part3);
						} else if (count == 4) {
							part4 = (Part4) session.get(Part4.class, i);
							part4.setAudioPart4(temp);
							session.merge(part4);
						} else {
							System.out.println("error test");
						}
					}
				} else if (part.equals("part1")) {
					Part1 part1 = null;
					audio.setPart((byte) 1);
					Audio temp = (Audio) session.merge(audio);
					for (int i : ids) {
						part1 = (Part1) session.get(Part1.class, i);
						part1.setAudioPart1(temp);
						session.merge(part1);
					}
				} else if (part.equals("part2")) {
					audio.setPart((byte) 2);
					Audio temp = (Audio) session.merge(audio);
					Part2 part2 = null;
					for (int i : ids) {
						part2 = (Part2) session.get(Part2.class, i);
						part2.setAudioPart2(temp);
						session.merge(part2);
					}
				} else if (part.equals("part3")) {
					audio.setPart((byte) 3);
					Audio temp = (Audio) session.merge(audio);
					Part3 part3 = null;
					for (int i : ids) {
						part3 = (Part3) session.get(Part3.class, i);
						part3.setAudioPart3(temp);
						session.merge(part3);
					}
				} else if (part.equals("part4")) {
					audio.setPart((byte) 4);
					Audio temp = (Audio) session.merge(audio);
					Part4 part4 = null;
					for (int i : ids) {
						part4 = (Part4) session.get(Part4.class, i);
						part4.setAudioPart4(temp);
						session.merge(part4);
					}
				}
			} else if (type.equals("paragraph")) {
				Paragraph para = (Paragraph) session.get(Paragraph.class, id);

				for (Part6 i : para.getPart6()) {
					i.setParagraph(null);
					session.merge(i);
				}
				for (Part7 i : para.getPart7()) {
					i.setParagraph(null);
					session.merge(i);
				}
				if (part.equals("part6")) {
					para.setPart((byte) 6);
					Paragraph temp = (Paragraph) session.merge(para);
					Part6 part6 = null;

					for (int i : ids) {
						part6 = (Part6) session.get(Part6.class, i);
						part6.setParagraph(temp);
						session.merge(part6);
					}
				} else if (part.equals("part7")) {
					para.setPart((byte) 7);
					Paragraph temp = (Paragraph) session.merge(para);
					Part7 part7 = null;

					for (int i : ids) {
						part7 = (Part7) session.get(Part7.class, i);
						part7.setParagraph(temp);
						session.merge(part7);
					}
				}
			}
			System.out.println("add question");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<T> getDocumentForLesson(String type, String kind) {
		Session session = sessionFactory.openSession();
		Criteria cr = null;
		List<T> list = null;

		try {
			switch (type) {
			case "test":
				cr = session.createCriteria(Audio.class);
				cr.add(Restrictions.eq("Part", (byte) 8));
				cr.add(Restrictions.isNull("test"));
				break;
			case "part1":
				cr = session.createCriteria(Audio.class);
				cr.add(Restrictions.eq("Part", (byte) 1));
				cr.add(Restrictions.isNull("practice"));
				break;
			case "part2":
				cr = session.createCriteria(Audio.class);
				cr.add(Restrictions.eq("Part", (byte) 2));
				cr.add(Restrictions.isNull("practice"));
				break;
			case "part3":
				cr = session.createCriteria(Audio.class);
				cr.add(Restrictions.eq("Part", (byte) 3));
				cr.add(Restrictions.isNull("practice"));
				break;
			case "part4":
				cr = session.createCriteria(Audio.class);
				cr.add(Restrictions.eq("Part", (byte) 4));
				cr.add(Restrictions.isNull("practice"));
				break;
			case "part5":
				cr = session.createCriteria(Part5.class);
				if (kind.equals("practice")) {
					cr.add(Restrictions.isNull("practice"));
				} else if (kind.equals("test")) {
					cr.add(Restrictions.isNull("test"));
				}
				break;
			case "part6":
				cr = session.createCriteria(Paragraph.class);
				cr.add(Restrictions.eq("Part", (byte) 6));
				if (kind.equals("practice")) {
					cr.add(Restrictions.isNull("practice"));
				} else if (kind.equals("test")) {
					cr.add(Restrictions.isNull("test"));
				}
				break;
			case "part7":
				cr = session.createCriteria(Paragraph.class);
				cr.add(Restrictions.eq("Part", (byte) 7));
				if (kind.equals("practice")) {
					cr.add(Restrictions.isNull("practice"));
				} else if (kind.equals("test")) {
					cr.add(Restrictions.isNull("test"));
				}
				break;
			default:
				System.out.println("Input type invalid!");
				break;
			}
			list = cr.list();
			if (list != null) {
				System.out.println("get Audio or para done:" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	@Transactional
	public boolean addorUpdateDocumentForLesson(String type, int id, int[] ids) {
		Session session = sessionFactory.getCurrentSession();
		try {
			if (type.equals("practice")) {
				Practice prac = (Practice) session.get(Practice.class, id);
				
				if (prac.getPart() <= (byte) 4) {
					Audio temp = prac.getAudio();
					if(temp!=null) {
						temp.setPractice(null);
						session.merge(temp);
					}
					
					Audio audio = null;
					for (int i : ids) {
						audio = (Audio) session.get(Audio.class, i);
						audio.setPractice(prac);
						session.merge(audio);
					}
				} else if (prac.getPart() == (byte) 5) {
					if(prac.getListPart5()!=null)
						for (Part5 part5 : prac.getListPart5()) {
							part5.setPractice(null);
							session.merge(part5);
						}
					
					Part5 part5 = null;
					for (int i : ids) {
						part5 = (Part5) session.get(Part5.class, i);
						part5.setPractice(prac);
						session.merge(part5);
					}
				} else if (prac.getPart() <= 7) {
					if(prac.getListParagraph()!=null) {
						for (Paragraph Paragraph : prac.getListParagraph()) {
							Paragraph.setPractice(null);
							session.merge(Paragraph);
						}
					}
					
					Paragraph para = null;
					for (int i : ids) {
						para = (Paragraph) session.get(Paragraph.class, i);
						para.setPractice(prac);
						session.merge(para);
					}
				}else {
					System.out.println("add fail");
					return false;
				}
				
				System.out.println("add document done");
				return true;
				
			} else if (type.equals("test")) {
				Test test = (Test) session.get(Test.class, id);
				
				Audio au = test.getAudio();
				if(au.getId() != ids[0]) {
					au.setTest(null);
					session.merge(au);
				}
				
				for (Part5 i : test.getListPart5()) {
					i.setTest(null);
					session.merge(i);
				}
				
				for (Paragraph i : test.getListParagraph()) {
					i.setTest(null);
					session.merge(i);
				}
				
				int count = 1;
				Audio audio= null;
				Part5 part5=null;
				Paragraph para= null;
				for (int i : ids) {
					if (i == 0) {
						count++;
						continue;
					}
					if (count == 1) {
						audio = (Audio) session.get(Audio.class, i);
						audio.setTest(test);
						session.merge(audio);
					} else if (count == 2) {
						part5 = (Part5) session.get(Part5.class, i);
						part5.setTest(test);
						session.merge(part5);
					} else if (count == 3) {
						para = (Paragraph) session.get(Paragraph.class, i);
						para.setTest(test);
						session.merge(para);
					}  else {
						System.out.println("error update test document");
						return false;
					}
				}
			}
			System.out.println("update test document done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
