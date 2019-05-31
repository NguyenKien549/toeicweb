package com.bktoeic.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String Code;

	private String Title;

	@Column(name = "AccessCount")
	private long View;

	@SuppressWarnings("static-access")
	@JsonManagedReference(value = "test_json")
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "test", cascade = CascadeType.PERSIST.MERGE.REFRESH)
	private Audio audio;

	@SuppressWarnings("static-access")
	@JsonManagedReference(value = "paraTest")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "test", cascade = CascadeType.PERSIST.MERGE.REFRESH)
	private Set<Paragraph> listParagraph;

	@SuppressWarnings("static-access")
	@JsonManagedReference(value = "part5Test")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "test", cascade = CascadeType.PERSIST.MERGE.REFRESH)
	private Set<Part5> listPart5;

	@JsonBackReference("user_test")
	@SuppressWarnings("static-access")
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST.MERGE.REFRESH)
	@JoinTable(name = "User_Test", joinColumns = { @JoinColumn(name = "TestID") }, inverseJoinColumns = {
			@JoinColumn(name = "UserID") })
	private Set<Account> users;

	
	public final Set<Account> getUsers() {
		return users;
	}

	public final void setUsers(Set<Account> users) {
		this.users = users;
	}

	public final Audio getAudio() {
		return audio;
	}

	public final void setAudio(Audio audio) {
		this.audio = audio;
	}
	//
	// public final Set<Account> getUsers() {
	// return users;
	// }
	//
	// public final void setUsers(Set<Account> users) {
	// this.users = users;
	// }

	public final long getView() {
		return View;
	}

	public final void setView(long view) {
		View = view;
	}

	public final Set<Part5> getListPart5() {
		return listPart5;
	}

	public final void setListPart5(Set<Part5> listPart5) {
		this.listPart5 = listPart5;
	}

	public final Set<Paragraph> getListParagraph() {
		return listParagraph;
	}

	public final void setListParagraph(Set<Paragraph> listParagraph) {
		this.listParagraph = listParagraph;
	}

	public final int getId() {
		return Id;
	}

	public final void setId(int id) {
		Id = id;
	}

	public final String getCode() {
		return Code;
	}

	public final void setCode(String code) {
		Code = code;
	}

	public final String getTitle() {
		return Title;
	}

	public final void setTitle(String title) {
		Title = title;
	}

}
