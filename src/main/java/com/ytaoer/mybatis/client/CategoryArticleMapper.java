package com.ytaoer.mybatis.client;

import com.ytaoer.mybatis.vo.CategoryArticle;
import com.ytaoer.mybatis.vo.CategoryArticleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryArticleMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int countByExample(CategoryArticleExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int deleteByExample(CategoryArticleExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int insert(CategoryArticle record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int insertSelective(CategoryArticle record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	List<CategoryArticle> selectByExample(CategoryArticleExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	CategoryArticle selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int updateByExampleSelective(@Param("record") CategoryArticle record,
			@Param("example") CategoryArticleExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int updateByExample(@Param("record") CategoryArticle record,
			@Param("example") CategoryArticleExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int updateByPrimaryKeySelective(CategoryArticle record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table category_article
	 * @mbggenerated  Thu Oct 27 12:37:35 GMT+08:00 2016
	 */
	int updateByPrimaryKey(CategoryArticle record);
}