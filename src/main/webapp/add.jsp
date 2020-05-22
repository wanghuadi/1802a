<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>

<script type="text/javascript">

	$(function(){
		
		$.post("queryCampAll",function(data){
			var str = "";
			for(var i in data){
				str+="<option value='"+data[i].cid+"'>"+data[i].cname+"</option>"
			}
			$("#camp").append(str);
		})
	})
</script>

</head>
<body>
	
	
	<form action="addHer" enctype="multipart/form-data" method="post">
		英雄:<input type="text" name="name"><br><br>
		价格:<input type="text" name="price"><br><br>
		阵营:<select name="cid" id="camp">
				<option value="">请选择阵营</option>
			</select><br><br>
		状态:<select name="status">
				<option value="">请选择状态</option>
				<option value="0">未拥有</option>
				<option value="1">已拥有</option>
			</select><br><br>
		图片:<input type="file" name="file"><br><br>
		<input type="submit" value="提交">
	
	</form>
	
		
</body>
</html>