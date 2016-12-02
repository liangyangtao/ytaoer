<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="col-md-4">
	<div class="sidebar">
		<div class="sidebar-widget">
			<h5 class="widget-title">关于我们</h5>
			<a href="/view/index.do"> <img src="/assets/images/head.jpg"
				style="width: 60%;" class="img-thumbnail"> </a>
			<h4>婴淘社区</h4>
			<!-- <div style="text-align:center;">
                    <wb:follow-button uid="1821809482" type="gray_3" width="100%" height="24" ></wb:follow-button>
                </div> -->
			<div style="text-align: left;margin-top: 10px;">
				<p class="light-text">一个宝妈的育儿日志,搜罗适合宝宝的食物、用品、玩具、分享给大家,用心让宝宝过得更好
					给予宝宝更好的爱</p>
			</div>
		</div>
		<!-- /.sidebar-widget -->
		<div class="sidebar-widget">
			<h5 class="widget-title">推荐商城</h5>
			<a target="_blank" href="https://baby.jd.com/"> <img
				src="/assets/images/jd.jpg" style="width: 60%;"
				class="img-thumbnail"> </a> <a target="_blank"
				href="http://www.mia.com/"> <img src="/assets/images/mia.jpg"
				style="width: 60%;" class="img-thumbnail"> </a>
			<!-- /.row -->
		</div>
		<!-- /.sidebar-widget -->
	</div>
	<!-- /.sidebar -->
</div>

