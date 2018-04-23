<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>梦想集群 . Java学院</h1>
</div>
	<form action="source.jsp" method="post" onsubmit="return validator();">
			<input type="text" placeholder="请输入URL: 如: http://www.qq.com" name="url" id="url" />
			<input type="submit" class="btn" value="获取网页源代码" onclick="validator();" >
	</form>
	<h4>需要视频素材等加助理老师QQ</h4>
	<script type="text/javascript">
		//拿到输入框里面的值，判断是否是网址
		function validator() {
			
			//拿到输入框里面的值 
			var url=document.getElementById("url").value;
			//如果输入框里面没有内容
			if(url==""||url.length==0){
				alert("请输入网址");
				document.getElementById().focus();
				return false;
			}
			
			if(url!=null&&url.indexOf("http://")==-1){
				alert("请输入一个正确的网址");
				document.getElementById().focus();
				return false;
			}
		}
	</script>
</body>
</html>