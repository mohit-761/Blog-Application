package com.main.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.model.Content;
import com.main.repo.ContentRepo;

@Service
public class ContentServiceImp implements ContentService {
	
	@Autowired
	private ContentRepo contentRepo;
	
	@Override
	public List<Content> findAll() {
		
		return contentRepo.findAll();
	}
	

	@Override
	public Content save(Content content) {
		
		return contentRepo.save(content);
	}

	@Override
	public Content update(Content content) {
		return contentRepo.save(content);
	}

	@Override
	public void deleteById(int id) {
		contentRepo.deleteById(id);
		System.out.println("content with "+id+" deleted successfully");
	}

	@Override
	public Content findById(int id) {
		Optional <Content> content = contentRepo.findById(id);
		if(content.isPresent()) {
			Content c = content.get();
			return c;
		}else {
			return null;
		}
	}


	@Override
	public List<Content> findAllById(Iterable<Integer> id) {		
		contentRepo.findAllById(id);
		return null;
	}


	@Override
	public int getId() {
		int id = 0;
		List<Content> contents = contentRepo.findAll();
		
		for(Content content : contents) {
			if(content.getId() > id) {
				id = content.getId();
			}
		}
		return id+1;
	}
	
	

}
