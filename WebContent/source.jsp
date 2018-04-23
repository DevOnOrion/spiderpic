<%@page import="com.tz.util.DownImgUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<% 
	//获取url
	String url=request.getParameter("url");
	String htmlSource=DownImgUtil.htmlSource(url, "gbk");
	pageContext.setAttribute("htmlSource", htmlSource);
%>

<body>
	<div id="box" style="width: 1120px;margin:0 auto;text-align: center;">
		<h1>Java实现网络图片下载-蓝桥老师</h1>
		<textarea style="width: 1120px;height: 460px;overflow: auto" id="source">${htmlSource}</textarea>
	</div>
	<hr>
	<form action="download.jsp" method="post" id="form">
		<input type="submit" value="下载" style="width:180px;height:35px;">
	</form> 
	<hr>
	<h3>您一共找到符合需求的图片有:<span id="count"></span>张</h3>
	<script type="text/javascript">
	//当前页面加载完成执行
		$(function() {
			var source=$("#source").val();
			var $source=$(source);
			var i=0;
			$source.find("img").each(function(){
				//获取路径
				var src=$(this).attr("src");
				if(src!=""&&src.length>0){
					if(src.indexOf(".jpg")!=-1||src.indexOf(".png")!=-1||src.indexOf(".gif")!=-1){
						$("body").append("<div style='float:left;margin:10px;'><img src='"+src+"' width='180px' height='180px' /></div>");
						++i;
					}
				}
			});
			
			$("#count").text(i);
		});
	</script>
</body>
</html>