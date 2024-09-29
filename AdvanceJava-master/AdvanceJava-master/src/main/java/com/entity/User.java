package com.entity;

public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String qulification;
	private String roll;

	public User(String name, String email, String password, String qulification, String roll) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.qulification = qulification;
		this.roll = roll;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQulification() {
		return qulification;
	}

	public void setQulification(String qulification) {
		this.qulification = qulification;
	}

	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}

}
