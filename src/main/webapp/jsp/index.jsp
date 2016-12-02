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
<script type="text/javascript">
	function goPage(pageNo, startPage) {
		var url = "/view/index.do?plateId=0";
		if (pageNo > 1) {
			url += (url.indexOf("?") > 0 ? "&" : "?") + "pageNo=" + pageNo;
		}
		if (startPage > 1) {
			url += (url.indexOf("?") > 0 ? "&" : "?") + "startPage="
					+ startPage;
		}
		window.location = url;
	}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="parallax.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-8 blog-posts">
				<div class="row">
					<div class="col-md-12">
						<div class="thunm-bread">
							<span class="meta-date"><a
								href="<%=basePath%>view/index.do"> 首页</a> </span> <span
								class="meta-comments"> <a href="#"> 文章列表 </a> </span>
						</div>
						<c:forEach items="${articles}" var="article" varStatus="status">
							<div class="newshow">
								<div class="box_bottom">
									<div class="image">
										<a title="${article.title}" target="_blank"
											href="<%=basePath%>view/article.do?articleId=${article.id}">
											<img src="${article.pic}"
											class="attachment-post-thumbnail wp-post-image" alt=".00"
											width="140" height="98"> </a>
									</div>
									<div class="content">
										<h3>
											<a
												href="<%=basePath%>view/article.do?articleId=${article.id}">
												${article.title} </a>
										</h3>
										<p>${article.bref}......</p>
									</div>
									<div class="expert">
										<span>发表日期：</span><span> <fmt:formatDate
												value="${article.createdate}" pattern="yyyy-MM-dd" /> </span> <span
											style="margin-left:5px;">作者：</span><span>${article.author}</span>
										<span class="readall" style="margin-left:10px;"><a
											title="${article.title}" target="_blank"
											href="<%=basePath%>view/article.do?articleId=${article.id}">阅读全文</a>
										</span>
									</div>
								</div>

							</div>
							<!-- /.blog-content -->

						</c:forEach>
						<jsp:include page="page.jsp"></jsp:include>
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
