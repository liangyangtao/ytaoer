<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%!
    String androidReg = "\\bandroid|Nexus\\b";
	String iosReg = "ip(hone|od|ad)";

	Pattern androidPat = Pattern.compile(androidReg, Pattern.CASE_INSENSITIVE);
	Pattern iosPat = Pattern.compile(iosReg, Pattern.CASE_INSENSITIVE);

	public boolean likeAndroid(String userAgent) {
		if (null == userAgent) {
			userAgent = "";
		}
		// 匹配
		Matcher matcherAndroid = androidPat.matcher(userAgent);
		if (matcherAndroid.find()) {
			return true;
		} else {
			return false;
		}
	}
	public boolean likeIOS(String userAgent) {
		if (null == userAgent) {
			userAgent = "";
		}
		// 匹配
		Matcher matcherIOS = iosPat.matcher(userAgent);
		if (matcherIOS.find()) {
			return true;
		} else {
			return false;
		}
	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";

	String userAgent = request.getHeader("USER-AGENT").toLowerCase();
	System.out.println("userAgent: " + userAgent);
	if (null == userAgent) {
		userAgent = "";
	}
	if (likeAndroid(userAgent)) {
		System.out.println("likeAndroid: " + true);
		response.sendRedirect("/wap/index.jsp");
		//request.getRequestDispatcher("/download.html").forward(request,response);
	} else if (likeIOS(userAgent)) {
		System.out.println("likeIOS: " + true);
		response.sendRedirect("/wap/index.jsp");
		//request.getRequestDispatcher("/index.html").forward(request,response);
	}else{
	   	response.sendRedirect("/view/index.do");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>首页 婴淘社区</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
<!-- 	<script type="text/javascript">
		window.location = "/view/index.do"
	</script> -->
</body>
</html>
