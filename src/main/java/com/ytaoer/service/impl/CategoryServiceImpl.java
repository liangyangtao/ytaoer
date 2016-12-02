package com.ytaoer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ytaoer.mybatis.client.CategoryMapper;
import com.ytaoer.mybatis.vo.Category;
import com.ytaoer.mybatis.vo.CategoryExample;
import com.ytaoer.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;

	public List<Category> readCategorylist() {

		CategoryExample example = new CategoryExample();
		return categoryMapper.selectByExample(example);

	}

	public int getCategoryArticleNumById(int categoryId) {
		CategoryExample example = new CategoryExample();
		if (categoryId != 0) {
			example.or().andIdEqualTo(categoryId);
		}
		List<Category> categories = categoryMapper.selectByExample(example);
		if (categories.size() > 0) {
			return categories.get(0).getNum();
		} else {
			return 0;
		}

	}

	public Category readCategoryById(int categoryId) {
		Category category = categoryMapper.selectByPrimaryKey(categoryId);
		if (category == null) {
			return null;
		} else {
			return category;
		}

	}

}
