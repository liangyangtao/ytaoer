package com.ytaoer.service;

import java.util.List;

import com.ytaoer.mybatis.vo.Article;
import com.ytaoer.mybatis.vo.ArticleText;

public interface ArticleService {

	public List<Article> readArticleByCategoryid(int categoryid, int startPage,
			int pageNum);

	public List<Article> readArticleByTagid(int tagid, int startPage,
			int pageNum);

	public ArticleText readArticleTextById(int articleId);

	public Article readArticleById(int articleId);

	public List<Article> readSubArticleById(Integer articleId);

	public Integer contArticle();

	public List<Article> readArticleByPageNo(Integer pageNo, Integer pageSize);

	public List<Article> readArticleByKeyword(String keyword);

}
