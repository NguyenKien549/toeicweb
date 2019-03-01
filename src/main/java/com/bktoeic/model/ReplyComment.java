package com.bktoeic.model;

import java.sql.Timestamp;
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

@Entity
public class ReplyComment {

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

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "RepliedCommentID", nullable = true)
	private Comment comment;

	private byte Active;

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

	public final Comment getComment() {
		return comment;
	}

	public final void setComment(Comment comment) {
		this.comment = comment;
	}

	public final byte getActive() {
		return Active;
	}

	public final void setActive(byte active) {
		Active = active;
	}

}
