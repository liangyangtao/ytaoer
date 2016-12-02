package com.ytaoer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ytaoer.mybatis.vo.Article;
import com.ytaoer.mybatis.vo.ArticleText;
import com.ytaoer.mybatis.vo.Category;
import com.ytaoer.service.ArticleService;
import com.ytaoer.service.CategoryService;

@Controller
@RequestMapping(value = "/view/")
public class ArticleController extends CommonController {
	private static Logger LOGGER = Logger.getLogger(ArticleController.class);
	@Autowired
	ArticleService articleService;

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/article")
	public String article(HttpServletResponse response, HttpSession session,
			Model model, HttpServletRequest request, Integer articleId) {
		// 导航栏
		List<Category> categories = categoryService.readCategorylist();
		model.addAttribute("categories", categories);

		Article article = articleService.readArticleById(articleId);
		ArticleText articleText = articleService.readArticleTextById(articleId);
		List<Article> subArticles = articleService
				.readSubArticleById(articleId);
		if (subArticles != null) {
			for (Article article2 : subArticles) {
				if (article2.getId() == articleId - 1) {
					model.addAttribute("preArticle", article2);
				} else if (article2.getId() == articleId + 1) {
					model.addAttribute("nextArticle", article2);
				}
			}
		}
		model.addAttribute("article", article);
		model.addAttribute("articleText", articleText);
		model.addAttribute("title", article.getTitle());
		return "/jsp/article";
	}

	@RequestMapping(value = "/marticle")
	public String marticle(HttpServletResponse response, HttpSession session,
			Model model, HttpServletRequest request, Integer articleId) {
		// 导航栏
		Article article = articleService.readArticleById(articleId);
		ArticleText articleText = articleService.readArticleTextById(articleId);
		model.addAttribute("article", article);
		model.addAttribute("articleText", articleText);
		model.addAttribute("title", article.getTitle());
		return "/wap/article";
	}
}
