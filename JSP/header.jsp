<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
	body{
		min-height:100%;
		background-color: lightgray;
	}
	body,html, header *, nav *{
		margin:0;
		padding:0;
	}
	header{
		background-color: navy;
		color:white;
	} 
	header h1{
		padding:25px;
		text-align:center;
	}
	nav{
		padding:20px;
		background-color: blue;
	}
	nav ul{
		display:flex;
	}
	nav ul>li{
		list-style:none;
	}
	nav ul>li>a{
		color:white;
		text-decoration:none;
		margin-left:40px;
	}
	
	h3{
		text-align:center;
		padding:30px
	}
	table{
		margin:0 auto;
	}
	td,th{
		padding : 10px 20px;
		text-align:center;
	}
</style>
</head>
<body>
<header>
<h1>쇼핑몰 회원관리 ver 1.0</h1>
<nav>
<ul>
	<li><a href="insertMember.jsp">회원등록</a></li>
	<li><a href="searchMember.jsp">회원목록조회/수정</a></li>
	<li><a href="searchSale.jsp">회원매출조회</a></li>
	<li><a href="index.jsp">홈으로</a></li>
</ul>
</nav>
</header>
</body>
</html>