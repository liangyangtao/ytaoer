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

<c:if
	test="${(not empty page.list or page.count>0) and page.pageCount>1}">
	<ul class="pages">

		<c:if test="${page.pageNo<=1}">
			<li><a class="cannot">首页</a></li>
			<li><a class="cannot">&lt;上一页</a></li>
		</c:if>
		<c:if test="${page.pageNo>1}">
			<li><a href="javascript:goPage(1);">首页</a></li>
			<li><a
				href="javascript:goPage(${page.pageNo-1},${page.startPage-1});">&lt;上一页</a>
			</li>
		</c:if>
		<c:forEach var="c" begin="${page.startPage}" end="${page.endPage}">
			<li><a href="javascript:goPage(${c},${page.startPage});"
				<c:if test="${c==page.pageNo}">class="onPage cur"</c:if>>${c}</a>
			</li>
		</c:forEach>
		<c:if test="${page.pageNo<page.pageCount}">
			<li><a
				href="javascript:goPage(${page.pageNo+1}<c:if test="${page.endPage!=page.pageCount}">,${page.startPage+1}</c:if><c:if test="${page.endPage==page.pageCount}">,${page.startPage}</c:if>);">下一页&gt;</a>
			</li>
			<li><a
				href="javascript:goPage(${page.pageCount},${page.pageCount-page.movepage});">尾页</a>
			</li>
		</c:if>
		<c:if test="${page.pageNo>=page.pageCount}">
			<li><a class="cannot">下一页&gt;</a>
			</li>
			<li><a class="cannot">尾页</a>
			</li>
		</c:if>
	</ul>
	
</c:if>
