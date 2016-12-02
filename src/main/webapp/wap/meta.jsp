<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0">   
<meta name="keywords"
	content="婴淘社区 社区 婴淘 樱桃 宝宝 育儿 奶爸 辣妈  ${title} 怎么办 怎么样 怎么做  哪儿 孩子" />
<meta name="description"
	content="社区 婴淘 樱桃 宝宝 育儿 奶爸 辣妈 ${title} 用心让宝宝过得更好,给予宝宝更好的爱" />
<title>${title} 婴淘社区 用心让宝宝过得更好,给予宝宝更好的爱</title>
<meta name="author" content="婴淘社区,婴淘,樱桃">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
	content="initial-scale=1, user-scalable=0, minimal-ui" charset="UTF-8">
<!-- UC强制全屏 -->
<meta name="full-screen" content="yes">
<!-- QQ强制全屏 -->
<meta name="x5-fullscreen" content="true">
<meta name="format-detection" content="telephone=no" />
<meta name="format-detection" content="email=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<!--删除默认的苹果工具栏和菜单栏。-->
<!-- sina weibo -->
<meta property="wb:webmaster" content="537e0605ddd0245b" />
<meta name="baidu-site-verification" content="5yitR6Sd90" />
<meta name="baidu-site-verification" content="3g0s03bUko" />
<meta name="baidu_union_verify"
	content="fef172a4371cbb5af26740f8368c5800">
<!-- google fonts -->
<!--<link href="http://fonts.useso.com/css?family=PT+Serif:400,700,400italic,700itali" rel="stylesheet">-->
<!--<link href="http://fonts.useso.com/css?family=Raleway:400,900,800,700,500,200,100,600" rel="stylesheet">-->
<!-- Bootstrap styles -->
<link rel="stylesheet" type="text/css" href="/wap/css/ini.css" />
<link rel="stylesheet" type="text/css" href="/wap/css/index.css" />
<link rel="stylesheet" href="/wap/font_awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/wap/css/swiper.css">
<!-- <link rel="stylesheet" href="/wap/css/dropload.css"> -->

<link rel="shortcut icon" href="/assets/images/favicon.ico"
	type="image/x-icon" />
<script>
        !function(e){function t(a){if(i[a])return i[a].exports;var n=i[a]={exports:{},id:a,loaded:!1};return e[a].call(n.exports,n,n.exports,t),n.loaded=!0,n.exports}var i={};return t.m=e,t.c=i,t.p="",t(0)}([function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i=window;t["default"]=i.flex=function(e,t){var a=e||100,n=t||1,r=i.document,o=navigator.userAgent,d=o.match(/Android[\S\s]+AppleWebkit\/(\d{3})/i),l=o.match(/U3\/((\d+|\.){5,})/i),c=l&&parseInt(l[1].split(".").join(""),10)>=80,p=navigator.appVersion.match(/(iphone|ipad|ipod)/gi),s=i.devicePixelRatio||1;p||d&&d[1]>534||c||(s=1);var u=1/s,m=r.querySelector('meta[name="viewport"]');m||(m=r.createElement("meta"),m.setAttribute("name","viewport"),r.head.appendChild(m)),m.setAttribute("content","width=device-width,user-scalable=no,initial-scale="+u+",maximum-scale="+u+",minimum-scale="+u),r.documentElement.style.fontSize=a/2*s*n+"px"},e.exports=t["default"]}]);
    flex(100, 1);
    </script>


