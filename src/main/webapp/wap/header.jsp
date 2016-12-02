<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!--头部-->
<div class="box_top">
	<div class="boxtop_left">
		<a href="#"><img src="<%=basePath%>assets/images/favicon.ico"
			class="boximg" /> </a>
	</div>
	<div class="boxtop_center">
		<div class="boxtitle">
			<span class="box_title"><a href="/wap/index.jsp">婴淘社区</a> </span>
		</div>
	</div>
	<div class="boxtop_right">
		<a href="/wap/search.jsp"><span class="boxseaech"><i
				class="fa fa-search"></i> </span> </a>

	</div>
</div>
<div  class="swiperbox">
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="<%=basePath%>wap/img/y1.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="<%=basePath%>wap/img/y11.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="<%=basePath%>wap/img/y111.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="<%=basePath%>wap/img/y1111.jpg" />
			</div>
		</div>
		<!-- 如果需要分页器 -->
		<div class="swiper-pagination"></div>
		<!-- 如果需要导航按钮 -->

	</div>
</div>
<!--轮播图-->
