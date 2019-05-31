package com.bktoeic.service;

import java.util.List;
import java.util.Set;

import com.bktoeic.model.Account;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Discussion;
import com.bktoeic.model.ReplyComment;
import com.bktoeic.model.Report;
import com.bktoeic.model.Test;

public interface userService {
	public Account checkAccount(String username,String pass);
	public boolean register(Account account);
	public boolean updateUser(Account account);
	
	public int getNumberPage(String type,int pageSize);
	
	public List<Discussion> getDiscussionList();
	public Discussion getDiscussion(int id);
	public boolean addDiscussion(Discussion discussion);
	public boolean updateDiscussion(Discussion discussion);
	public boolean deleteDiscussion(int id);
	
	public List<Comment> getListComment(int page,int pageSize,int discussionID);
	public Comment getComment(int id);
	public boolean addComment(Comment comment);
	public boolean updateComment(Comment comment);
	public boolean deleteComment(int id);
	
	public List<ReplyComment> getListReplyComment(int page,int pageSize,int commentID);
	public ReplyComment getReplyComment(int id);
	public ReplyComment addReplyComment(ReplyComment reply);
	public boolean updateReplyComment(ReplyComment reply);
	public boolean deleteReplyComment(int id);
	
	public boolean report(Report report);
	
	// TEST
	public Test getTest(int testID,boolean increase,Account user);
	public <T> Set<T> getPartTest(byte part,int testID);
	public List<Test> getTestList();
	
	//SEARCH
	public <T> List<T> search(String type,String key,int page,byte pageSize);
	public int searchNumbPage(String type,String key,int pageSize);
	
}
