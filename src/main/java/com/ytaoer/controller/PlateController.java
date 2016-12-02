package com.ytaoer.controller;

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

import com.ytaoer.mybatis.vo.Article;
import com.ytaoer.mybatis.vo.Category;
import com.ytaoer.service.ArticleService;
import com.ytaoer.service.CategoryService;
import com.ytaoer.util.CommonUtils;

@Controller
@RequestMapping(value = "/view/")
public class PlateController extends CommonController {
	private static Logger LOGGER = Logger.getLogger(PlateController.class);

	@Autowired
	CategoryService categoryService;

	@Autowired
	ArticleService articleService;

	@RequestMapping(value = "/plate")
	public String home(HttpServletResponse response, HttpSession session,
			Model model, HttpServletRequest request, Integer plateId,
			Integer pageNo, Integer pageSize) {

		if (pageNo == null || pageNo < 1) {
			pageNo = 1;
		}
		if (pageSize == null || pageSize < 1) {
			pageSize = 20;
		}
		if (plateId == null) {
			plateId = 0;
			// 表明是热门栏目
		}
		List<Category> categories = categoryService.readCategorylist();
		model.addAttribute("categories", categories);
		Category category = categoryService.readCategoryById(plateId);
		// 总共有多少条
		Integer count = categoryService.getCategoryArticleNumById(plateId);
		// 总共有多少页
		Integer pageCount = ((count % pageSize == 0) ? (count / pageSize)
				: ((count / pageSize) + 1));
		List<Article> articles = articleService.readArticleByCategoryid(
				plateId, pageNo, pageSize);
		Map<String, Object> map = new HashMap<String, Object>();

		// 获取分页信息
		CommonUtils.getPageMap(map, pageNo, pageCount);
		map.put("count", count);
		map.put("pageSize", pageSize);
		map.put("pageNo", pageNo);
		map.put("pageCount", pageCount);
		model.addAttribute("page", map);
		model.addAttribute("curCategory", category);
		// 资讯列表
		model.addAttribute("articles", articles);
		return "/jsp/plate";
	}
}
