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
	function buy(id){
		
		$.post("buy",{"id":id},function(data){
			
			if(data){
				alert("购买成功!");
				location.href="queryAll";
			}else{
				alert("购买失败!")
			}
			
		})
		
	}
</script>
</head>
<body>
	
	
	<form action="#" method="post">
			<input type="hidden" name="id" value="${hero.id }">
		英雄:<input type="text" readonly="readonly" value="${hero.name }"><br><br>
		价格:<input type="text" readonly="readonly" value="${hero.price }"><br><br>
		阵营:<select name="cid" disabled="disabled">
				<option value="">请选择阵营</option>
				<c:forEach items="${campList }" var="camp">
					<option value="${camp.cid }" <c:if test="${camp.cid==hero.cid }">selected="selected"</c:if>>${camp.cname }</option>
				</c:forEach>
			</select><br><br>
		状态:<select name="status" disabled="disabled">
				<option value="">请选择状态</option>
				<option value="0" <c:if test="${hero.status == 0 }">selected="selected"</c:if>>未拥有</option>
				<option value="1" <c:if test="${hero.status == 1 }">selected="selected"</c:if>>已拥有</option>
			</select><br><br>
		图片:<img alt="xx" height="60px" width="60px" src="lookImg?path=${hero.picurl }"><br><br>
		<input type="button" value="提交" onclick="buy('${hero.id}')">
	</form>
	
</body>
</html>