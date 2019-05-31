package com.bktoeic.model;

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
import javax.persistence.OrderBy;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Paragraph {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String Paragraph;

	private byte Part;

	@SuppressWarnings("static-access")
	@JsonBackReference(value = "paraPrac")
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.PERSIST.MERGE.REFRESH)
	@JoinColumn(name = "PracticeID", nullable = true)
	private Practice practice;

	@SuppressWarnings("static-access")
	@JsonBackReference(value = "paraTest")
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.PERSIST.MERGE.REFRESH)
	@JoinColumn(name = "TestID", nullable = true)
	private Test test;

	@SuppressWarnings("static-access")
	@JsonManagedReference(value = "part6")
	@OneToMany(mappedBy = "paragraph", fetch = FetchType.LAZY,cascade = CascadeType.PERSIST.MERGE.REFRESH)
	@OrderBy("id asc")
	private Set<Part6> part6;

	@SuppressWarnings("static-access")
	@JsonManagedReference("part7")
	@OneToMany(mappedBy = "paragraph", fetch = FetchType.LAZY,cascade = CascadeType.PERSIST.MERGE.REFRESH)
	@OrderBy("id asc")
	private Set<Part7> part7;

	public final byte getPart() {
		return Part;
	}

	public final void setPart(byte part) {
		Part = part;
	}

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
