package com.bktoeic.model;

import java.util.HashSet;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Practice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	@Column(unique = true)
	private String Code;

	private String Name;

	private byte Part;

	@Column(name = "AccessCount", nullable = false)
	private long View;

	@JsonManagedReference
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "practice", cascade = CascadeType.ALL)
	private Audio audio;

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "practice", cascade = CascadeType.ALL)
	private Set<Paragraph> listParagraph;

	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "practice", cascade = CascadeType.ALL)
	private Set<Part5> listPart5 = new HashSet<Part5>();

	public final long getView() {
		return View;
	}

	public final void setView(long view) {
		View = view;
	}

	public final Audio getAudio() {
		return audio;
	}

	public final void setAudio(Audio audio) {
		this.audio = audio;
	}

	public final Set<Paragraph> getListParagraph() {
		return listParagraph;
	}

	public final void setListParagraph(Set<Paragraph> listParagraph) {
		this.listParagraph = listParagraph;
	}

	public final Set<Part5> getListPart5() {
		return listPart5;
	}

	public final void setListPart5(Set<Part5> listPart5) {
		this.listPart5 = listPart5;
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

	public final String getName() {
		return Name;
	}

	public final void setName(String name) {
		Name = name;
	}

	public final byte getPart() {
		return Part;
	}

	public final void setPart(byte part) {
		Part = part;
	}
}
