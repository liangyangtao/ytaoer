package com.ytaoer.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ytaoer.mybatis.vo.User;
import com.ytaoer.mybatis.vo.UserInfo;

@Controller
@RequestMapping(value = "/user/")
public class UserController extends CommonController {

	// 该接口只有当畅言已登录，getUserInfo返回未登录时，才会被调用用来登录自身网站
	@RequestMapping(value = "/login")
	public void loginByCy(@RequestParam(value = "callback") String callback,
			@RequestParam(value = "user_id") String user_id,
			@RequestParam(value = "nickname") String nickname,
			@RequestParam(value = "sign") String sign,
			@RequestParam(value = "img_url") String img_url,
			@RequestParam(value = "profile_url") String profile_url,
			HttpServletResponse response) {
		// 自己网站的登录逻辑，记录登录信息到cookie
		Cookie cookie = new Cookie("user_id", user_id);
		response.addCookie(cookie);
		try {
			response.getWriter().write(
					callback + "({\"user_id\":" + user_id + ",reload_page:0})");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loginout")
	public void loginBySite(@RequestParam(value = "callback") String callback,
			HttpServletResponse resp) {
		// 清除自己网站cookies信息,同时前端logout.js代码用来清理畅言cookie
		try {
			resp.getWriter()
					.write(callback
							+ "({\"code\":\"1\",reload_page:0, js-src:logout.js})");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 该接口在页面每一次加载时都会被调用，用来判断用户在自己网站是否登录
	@RequestMapping(value = "/getUserInfo")
	public void getUserInfo(@RequestParam(value = "callback") String callback,
			HttpServletRequest res, HttpServletResponse resp) {
		UserInfo userinfo = new UserInfo();
		Cookie[] cookies = res.getCookies();
		if (!isContains("user_id", cookies)) {// 此处为模拟逻辑，具体实现可以变化
			userinfo.setIs_login(0);// 用户未登录
		} else {
			userinfo.setIs_login(1);// 用户已登录
			User user = new User();
			user.setUser_id((Integer)getCookValue("user_id", cookies)); // 该值具体根据自己用户系统设定
			user.setNickname((String)getCookValue("nickname", cookies)); // 该值具体根据自己用户系统设定
			user.setImg_url((String)getCookValue("img_url", cookies)); // 该值具体根据自己用户系统设定，可以为空
			user.setProfile_url((String)getCookValue("profile_url", cookies));// 该值具体根据自己用户系统设定，可以为空
			user.setSign((String)getCookValue("sign", cookies)); // 签名已弃用，任意赋值即可
			userinfo.setUser(user);
		}
		resp.setContentType("application/x-javascript");// 指定传输格式为js
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd")
				.create();
		try {
			resp.getWriter().write(
					callback + "(" +  gson.toJson(userinfo) + ")");
		} catch (IOException e) {
			e.printStackTrace();
		}// 拼接成jsonp格式
	}

	// 该方法判断cookie中是否存在键值为key的value值
	public boolean isContains(String key, Cookie[] cookies) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(key)) {
				if (cookie.getValue() != null) {
					return true;
				} else {
					return false;
				}
			}
		}
		return false;
	}

	// 该方法获取cookie中键值为key的value值
	public Object getCookValue(String key, Cookie[] cookies) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(key)) {
				return cookie.getValue();
			}
		}
		return null;
	}
}
