package com.bktoeic.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

@Entity
public class Discussion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String Title;

	@Column(name = "ContentDiscussion")
	private String Content;

	@Column(nullable = true)
	private String Image;

	private Timestamp Time;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "UserID",nullable=false,foreignKey=@ForeignKey(name="FK_Discussion_Account"))
	private Account user;

	@Column(name = "AccessCount")
	private long View;

	private byte Active;

	@OneToMany(mappedBy = "discussion", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@OrderBy("Id desc")
	private Set<Comment> commentList =new HashSet<>();

	@OneToMany(mappedBy = "reportedDiscussion", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Report> reportList = new HashSet<>();

	public final Set<Comment> getCommentList() {
		return commentList;
	}

	public final void setCommentList(Set<Comment> commentList) {
		this.commentList = commentList;
	}

	public final Set<Report> getReportList() {
		return reportList;
	}

	public final void setReportList(Set<Report> reportList) {
		this.reportList = reportList;
	}

	public final void setUser(Account user) {
		this.user = user;
	}

	public final Account getUser() {
		return user;
	}

	public final int getId() {
		return Id;
	}

	public final void setId(int id) {
		Id = id;
	}

	public final String getTitle() {
		return Title;
	}

	public final void setTitle(String title) {
		Title = title;
	}

	public final String getContent() {
		return Content;
	}

	public final void setContent(String content) {
		Content = content;
	}

	public final String getImage() {
		return Image;
	}

	public final void setImage(String image) {
		Image = image;
	}

	public final Timestamp getTime() {
		return Time;
	}

	public final void setTime(Timestamp time) {
		Time = time;
	}

	public final long getView() {
		return View;
	}

	public final void setView(long view) {
		View = view;
	}

	public final byte getActive() {
		return Active;
	}

	public final void setActive(byte active) {
		Active = active;
	}

}
