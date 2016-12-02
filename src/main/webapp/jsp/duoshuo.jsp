<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 多说评论框 start -->
<!-- <div class="ds-thread"></div>
	<script type="text/javascript">var duoshuoQuery = {short_name:"liangyangtao"};	(function() {
		var ds = document.createElement('script');
		ds.type = 'text/javascript';
		ds.async = true;
		ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:')
				+ '//static.duoshuo.com/embed.js';
		ds.charset = 'UTF-8';
		(document.getElementsByTagName('head')[0] || document
				.getElementsByTagName('body')[0]).appendChild(ds);
	})();</script> -->
<!-- 多说评论框 end -->

<!--PC和WAP自适应版-->
<div id="SOHUCS" ></div> 
<script type="text/javascript"> 
(function(){ 
var appid = 'cysJ0pkO5'; 
var conf = 'prod_6b21383cccf01324c8f87115ea606f43'; 
var width = window.innerWidth || document.documentElement.clientWidth; 
if (width < 960) { 
window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
