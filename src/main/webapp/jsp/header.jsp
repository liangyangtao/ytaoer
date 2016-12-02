<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 手机显示  -->
<div class="responsive_menu">
	<ul class="main_menu">

		<li><a href="<%=basePath%>view/index.do">首页</a></li>

		<c:forEach items="${categories}" var="category" varStatus="status">
			<li><a href="<%=basePath%>view/plate.do?plateId=${category.id}">${category.name}</a>
			</li>
		</c:forEach>

		<li><a href="<%=basePath%>about.jsp">关于我们</a></li>
		<li><a href="<%=basePath%>concat.jsp">联系我们</a></li>
	</ul>
	<!-- /.main_menu -->
</div>
<!-- /.responsive_menu -->

<header class="site-header clearfix">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="pull-left logo">
					<a href="<%=basePath%>view/index.do"
						style="font-size: 1.8em!important; font-weight: bold; font-family: sans-serif;">
						<img src="<%=basePath%>assets/images/favicon.ico" style="width: 12%;"
						alt="Medigo by templatemo"> 婴淘社区 </a>
				</div>
				<!-- /.logo -->

				<div class="main-navigation pull-right">
					<nav class="main-nav visible-md visible-lg">
						<ul class="sf-menu">
							<li class="<c:if test="${curCategory==null}">active</c:if>"><a
								href="<%=basePath%>view/index.do">首页</a></li>
							<!--  class="<c:if test="${nowPlate.plateId==category.id}">active</c:if>"-->

							<c:forEach items="${categories}" var="category"
								varStatus="status">
								<li
									class="<c:if test="${curCategory.id==category.id}">active</c:if>"><a
									href="<%=basePath%>view/plate.do?plateId=${category.id}">${category.name}</a>
								</li>
							</c:forEach>
							<%-- <li><a href="<%=basePath%>about.jsp">关于我们</a></li> --%>
							<li><a href="<%=basePath%>jsp/concat.jsp">联系我们</a></li>
						</ul>
						<!-- /.sf-menu -->
					</nav>
					<!-- /.main-nav -->
					<!-- This one in here is responsive menu for tablet and mobiles -->
					<div class="responsive-navigation visible-sm visible-xs">
						<a href="#nogo" class="menu-toggle-btn"> <i class="fa fa-bars"></i>
						</a>
					</div>
					<!-- /responsive_navigation -->
				</div>
				<!-- /.main-navigation -->
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</header>
<!-- /.site-header -->
