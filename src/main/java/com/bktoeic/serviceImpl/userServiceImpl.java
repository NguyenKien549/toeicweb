package com.bktoeic.serviceImpl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bktoeic.dao.UserDAO;
import com.bktoeic.model.Account;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Discussion;
import com.bktoeic.model.ReplyComment;
import com.bktoeic.model.Report;
import com.bktoeic.model.Test;
import com.bktoeic.service.userService;

@Service("userService")
public class userServiceImpl implements userService {
	
	@Autowired
	private UserDAO userDAO;

	public Account checkAccount(String username, String pass) {
		return userDAO.checkAccount(username, pass);
	}

	public boolean register(Account account) {
		String salt=MD5Lib.createSalt();
		account.setSalt(salt);
		account.setPassword(MD5Lib.md5_pass_salt(account.getPassword(), salt));
		account.setActive((byte) 1);
		account.setType("User");
		return userDAO.register(account);
	}

	public boolean updateUser(Account account) {
		return userDAO.updateUser(account);
	}

	public List<Discussion> getDiscussionList() {
		return userDAO.getDiscussionList();
	}

	public Discussion getDiscussion(int id) {
		return userDAO.getDiscussion(id);
	}

	public boolean addDiscussion(Discussion discussion) {
		discussion.setActive((byte) 1);
		discussion.setTime(new Timestamp(System.currentTimeMillis()));
		return userDAO.addDiscussion(discussion);
	}

	public boolean updateDiscussion(Discussion discussion) {
		return userDAO.updateDiscussion(discussion);
	}

	public boolean deleteDiscussion(int id) {
		return userDAO.deleteDiscussion(id);
	}

	public boolean addComment(Comment comment) {
		comment.setActive((byte) 1);
		comment.setTime(new Timestamp(System.currentTimeMillis()));
		return userDAO.addComment(comment);
	}

	public boolean updateComment(Comment comment) {
		return userDAO.updateComment(comment);
	}

	public boolean deleteComment(int id) {
		return userDAO.deleteComment(id);
	}

	public Comment getComment(int id) {
		return userDAO.getComment(id);
	}

	public boolean report(Report report) {
		report.setTime(new Timestamp(System.currentTimeMillis()));
		return userDAO.report(report);
	}

	public int getNumberPage(String type, int pageSize) {
		return userDAO.getNumberPage(type, pageSize);
	}

	@Override
	public List<Comment> getListComment(int page, int pageSize,int discussionID) {
		return userDAO.getListComment(page, pageSize,discussionID);
	}

	@Override
	public List<ReplyComment> getListReplyComment(int page, int pageSize, int commentID) {
		return userDAO.getListReplyComment(page, pageSize, commentID);
	}

	@Override
	public ReplyComment getReplyComment(int id) {
		return userDAO.getReplyComment(id);
	}

	@Override
	public ReplyComment addReplyComment(ReplyComment reply) {
		reply.setActive((byte) 1);
		reply.setTime(new Timestamp(System.currentTimeMillis()));
		return userDAO.addReplyComment(reply);
	}

	@Override
	public boolean updateReplyComment(ReplyComment reply) {
		return userDAO.updateReplyComment(reply);
	}

	@Override
	public boolean deleteReplyComment(int id) {
		return userDAO.deleteReplyComment(id);
	}

	@Override
	public Test getTest(int testID,boolean increase,Account user) {
		return userDAO.getTest(testID,increase,user);
	}

	@Override
	public <T> Set<T> getPartTest(byte part, int testID) {
		return userDAO.getPartTest(part, testID);
	}

	@Override
	public <T> List<T> search(String type, String key,int page,byte pageSize) {
		return userDAO.search(type, key,page,pageSize);
	}

	@Override
	public int searchNumbPage(String type, String key, int pageSize) {
		return userDAO.searchNumbPage(type, key, pageSize);
	}

	@Override
	public List<Test> getTestList() {
		return userDAO.getTestList();
	}

}
