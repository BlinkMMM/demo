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
	<base href="<%=basePath%>"/>
	<title></title>
	<link rel="stylesheet" href="css/book.css">
	<script src="js/jquery-3.2.1.js"></script>
	<script>
		$(function(){
			$("#show").click(function(){
				$("#result").toggle();
			});	
		});

		function ajaxTest(){
			$.ajax({
				url:"book/showBooksWithJson",
				type:"post",
				dataType:'json',
				success:function(data){
					var json=eval(data);
					var str= "";
					$.each(json,function(index){
						str += "<tr>" +  
						"<td>" + json[index].bookId+ "</td>" +  
						"<td>" + json[index].bookName+ "</td>" +  
						"<td>" + json[index].bookPrice+ "</td>" +  
						"<td>" + json[index].bookAuthor+ "</td>" +  
						"</tr>";  
					});
					document.getElementById("table").innerHTML=str;
				}
			});
		}
		function fetchTest(){
			fetch('book/showBooksWithJson',{method:"post"})
			.then(function(response){
				console.log(response.headers.get('Content-Type'));
				console.log(response.headers.get('Date'));
				return response.json();
			}).then(function(data){
				var json=eval(data);
				var str= "";
				for (var i =0;i< data.length; i++) {
					str += "<tr>" +  
					"<td>" + json[i].bookId+ "</td>" +  
					"<td>" + json[i].bookName+ "</td>" +  
					"<td>" +json[i].bookPrice+ "</td>" +  
					"<td>" + json[i].bookAuthor+ "</td>" +  
					"</tr>";  
				}
				document.getElementById("table1").innerHTML=str;
			}).catch(function(e){
				console.log("error");
			});
		}
		function fetchTest2(){
			fetch('book/showBooksWithJson',{method:"post"})
			.then(response => response.json())
			.then(data => console.log(data))
			.catch(e => console.log("error",e) );
		}
		
	</script>
</head>
<body>
	<h2>book store</h2>
	<a href="book/home">go home!</a>
	<hr>
	<div id="first">
		<h3>add a new book !</h3>
		<form action="book/addBook" method="post">
			<label>please input bookName：</label><br>
			<input type="text" class="input w50"  name="bookName"  required="" /><br>
			<label>please input bookPrice：</label><br>
			<input type="text" class="input w50"  name="bookPrice"  required="" /><br>
			<label>please input bookAuthor：</label><br>
			<input type="text" class="input w50"  name="bookAuthor" required="" /><br><br>
			<button type="submit">add book</button>
		</form>
	</div>
	<hr>
	<div id = "second">
		<h3>show all books for me !</h3>
		<form action="book/showBooks" method="post">
			<button type="submit"  >find all books</button>
		</form>
		<button id="show" >show and hide</button>
		<table border="1"  id="result">
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
<div id="third">
	<table border="1" id="table">
		<button onclick="ajaxTest()">find all</button>
	</table>
	<table border="1" id="table1">
		<button onclick="fetchTest()">fetch test</button>
	</table>
	<button onclick="fetchTest2()">fetch test2</button>
</div>
<hr>
</body>
</html>