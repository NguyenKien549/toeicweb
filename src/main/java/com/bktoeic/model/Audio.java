package com.bktoeic.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Audio {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String Audio;

	private String Script;
	
	private byte Part;

	@SuppressWarnings("static-access")
	@JsonBackReference(value = "practice_json")
	@OneToOne(fetch = FetchType.EAGER,cascade = CascadeType.PERSIST.MERGE.REFRESH)
	@JoinColumn(name = "PracticeID", nullable = true)
	private Practice practice;

	@SuppressWarnings("static-access")
	@JsonBackReference(value = "test_json")
	@OneToOne(fetch = FetchType.EAGER,cascade = CascadeType.PERSIST.MERGE.REFRESH)
	@JoinColumn(name = "TestID", nullable = true)
	private Test test;

	@SuppressWarnings("static-access")
	@OneToMany(mappedBy = "audioPart1", fetch = FetchType.LAZY,cascade = CascadeType.PERSIST.MERGE.REFRESH,orphanRemoval=true)
	@JsonManagedReference(value = "part1")
	@OrderBy("id asc")
	private Set<Part1> part1;

	@SuppressWarnings("static-access")
	@OneToMany(mappedBy = "audioPart2", fetch = FetchType.LAZY,cascade = CascadeType.PERSIST.MERGE.REFRESH,orphanRemoval=true)
	@JsonManagedReference(value = "part2List")
	@OrderBy("id asc")
	private Set<Part2> part2;

	@SuppressWarnings("static-access")
	@OneToMany(mappedBy = "audioPart3", fetch = FetchType.LAZY,cascade = CascadeType.PERSIST.MERGE.REFRESH,orphanRemoval=true)
	@JsonManagedReference(value = "part3List")
	@OrderBy("id asc")
	private Set<Part3> part3;

	@SuppressWarnings("static-access")
	@OneToMany(mappedBy = "audioPart4", fetch = FetchType.LAZY,cascade = CascadeType.PERSIST.MERGE.REFRESH,orphanRemoval=true)
	@JsonManagedReference(value = "part4List")
	@OrderBy("id asc")
	private Set<Part4> part4;

	public final byte getPart() {
		return Part;
	}

	public final void setPart(byte part) {
		Part = part;
	}

	public final String getScript() {
		return Script;
	}

	public final void setScript(String script) {
		Script = script;
	}

	public final Set<Part1> getPart1() {
		return part1;
	}

	public final void setPart1(Set<Part1> part1) {
		this.part1 = part1;
	}

	public final Set<Part2> getPart2() {
		return part2;
	}

	public final void setPart2(Set<Part2> part2) {
		this.part2 = part2;
	}

	public final Set<Part3> getPart3() {
		return part3;
	}

	public final void setPart3(Set<Part3> part3) {
		this.part3 = part3;
	}

	public final Set<Part4> getPart4() {
		return part4;
	}

	public final void setPart4(Set<Part4> part4) {
		this.part4 = part4;
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

	public final String getAudio() {
		return Audio;
	}

	public final void setAudio(String audio) {
		Audio = audio;
	}

}
