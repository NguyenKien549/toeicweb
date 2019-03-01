package com.bktoeic.service;

import java.util.List;

import com.bktoeic.model.Account;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Discussion;
import com.bktoeic.model.Report;

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
	
	public Comment getComment(int id);
	public boolean addComment(Comment comment);
	public boolean updateComment(Comment comment);
	public boolean deleteComment(int id);
	
	public boolean report(Report report);
}
