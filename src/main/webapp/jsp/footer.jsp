<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<footer class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="footer-nav clearfix">
					<ul class="footer-menu">
						<li><a href="<%=basePath%>view/index.do">首页</a>
						</li>
						<li><a href="<%=basePath%>jsp/concat.jsp">联系我们</a>
						</li>
					</ul>
					<!-- /.footer-menu -->
				</nav>
				<!-- /.footer-nav -->
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-md-12">
				<p class="copyright-text">
					Copyright &copy; 2016 <a href="http://www.miitbeian.gov.cn/"
						target="_blank" title="备案">京ICP备16045559号</a>
				</p>
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</footer>
<!-- /.site-footer -->

<!-- Scripts -->
<script src="/assets/js/min/plugins.min.js"></script>
<script src="/assets/js/min/medigo-custom.min.js"></script>

<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js"
	type="text/javascript" charset="utf-8"></script>
<!-- Templatemo Script -->

<script>
	/* 百度统计 */
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?47b228aed7a3fbabcebe22b7a5a06345";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
	/* 百度统计结束 */
	$(document).ready(
			function() {
				$("h2,h3,h4,h5,h6", ".blog-posts").each(
						function(i, item) {
							var tag = $(item).get(0).localName;
							$(item).attr("id", "toc" + i);
							$(".toc-content").append(
									'<a class="toc'+tag+'" href="#toc'+i+'">'
											+ $(this).text() + '</a></br>');
							$(".toch2").css("margin-left", 0);
							$(".toch3").css("margin-left", 20);
							$(".toch4").css("margin-left", 40);
							$(".toch5").css("margin-left", 60);
							$(".toch6").css("margin-left", 80);
						});
			});
</script>