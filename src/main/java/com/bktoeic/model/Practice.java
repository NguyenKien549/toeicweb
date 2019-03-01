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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Practice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	@Column(unique = true)
	private String Code;
	
	private String Name;
	
	private byte Part;
	
	@Column(name="AccessCount",nullable=false)
	private long View;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="practice",cascade=CascadeType.ALL)
	@JsonIgnore
	private Set<Image> listImage =new HashSet<Image>();
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="practice",cascade=CascadeType.ALL)
	@JsonIgnore
	private Set<Audio> listAudio=new HashSet<Audio>();
	
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="practice",cascade=CascadeType.ALL)
	@JsonBackReference
	private Set<Paragraph> listParagraph=new HashSet<Paragraph>();
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="practice",cascade=CascadeType.ALL)
	private Set<Part5> listPart5=new HashSet<Part5>();

	public final long getView() {
		return View;
	}

	public final void setView(long view) {
		View = view;
	}

	public final Set<Image> getListImage() {
		return listImage;
	}

	public final void setListImage(Set<Image> listImage) {
		this.listImage = listImage;
	}

	public final Set<Audio> getListAudio() {
		return listAudio;
	}

	public final void setListAudio(Set<Audio> listAudio) {
		this.listAudio = listAudio;
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
