package com.ytaoer.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.ytaoer.mybatis.vo.Article;
import com.ytaoer.mybatis.vo.Category;
import com.ytaoer.service.ArticleService;
import com.ytaoer.service.CategoryService;
import com.ytaoer.util.CommonUtils;

@Controller
@RequestMapping(value = "/view/")
public class HomeController extends CommonController {
	private static Logger LOGGER = Logger.getLogger(HomeController.class);

	@Autowired
	CategoryService categoryService;
	@Autowired
	ArticleService articleService;

	@RequestMapping(value = "/index")
	public String home(HttpServletResponse response, HttpSession session,
			Model model, HttpServletRequest request, Integer pageNo,
			Integer pageSize, Integer plateId) {
		if (pageNo == null || pageNo < 1) {
			pageNo = 1;
		}
		if (pageSize == null || pageSize < 1) {
			pageSize = 20;
		}
		List<Category> categories = categoryService.readCategorylist();
		model.addAttribute("categories", categories);
		// 总共有多少条
		Integer count = articleService.contArticle();
		// 总共有多少页
		Integer pageCount = ((count % pageSize == 0) ? (count / pageSize)
				: ((count / pageSize) + 1));
		List<Article> articles = articleService.readArticleByPageNo(pageNo,
				pageSize);
		Map<String, Object> map = new HashMap<String, Object>();

		// 获取分页信息
		CommonUtils.getPageMap(map, pageNo, pageCount);
		map.put("count", count);
		map.put("pageSize", pageSize);
		map.put("pageNo", pageNo);
		map.put("pageCount", pageCount);
		model.addAttribute("page", map);
		// 资讯列表
		model.addAttribute("articles", articles);
		return "/jsp/index";
	}
	
	/***
	 *  手机版页面
	 * @param response
	 * @param session
	 * @param model
	 * @param request
	 * @param pageNo
	 * @param pageSize
	 */
	@RequestMapping(value = "/mindex")
	public void wapHome(HttpServletResponse response, HttpSession session,
			Model model, HttpServletRequest request, Integer pageNo,
			Integer pageSize) {
		if (pageNo == null || pageNo < 1) {
			pageNo = 1;
		}
		if (pageSize == null || pageSize < 1) {
			pageSize = 20;
		}
		// 总共有多少条
		Integer count = articleService.contArticle();
		// 总共有多少页
		Integer pageCount = ((count % pageSize == 0) ? (count / pageSize)
				: ((count / pageSize) + 1));
		List<Article> articles = articleService.readArticleByPageNo(pageNo,
				pageSize);
		Map<String, Object> map = new HashMap<String, Object>();

		// 获取分页信息
		CommonUtils.getPageMap(map, pageNo, pageCount);
		map.put("count", count);
		map.put("pageSize", pageSize);
		map.put("pageNo", pageNo);
		map.put("pageCount", pageCount);
		map.put("articles", articles);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd")
				.create();
		String jsonstr = gson.toJson(map);
		try {
			response.getWriter().write(jsonstr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/***
	 *  手机版页面
	 * @param response
	 * @param session
	 * @param model
	 * @param request
	 * @param pageNo
	 * @param pageSize
	 */
	@RequestMapping(value = "/msearch")
	public void msearch(HttpServletResponse response, HttpSession session,
			Model model, HttpServletRequest request, String keyword) {
		List<Article> articles = articleService.readArticleByKeyword(keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articles", articles);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd")
				.create();
		String jsonstr = gson.toJson(map);
		try {
			response.getWriter().write(jsonstr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
