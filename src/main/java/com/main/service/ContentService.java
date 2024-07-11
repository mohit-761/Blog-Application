package com.main.service;

import java.util.List;

import com.main.model.Content;

public interface ContentService {
	public List<Content> findAll();

	public Content findById(int id);
	
	public List<Content> findAllById(Iterable<Integer> id);

	public Content save(Content content);

	public Content update(Content content);
	
	public int getId();
	public void deleteById(int id);
}
