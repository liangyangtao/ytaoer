<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--固定-->
<div class="fixedyt">
	<a href="javascript:void(0);"><i class="fa fa-arrow-up kk k1"
		id="toTop"></i> </a> <a href="<%=basePath%>wap/index.jsp"><i
		class="fa fa-reply kk"></i> </a>
</div>
<script src="<%=basePath%>wap/script/jquery.min.js"></script>
<script src="<%=basePath%>wap/script/swiper.js"></script>
<script src="<%=basePath%>wap/script/index.js"></script>
