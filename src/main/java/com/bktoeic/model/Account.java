package com.bktoeic.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Account")
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String Name;
	private Date DateOfBirth;
	private String Gender;
	private String Email;
	private String Username;

	private String Password;

	@JsonIgnore
	private String Salt;
	private String Avatar;

	@JsonIgnore
	private String Type;

	@JsonIgnore
	private byte Active;

	@SuppressWarnings("static-access")
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST.MERGE,orphanRemoval=true)
	private Set<Discussion> discussionList;

	@SuppressWarnings("static-access")
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST.MERGE,orphanRemoval=true)
	private Set<Comment> commentList;

	@SuppressWarnings("static-access")
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST.MERGE,orphanRemoval=true)
	private Set<ReplyComment> replies;

	@SuppressWarnings("static-access")
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.MERGE.REFRESH.REMOVE,orphanRemoval=true)
	private Set<Report> reportList;

//	@JsonManagedReference("user_test")
//	@ManyToMany(mappedBy = "users", fetch = FetchType.LAZY)
//	private Set<Test> testList;

//	public final Set<Test> getTestList() {
//		return testList;
//	}
//
//	public final void setTestList(Set<Test> testList) {
//		this.testList = testList;
//	}

	public final Set<ReplyComment> getReplies() {
		return replies;
	}

	public final void setReplies(Set<ReplyComment> replies) {
		this.replies = replies;
	}

	public final Set<Discussion> getDiscussionList() {
		return discussionList;
	}

	public final void setDiscussionList(Set<Discussion> discussionList) {
		this.discussionList = discussionList;
	}

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

	// public final Set<Test> getTestList() {
	// return testList;
	// }
	//
	// public final void setTestList(Set<Test> testList) {
	// this.testList = testList;
	// }

	public final String getAvatar() {
		return Avatar;
	}

	public final void setAvatar(String avatar) {
		Avatar = avatar;
	}

	@JsonIgnore
	public final byte getActive() {
		return Active;
	}

	public final void setActive(byte active) {
		Active = active;
	}

	public Account() {
		super();
	}

	public Account(String name, Date dateOfBirth, String gender, String email, String username, String password,
			String type) {
		super();
		Name = name;
		DateOfBirth = dateOfBirth;
		Gender = gender;
		Email = email;
		Username = username;
		Password = password;
		Type = type;
	}

	@JsonIgnore
	public final String getSalt() {
		return Salt;
	}

	public final void setSalt(String salt) {
		Salt = salt;
	}

	@JsonIgnore
	public final int getId() {
		return Id;
	}

	public final void setId(int id) {
		Id = id;
	}

	public final String getName() {
		return Name;
	}

	public final void setName(String name) {
		Name = name;
	}

	public final Date getDateOfBirth() {
		return DateOfBirth;
	}

	public final void setDateOfBirth(Date dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}

	public final String getGender() {
		return Gender;
	}

	public final void setGender(String gender) {
		Gender = gender;
	}

	public final String getEmail() {
		return Email;
	}

	public final void setEmail(String email) {
		Email = email;
	}

	public final String getUsername() {
		return Username;
	}

	public final void setUsername(String username) {
		Username = username;
	}

	@JsonIgnore
	public final String getPassword() {
		return Password;
	}

	public final void setPassword(String password) {
		Password = password;
	}

	@JsonIgnore
	public final String getType() {
		return Type;
	}

	public final void setType(String type) {
		Type = type;
	}

}
