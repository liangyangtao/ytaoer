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
						<!-- <div class="thunm-bread">
							<span class="meta-comments"> <a href="#">文章详情</a> </span>
						</div> -->
						<div class="post-blog">
							<div class="blog-content">
								<div>
									<span class="meta-date">时间 ：<fmt:formatDate
											value="${article.createdate}" pattern="yyyy-MM-dd" /> </span>
									<!--   <span class="meta-comments">
                                
                                </span> -->
									<span class="meta-author"> 作者 ： ${article.author} </span>
								</div>
								<h1>${article.title}</h1>
								<div>${articleText.text}</div>
							</div>

							<div>
								<div class="bdsharebuttonbox">
									<a href="#" class="bds_more" data-cmd="more"></a><a
										title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a><a
										title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a><a
										title="分享到QQ好友" href="#" class="bds_sqq" data-cmd="sqq"></a><a
										title="分享到百度贴吧" href="#" class="bds_tieba" data-cmd="tieba"></a><a
										title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a><a
										title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a>
								</div>
								<script>
									window._bd_share_config = {
										"common" : {
											"bdSnsKey" : {},
											"bdText" : "{% if page.title_cn %} {{page.title_cn}} {% else %} {{page.title}} {% endif %}",
											"bdMini" : "2",
											"bdMiniList" : false,
											"bdPic" : "http://ytaoer.com/assets/images/head.jpg",
											"bdStyle" : "0",
											"bdSize" : "24"
										},
										"share" : {},
										"selectShare" : {
											"bdContainerClass" : null,
											"bdSelectMiniList" : [ "tsina",
													"weixin", "sqq", "tieba",
													"qzone", "tqq" ]
										}
									};
									with (document)
										0[(getElementsByTagName('head')[0] || body)
												.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
												+ ~(-new Date() / 36e5)];
								</script>

								<h2>免责声明</h2>
								<div>
									<p>
										<font color="red">另外提醒大家：本网站不会向任何人索要银行账号、密码、手机号或个人信息，亦没有委托任何个人或组织进行此类活动，由于个人原因导致被骗均与本网站无关。同时敬请群众提高警惕，避免上当受骗，一旦发现此类情况，请及时发邮件到本网站管理员
											kf@ytaoer.com</font>
									</p>
								</div>
								<div>
									<p>
										<font color="red">本网站并非专业教育和医疗机构，本网站所提供一切资料仅供参考，不能作为诊断、医疗和教育之依据。如果您发现孩子有任何异常，请及时去专业机构检查。对于任何单位，本网均不提供其资信担保，由此发生的责权关系与本网无关。</font>
									</p>
								</div>
								<h2>特别鸣谢</h2>
								<div>
									<a target="_blank"
										href="https://portal.qiniu.com/signup?code=3ldqquq6t2yxe"><img
										src="http://assets.qiniu.com/v2/qiniu-410x180.png" alt="七牛云存储"
										style="height:48.6px; width:122px;"> </a>
								</div>
							</div>
							<ul class="pagination">
								<li class="prev"><a style="border:none"
									href='<c:if test="${preArticle==null}">javascript:void(0);</c:if><c:if test="${ preArticle.id!=null}">/view/article.do?articleId=${preArticle.id}</c:if>'
									title=""> <span class="page-artitle-title">${preArticle.title}</span>
										&laquo; 上一篇 </a></li>
								<li class="next"><a style="border:none"
									href='<c:if test="${nextArticle==null}">javascript:void(0);</c:if><c:if test="${ nextArticle.id!=null}">/view/article.do?articleId=${nextArticle.id}</c:if>'
									title="#">下一篇 &raquo; <span class="page-artitle-title">${nextArticle.title}</span>
								</a>
								</li>
							</ul>

							<!-- /.blog-content -->
						</div>
						<!-- <div >
									<div >
									<p>
										 
										 
											 欣赏此文？求鼓励，求支持！您的打赏将捐献给<a
											href="http://gongyi.qq.com/">腾讯公益</a> </p>
									</div>

									支付宝打赏图案
									<div >
										<a href="/assets/themes/medigo/images/alipay.jpg" 
											title="支付宝打赏" > <img
											src="/assets/themes/medigo/images/alipay.jpg" title="支付宝打赏"
											style= "float:left;margin-left:25%;margin-right:2px;height:164px; width:164px;"> </a>
											<a href="/assets/themes/medigo/images/wechatpay.jpg"
											title="微信打赏" 
											> <img
											src="/assets/themes/medigo/images/wechatpay.jpg"
											title="微信打赏" style= "height:164px; width:164px;"> </a>
									</div>
								</div> -->

						<!-- /.post-blog -->

						<!-- 多说评论框 start -->
						<jsp:include page="duoshuo.jsp"></jsp:include>
						<!-- 多说评论框 end -->
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
