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
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="parallax.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-8 blog-posts">
				<div class="row">
					<div class="col-md-12">
						<div class="contact-wrapper">
							<h3>服务范围</h3>
							<p>关于网站的使用问题、改进建议，或举报不良信息.</p>
							<h3>评论</h3>
							<p>大家有什么可以在此页留言？不要发一些敏感话题</p>
						</div>
						<jsp:include page="duoshuo.jsp"></jsp:include>
						<!-- /.contact-wrapper -->
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.col-md-8 -->
			<jsp:include page="right.jsp"></jsp:include> 
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
