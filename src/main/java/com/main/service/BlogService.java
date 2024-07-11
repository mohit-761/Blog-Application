package com.main.service;

import java.util.List;

import com.main.model.User;

public interface BlogService {
	public User save(User user);

	public List<User> findAll();

	public User findById(int id);
	
	public int findId();

	public User update(User user);

	public void deleteById(int id);
}
