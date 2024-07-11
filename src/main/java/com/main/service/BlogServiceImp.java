package com.main.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.model.User;
import com.main.repo.BlogRepo;

@Service
public class BlogServiceImp implements BlogService {
	@Autowired
	private BlogRepo blogRepo;
	@Override
	public User save(User user) {
		return blogRepo.save(user);	 
	}

	@Override
	public List<User> findAll() {
		return blogRepo.findAll();
	}
	
	public User authenticateUser(String email, String password) {
		List<User> users = blogRepo.findAll();
		for(User user: users) {
			String savedMail = user.getEmail();
			String savedPassword = user.getPassword();
			if(savedMail.equals(email) && savedPassword.equals(password)) {
				return user;
			}
		}
		
		return null;
	}

	@Override
	public User findById(int id) {
		Optional<User> user = blogRepo.findById(id);
		if(user.isPresent()) {
			User u = user.get();
			return u;
		}else {
			return null;
		}
	}

	@Override
	public User update(User user) {
		return blogRepo.save(user);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int findId() {
		int id = 0;
		List<User> users = blogRepo.findAll();
		for(User user : users) {
			if(user.getId() > id) {
				id = user.getId();
			}
		}
		return id+1;
	}

}
