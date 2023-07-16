<%@page import="hrd01.DTO.MoneyDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hrd01.DBPKG.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver1.0 / 회원매출조회</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h3>회원매출조회</h3>

<%
List<MoneyDTO> list = new Dao().getMoneyList();
%>

<table border="1">
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
<%for(int i=0;i<list.size();i++){ %>
	<tr>
	<td><%=list.get(i).getCustno() %></td>
	<td><%=list.get(i).getCustname() %></td>
	<td><%=list.get(i).getGrade() %></td>
	<td><%=list.get(i).getSale() %></td>
	</tr>
<%} %>
</table>
<jsp:include page="footer.jsp"/>
</body>
</html>