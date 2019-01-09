package com.bktoeic.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

@Entity
@Table(name="Lessions")
public class Lessions {
	
	@javax.persistence.Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long Id;
	
	private String Title;
	private String Type;
	private String AccessCount;
	
	public Lessions() {
		super();
	}
	public Lessions(long id, String Title, String type, String accessCount) {
		super();
		this.Title = Title;
		Type = type;
		AccessCount = accessCount;
	}
	public final long getId() {
		return Id;
	}
	public final void setId(long id) {
		Id = id;
	}
	public final String getTitle() {
		return Title;
	}
	public final void setTitle(String Title) {
		this.Title = Title;
	}
	public final String getType() {
		return Type;
	}
	public final void setType(String type) {
		Type = type;
	}
	public final String getAccessCount() {
		return AccessCount;
	}
	public final void setAccessCount(String accessCount) {
		AccessCount = accessCount;
	}
	
	
	
}
