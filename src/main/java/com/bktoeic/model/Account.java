package com.bktoeic.model;

import java.sql.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Account")
public class Account {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long Id;
	
	private String Name;
	private Date DateOfBirth;
	private String Gender;
	private String Email;
	private String Username;
	private String Password;
	private String Type;
	
	
	public Account() {
		super();
	}


	public Account(String name, Date dateOfBirth, String gender, String email, String username, String password,
			String type) {
		super();
		Name = name;
		DateOfBirth = dateOfBirth;
		Gender = gender;
		Email = email;
		Username = username;
		Password = password;
		Type = type;
	}


	public final long getId() {
		return Id;
	}


	public final void setId(long id) {
		Id = id;
	}


	public final String getName() {
		return Name;
	}


	public final void setName(String name) {
		Name = name;
	}


	public final Date getDateOfBirth() {
		return DateOfBirth;
	}


	public final void setDateOfBirth(Date dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}


	public final String getGender() {
		return Gender;
	}


	public final void setGender(String gender) {
		Gender = gender;
	}


	public final String getEmail() {
		return Email;
	}


	public final void setEmail(String email) {
		Email = email;
	}


	public final String getUsername() {
		return Username;
	}


	public final void setUsername(String username) {
		Username = username;
	}


	public final String getPassword() {
		return Password;
	}


	public final void setPassword(String password) {
		Password = password;
	}


	public final String getType() {
		return Type;
	}


	public final void setType(String type) {
		Type = type;
	}
	
	
	
}
