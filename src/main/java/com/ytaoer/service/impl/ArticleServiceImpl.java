package com.ytaoer.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ytaoer.mybatis.client.ArticleMapper;
import com.ytaoer.mybatis.client.ArticleTextMapper;
import com.ytaoer.mybatis.client.CategoryArticleMapper;
import com.ytaoer.mybatis.vo.Article;
import com.ytaoer.mybatis.vo.ArticleExample;
import com.ytaoer.mybatis.vo.ArticleText;
import com.ytaoer.mybatis.vo.ArticleTextExample;
import com.ytaoer.mybatis.vo.CategoryArticle;
import com.ytaoer.mybatis.vo.CategoryArticleExample;
import com.ytaoer.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	CategoryArticleMapper categoryArticleMapper;

	@Autowired
	ArticleMapper articleMapper;

	@Autowired
	ArticleTextMapper articleTextMapper;

	public List<Article> readArticleByCategoryid(int categoryid, int startPage,
			int pageNum) {
		CategoryArticleExample categoryArticleExample = new CategoryArticleExample();
		if (categoryid != 0) {
			categoryArticleExample.or().andCategoryidEqualTo(categoryid);
		}
		List<CategoryArticle> categoryArticles = categoryArticleMapper
				.selectByExample(categoryArticleExample);
		if (categoryArticles.size() == 0) {
			return new ArrayList<Article>();
		}
		List<Integer> ids = new ArrayList<Integer>();
		for (CategoryArticle categoryArticle : categoryArticles) {
			ids.add(categoryArticle.getArticleid());
		}
		ArticleExample example = new ArticleExample();
		example.or().andIdIn(ids);
		example.setOrderByClause(" createdate desc limit " + (startPage - 1)
				* pageNum + "," + pageNum);
		return articleMapper.selectByExample(example);
	}

	public List<Article> readArticleByTagid(int tagid, int startPage,
			int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArticleText readArticleTextById(int articleId) {
		ArticleTextExample example = new ArticleTextExample();
		example.or().andIdEqualTo(articleId);
		List<ArticleText> articleTexts = articleTextMapper
				.selectByExampleWithBLOBs(example);
		if (articleTexts.size() > 0) {
			return articleTexts.get(0);
		} else {
			return null;
		}
	}

	public Article readArticleById(int articleId) {
		return articleMapper.selectByPrimaryKey(articleId);
	}

	public List<Article> readSubArticleById(Integer articleId) {

		ArticleExample example = new ArticleExample();
		List<Integer> values = new ArrayList<Integer>();
		values.add(articleId - 1);
		values.add(articleId + 1);
		example.or().andIdIn(values);
		List<Article> articles = articleMapper.selectByExample(example);
		if (articles.size() > 0) {
			return articles;
		} else {
			return null;
		}
	}

	public Integer contArticle() {
		ArticleExample example = new ArticleExample();
		return articleMapper.countByExample(example);
	}

	public List<Article> readArticleByPageNo(Integer pageNo, Integer pageSize) {
		ArticleExample example = new ArticleExample();
		example.setOrderByClause(" createdate desc limit " + (pageNo - 1)
				* pageSize + "," + pageSize);
		return articleMapper.selectByExample(example);
	}

	public List<Article> readArticleByKeyword(String keyword) {
		ArticleExample example = new ArticleExample();
		example.or().andTitleLike("%" + keyword + "%");
		example.setOrderByClause(" createdate desc limit 100");
		return articleMapper.selectByExample(example);
	}

}
