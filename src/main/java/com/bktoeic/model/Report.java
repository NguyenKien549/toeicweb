package com.bktoeic.model;

import java.sql.Timestamp;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	@Column(name="ContentReport")
	private String Content;
	
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="UserID",nullable=false)
	private Account user;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="ReportedDiscussionID",nullable=true)
	private Discussion reportedDiscussion;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="ReportedCommentID",nullable=true)
	private Comment reportedComment;
	
	private Timestamp Time;

	public final int getId() {
		return Id;
	}

	public final void setId(int id) {
		Id = id;
	}

	public final String getContent() {
		return Content;
	}

	public final void setContent(String content) {
		Content = content;
	}

	public final Account getUser() {
		return user;
	}

	public final void setUser(Account user) {
		this.user = user;
	}

	public final Discussion getReportedDiscussion() {
		return reportedDiscussion;
	}

	public final void setReportedDiscussion(Discussion reportedDiscussion) {
		this.reportedDiscussion = reportedDiscussion;
	}

	public final Comment getReportedComment() {
		return reportedComment;
	}

	public final void setReportedComment(Comment reportedComment) {
		this.reportedComment = reportedComment;
	}

	public final Timestamp getTime() {
		return Time;
	}

	public final void setTime(Timestamp time) {
		Time = time;
	}
	
	
}
