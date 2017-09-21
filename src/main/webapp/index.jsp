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
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function(){
	$("button").click(function(){
		$("div").toggle();
	});	
});
</script>
</head>
<body>
<h2>book store</h2>
<hr>
<form action="book/addBook" method="post">
<label>please input bookName：</label></br>
<input type="text" class="input w50"  name="bookName" /></br>
<label>please input bookPrice：</label></br>
<input type="text" class="input w50"  name="bookPrice"  /></br>
<label>please input bookAuthor：</label></br>
<input type="text" class="input w50"  name="bookAuthor"/></br>
<button type="submit">add book</button>
</form>
<hr>
<a href="book/showBooks" id="find">find all books</a>
<button >show</button>
<div id="result">
<table border="1">
	<c:forEach var="i"  items="${bookList}" >
           <tr>
              <td><c:out value="${i.bookId}"/><p></td>
              <td><c:out value="${i.bookName}"/><p></td>
              <td><c:out value="${i.bookPrice}"/><p></td>
              <td><c:out value="${i.bookAuthor}"/><p></td>
	       </tr>
	  </c:forEach>
</table>
</div>
    
<hr>
</body>
</html>