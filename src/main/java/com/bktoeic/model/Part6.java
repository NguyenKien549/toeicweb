package com.bktoeic.model;

import javax.persistence.CascadeType;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Part6 {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String A;
	private String B;
	private String C;
	private String D;
	private String RightAnswer;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST.MERGE)
	@JoinColumn(name = "ParagraphID", nullable = true)
	@JsonBackReference("part6")
	private Paragraph paragraph;

	public final int getId() {
		return Id;
	}

	public final void setId(int id) {
		Id = id;
	}

	public final String getA() {
		return A;
	}

	public final void setA(String a) {
		A = a;
	}

	public final String getB() {
		return B;
	}

	public final void setB(String b) {
		B = b;
	}

	public final String getC() {
		return C;
	}

	public final void setC(String c) {
		C = c;
	}

	public final String getD() {
		return D;
	}

	public final void setD(String d) {
		D = d;
	}

	public final String getRightAnswer() {
		return RightAnswer;
	}

	public final void setRightAnswer(String rightAnswer) {
		RightAnswer = rightAnswer;
	}

	public final Paragraph getParagraph() {
		return paragraph;
	}

	public final void setParagraph(Paragraph paragraph) {
		this.paragraph = paragraph;
	}

}
