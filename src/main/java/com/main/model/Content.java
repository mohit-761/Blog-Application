package com.main.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "blog_content")
public class Content {
	@Id
	@Column(columnDefinition = "number(5)")
	private int id;
	@Column(columnDefinition = "varchar2(30)")
	private String email;
	@Column(columnDefinition = "varchar2(20) foreign key references blog_users(email)")
	private String title;
	@Column(columnDefinition = "CLOB")
	private String content;
	@Column(columnDefinition = "date")
	private String modify_date;
	@Column(columnDefinition = "number(5)")
	private int author_id;
	@Column(columnDefinition = "varchar2(20)")
	private String author;

	public Content() {
		super();
	}

	public Content(int id, String email, String title, String content, String modify_date, int author_id,
			String author) {
		super();
		this.id = id;
		this.email = email;
		this.title = title;
		this.content = content;
		this.modify_date = modify_date;
		this.author_id = author_id;
		this.author = author;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public int getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "Content [id=" + id + ", email=" + email + ", title=" + title + ", content=" + content + ", modify_date="
				+ modify_date + ", author_id=" + author_id + ", author=" + author + "]";
	}

}
