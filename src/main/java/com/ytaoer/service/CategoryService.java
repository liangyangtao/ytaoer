package com.ytaoer.service;

import java.util.List;

import com.ytaoer.mybatis.vo.Category;

public interface CategoryService {

	
	public List<Category> readCategorylist();
	
	public int getCategoryArticleNumById(int categoryId);
	
    public Category readCategoryById(int categoryId);
	
	
	
}
