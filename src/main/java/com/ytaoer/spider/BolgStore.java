package com.ytaoer.spider;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ytaoer.mybatis.client.ArticleMapper;
import com.ytaoer.mybatis.client.ArticleTextMapper;
import com.ytaoer.mybatis.client.CategoryArticleMapper;
import com.ytaoer.mybatis.client.CategoryMapper;
import com.ytaoer.mybatis.client.TagArticleMapper;
import com.ytaoer.mybatis.client.TagMapper;
import com.ytaoer.mybatis.factory.DynamicConnectionFactory;
import com.ytaoer.mybatis.vo.Article;
import com.ytaoer.mybatis.vo.ArticleText;
import com.ytaoer.mybatis.vo.Category;
import com.ytaoer.mybatis.vo.CategoryArticle;
import com.ytaoer.mybatis.vo.CategoryExample;
import com.ytaoer.mybatis.vo.Tag;
import com.ytaoer.mybatis.vo.TagArticle;
import com.ytaoer.mybatis.vo.TagExample;

public class BolgStore {

	public void saveBlog(String categoryname, String tagname, String title,
			String description, String author, String text, Date time,String imgSrc) {
		SqlSession sqlSession = DynamicConnectionFactory
				.getInstanceSessionFactory("development").openSession();

		try {
			ArticleMapper articleMapper = sqlSession
					.getMapper(ArticleMapper.class);

			Article article = new Article();
			article.setAuthor(author);
			article.setBref(description);
			article.setCreatedate(time);
			article.setTitle(title);
			article.setViewnum(0);
			article.setPic(imgSrc);
			articleMapper.insertSelective(article);
			int articleid = article.getId();

			Tag tag = saveTag(tagname, sqlSession);
			int tagid = tag.getId();

			saveTagArticle(sqlSession, articleid, tagid);

			Category category = saveCategory(categoryname, sqlSession);
			int categoryId = category.getId();
			saveCategoryArticle(sqlSession, articleid, categoryId);

			saveArticleText(sqlSession, articleid, text);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback(true);
		} finally {
			sqlSession.close();
		}
	}

	private void saveArticleText(SqlSession sqlSession, int articleid,
			String text) {
		ArticleTextMapper articleTextMapper = sqlSession
				.getMapper(ArticleTextMapper.class);
		ArticleText record = new ArticleText();
		record.setId(articleid);
		record.setText(text);
		articleTextMapper.insertSelective(record);

	}

	private void saveCategoryArticle(SqlSession sqlSession, int articleid,
			int categoryId) {
		CategoryArticleMapper categoryArticleMapper = sqlSession
				.getMapper(CategoryArticleMapper.class);
		CategoryArticle record = new CategoryArticle();
		record.setCategoryid(categoryId);
		record.setArticleid(articleid);
		categoryArticleMapper.insertSelective(record);
	}

	private Category saveCategory(String categoryname,
			SqlSession sqlSession) {
		CategoryMapper categoryMapper = sqlSession
				.getMapper(CategoryMapper.class);

		CategoryExample categoryExample = new CategoryExample();
		categoryExample.or().andNameEqualTo(categoryname);
		List<Category> categories = categoryMapper
				.selectByExample(categoryExample);
		Category category = null;
		if (categories.size() > 0) {
			category = categories.get(0);
			category.setNum(category.getNum() + 1);
			categoryMapper.updateByPrimaryKeySelective(category);
		} else {
			category = new Category();
			category.setName(categoryname);
			category.setNum(1);
			categoryMapper.insertSelective(category);
		}
		return category;
	}

	private void saveTagArticle(SqlSession sqlSession, int articleid, int tagid) {
		TagArticleMapper tagArticleMapper = sqlSession
				.getMapper(TagArticleMapper.class);
		TagArticle tagArticle = new TagArticle();
		tagArticle.setArticleid(articleid);
		tagArticle.setTagid(tagid);
		tagArticleMapper.insertSelective(tagArticle);
	}

	private Tag saveTag(String tagname, SqlSession sqlSession) {
		TagMapper tagMapper = sqlSession.getMapper(TagMapper.class);
		TagExample tagExample = new TagExample();
		tagExample.or().andNameEqualTo(tagname);
		List<Tag> tags = tagMapper.selectByExample(tagExample);
		Tag tag = null;
		if (tags.size() > 0) {
			// 说明已经存在
			tag = tags.get(0);
			tag.setNum(tag.getNum() + 1);
			tagMapper.updateByPrimaryKeySelective(tag);
		} else {
			//
			tag = new Tag();
			tag.setName(tagname);
			tag.setNum(1);
			tagMapper.insertSelective(tag);
		}
		return tag;
	}

}
