package com.bktoeic.model;

import java.sql.Timestamp;

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

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	@Column(name = "ContentComment")
	private String Content;

	private String Image;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "UserID", nullable = false, foreignKey = @ForeignKey(name = "FK_Comment_Account"))
	private Account user;

	private Timestamp Time;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "DiscussionID", nullable = false)
	private Discussion discussion;

	@JsonManagedReference
	@OneToMany(mappedBy = "comment", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<ReplyComment> replies;

	private byte Active;

	public final Set<ReplyComment> getReplies() {
		return replies;
	}

	public final void setReplies(Set<ReplyComment> replies) {
		this.replies = replies;
	}

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

	public final String getImage() {
		return Image;
	}

	public final void setImage(String image) {
		Image = image;
	}

	public final Account getUser() {
		return user;
	}

	public final void setUser(Account user) {
		this.user = user;
	}

	public final Timestamp getTime() {
		return Time;
	}

	public final void setTime(Timestamp time) {
		Time = time;
	}

	public final Discussion getDiscussion() {
		return discussion;
	}

	public final void setDiscussion(Discussion discussion) {
		this.discussion = discussion;
	}

	public final byte getActive() {
		return Active;
	}

	public final void setActive(byte active) {
		Active = active;
	}

}
