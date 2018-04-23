<%@page import="com.tz.util.DownImgUtil"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<%
		String[] imgs = request.getParameterValues("img");
		String imgPath=request.getRealPath("/")+"down";
		File file=new File(imgPath);
		if(!file.exists()){
			file.mkdirs();
		}
		
		for(String img:imgs){
			String fileName=img.substring(img.lastIndexOf("/")+1,img.length());
			DownImgUtil.downloading(img, imgPath+"/"+fileName);
		}
	%>
</body>
</html>