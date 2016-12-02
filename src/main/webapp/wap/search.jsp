<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="meta.jsp"></jsp:include>
</head>

<body>
	<div class="container">
		<div class="box">
			<!--头部-->
			<div class="box_top">
				<div class="boxtop_left"></div>
				<div class="boxtop_center">
					<div class="boxtitle">
						<span class="box_title"><a href="/wap/index.jsp">返回首页</a> </span>

					</div>
				</div>
				<div class="boxtop_right"></div>
			</div>
			<div class="sear">
				<form class="form">
					<input type="text" name="w" placeholder="请输入你要的信息" class="text1"
						id="searchwd"> <input type="button" value="搜索" class="btn"
						id="searchbtn">
				</form>
			</div>
			<!--文章-->
			<div class="artbox">
				<div class="artile content">
					<ul class="lists">
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--固定-->
	<div class="fixedyt">
		<a href="javascript:void(0);"><i
			class="fa fa-arrow-up kk k1" id="toTop"></i> </a> <a
			href="<%=basePath%>wap/index.jsp"><i class="fa fa-reply kk"></i>
		</a>
	</div>
	<script src="<%=basePath%>wap/script/jquery.min.js"></script>
	<script src="<%=basePath%>wap/script/search.js"></script>
</body>
</html>
