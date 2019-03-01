package com.bktoeic.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Image {
	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String Image;

	@ManyToOne
	@JoinColumn(name = "PracticeID", nullable = true)
	private Practice practice;

	@ManyToOne
	@JoinColumn(name = "TestID", nullable = true)
	private Test test;

	@OneToOne(mappedBy = "image", fetch = FetchType.EAGER)
	private Part1 part1;

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

	public final Part1 getPart1() {
		return part1;
	}

	public final void setPart1(Part1 part1) {
		this.part1 = part1;
	}

	public final int getId() {
		return Id;
	}

	public final void setId(int id) {
		Id = id;
	}

	public final String getImage() {
		return Image;
	}

	public final void setImage(String image) {
		Image = image;
	}
}
