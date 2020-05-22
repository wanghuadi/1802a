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
</head>
<body>
	
	<form action="queryAll" method="post">
		<select name="cid">
			<option value="">请选择阵营</option>
			<c:forEach items="${campList }" var="camp">
				<option value="${camp.cid }">${camp.cname }</option>
			</c:forEach>
		</select>
		<select name="status">
			<option value="">请选择状态</option>
			<option value="0">未拥有</option>
			<option value="1">已拥有</option>
		</select>
		价格区间:<input type="text" name="startPrice">~<input type="text" name="endPrice">
		<input type="submit" value="查询">
	</form>

	<a href="add.jsp"><input type="button" value="添加"></a>
	<table>
		<tr>
			<td>ID</td>
			<td>英雄</td>
			<td>阵营</td>
			<td>价格(钻石)</td>
			<td>状态</td>
			<td>上线时间</td>
			<td>图片</td>
			<td>操作</td>
		</tr>
	<c:forEach items="${page.list }" var="h">
		<tr>
			<td>${h.id }</td>
			<td>${h.name }</td>
			<td>${h.cname }</td>
			<td>${h.price }</td>
			<td>${h.status==1?"已拥有":"未拥有" }</td>
			<td>${h.uptime }</td>
			<td>
				<img alt="xx" height="60px" width="60px" src="lookImg?path=${h.picurl }">
			</td>
			<td>
				<a href="toBuy?id=${h.id }"><input type="button" value="购买"></a>			
				<a href="queryHeroById?id=${h.id }"><input type="button" value="详情"></a>				
			</td>
			
		</tr>
	</c:forEach>
	
	<tr>
		
		<td colspan="10">
		当前第${page.pageNum }页/共${page.pages }页
			<a href="?pageNum=1">首页</a>
			<a href="?pageNum=${page.pageNum-1 < 1?page.pageNum:page.pageNum-1 }">上一页</a>
			<a href="?pageNum=${page.pageNum+1 > page.pages?page.pageNum:page.pageNum+1 }">下一页</a>
			<a href="?pageNum=${page.pages }">尾页</a>
		</td>
	</tr>
	
	</table>
</body>
</html>