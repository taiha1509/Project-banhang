package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Category;
import com.laptrinhjavaweb.repository.CategoryRepository;

@Service
public class CategoryService {
	@Autowired private CategoryRepository categoryRepository;
	
	public CategoryService() {
	}
	
	public List<Category> display() {
		List<Category> category = categoryRepository.findAll();
		return category;
	}
}
