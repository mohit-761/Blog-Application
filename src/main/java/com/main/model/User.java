package com.main.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "blog_users")
public class User {
	@Id
	@Column(columnDefinition = "number(5)")
	private int id;
	@Column(columnDefinition = "varchar2(30) unique")
	private String email;
	@Column(columnDefinition = "varchar2(20)")
	private String name;
	@Column(columnDefinition = "varchar2(12)")
	private String password;
	@Column(columnDefinition = "varchar2(20)")
	private String address;

	public User() {
	}

	public User(int id, String email, String name, String password, String address) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.password = password;
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", name=" + name + ", password=" + password + ", address="
				+ address + "]";
	}

	
}
