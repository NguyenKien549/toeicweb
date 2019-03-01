package com.bktoeic.model;

import java.util.HashSet;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Paragraph {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String Paragraph;

	@JsonManagedReference
	@ManyToOne
	@JoinColumn(name = "PracticeID", nullable = true)
	@JsonIgnore
	private Practice practice;

	@JsonManagedReference
	@ManyToOne
	@JoinColumn(name = "TestID", nullable = true)
	@JsonIgnore
	private Test test;

	@JsonBackReference
	@OneToMany(mappedBy = "paragraphPart6", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Part6> part6 = new HashSet<Part6>();
	
	@JsonBackReference
	@OneToMany(mappedBy = "paragraphPart7", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Part7> part7 = new HashSet<Part7>();

	public final Set<Part7> getPart7() {
		return part7;
	}

	public final Set<Part6> getPart6() {
		return part6;
	}

	public final void setPart6(Set<Part6> part6) {
		this.part6 = part6;
	}

	public final void setPart7(Set<Part7> part7) {
		this.part7 = part7;
	}

	public final Practice getPractice() {
		return practice;
	}

	public final void setPractice(Practice practice) {
		this.practice = practice;
	}

	public final Test getTest() {
		return test;
	}

	public final void setTest(Test test) {
		this.test = test;
	}

	public final int getId() {
		return Id;
	}

	public final void setId(int id) {
		Id = id;
	}

	public final String getParagraph() {
		return Paragraph;
	}

	public final void setParagraph(String paragraph) {
		Paragraph = paragraph;
	}

}
