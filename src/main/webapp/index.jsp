<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<h2>ssss</h2>
<form action="book/showBooks" method="post">
<button type="submit">查询所有书籍</button>
</form>
<hr>
    <c:forEach var="i"  items="${bookList}">
           <tr>
              <td><c:out value="${i.booId}"/><p></td>
              <td><c:out value="${i.bookName}"/><p></td>
              <td><c:out value="${i.bookPrice}"/><p></td>
              <td><c:out value="${i.bookAuthor}"/><p></td>
	       </tr>
	  </c:forEach>
<hr>
</body>
</html>