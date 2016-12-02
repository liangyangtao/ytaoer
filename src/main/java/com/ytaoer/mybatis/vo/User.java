package com.ytaoer.mybatis.vo;

import java.io.Serializable;

public class User implements Serializable {

	public int user_id;// 用户在自己网站的id

	public String nickname;// 用户昵称

	public String img_url;// 用户头像地址

	public String profile_url;// 用户主页地址

	public String sign;// 签名

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getProfile_url() {
		return profile_url;
	}

	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

}
