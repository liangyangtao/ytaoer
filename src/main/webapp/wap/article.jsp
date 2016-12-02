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
			<jsp:include page="header.jsp"></jsp:include>
			<!--文章-->
			<div class="artbox">
				<div class="artile" id="wrapper">
					<div class="arttitle">${article.title}</div>
					<div class="arttime">
						时间:
						<fmt:formatDate value="${article.createdate}" pattern="yyyy-MM-dd" />
					</div>
					<hr/>
					<div class="artcontent">
						<div class="text">${articleText.text}</div>
						<!--第三方插件-->
						<div class="bdsharebuttonbox">
							<a href="#" class="bds_more" data-cmd="more"></a><a
								title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a><a
								title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a><a
								title="分享到QQ好友" href="#" class="bds_sqq" data-cmd="sqq"></a><a
								title="分享到百度贴吧" href="#" class="bds_tieba" data-cmd="tieba"></a><a
								title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a><a
								title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a>
						</div>
						<!--免责声明-->
						<span class="mianze">免责声明</span>
						<p class="tixing">另外提醒大家：本网站不会向任何人索要银行账号、密码、手机号或个人信息，亦没有委托任何个人或组织进行此类活动，由于个人原因导致被骗均与本网站无关。同时敬请群众提高警惕，避免上当受骗，一旦发现此类情况，请及时发邮件到本网站管理员
							kf@ytaoer.com</p>
						<p class="tixing">
							本网站并非专业教育和医疗机构，本网站所提供一切资料仅供参考，不能作为诊断、医疗和教育之依据。如果您发现孩子有任何异常，请及时去专业机构检查。对于任何单位，本
							网均不提供其资信担保，由此发生的责权关系与本网无关。</p>

					</div>
				</div>
			</div>
		</div>
		<!-- 多说评论框 start -->

		<!-- 多说评论框 end -->
	</div>
	<jsp:include page="duoshuo.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
