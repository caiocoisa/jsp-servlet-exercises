package com.css.login;

import com.google.inject.ImplementedBy;

public class User {
	
	private String email;
	private String pasword;
	
	public User(String email, String pasword) {
		super();
		this.email = email;
		this.pasword = pasword;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasword() {
		return pasword;
	}
	public void setPasword(String pasword) {
		this.pasword = pasword;
	}
	
}
