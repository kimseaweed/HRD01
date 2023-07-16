<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,hrd01.DTO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver1.0 / 회원목록 조회/수정</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h3>회원정보 조회/수정</h3>
<table border="1">
<thead>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
</thead>
<tbody>
<%
List<MemberDTO> list = new hrd01.DBPKG.Dao().getSearchMemberList();
for(int i=0;i<list.size();i++){ %>
	<tr>
	<td><a href="updateMember.jsp?custno=<%=list.get(i).getCustno()%>&
	custname=<%=list.get(i).getCustname()%>&
	phone=<%=list.get(i).getPhone()%>&
	address=<%=list.get(i).getAddress()%>&
	joindate=<%=list.get(i).getJoindate()%>&
	grade=<%=list.get(i).getGradeStr()%>&
	city=<%=(String) list.get(i).getCity()%>
	"><%=list.get(i).getCustno()%></a></td>
	<td><%=list.get(i).getCustname()%></td>
	<td><%=list.get(i).getPhone()%></td>
	<td><%=list.get(i).getAddress()%></td>
	<td><%=list.get(i).getJoindate()%></td>
	<td><%=list.get(i).getGradeStr()%></td>
	<td><%=(String) list.get(i).getCity()%></td>
	</tr>
<%} %>
</tbody>
</table>
<jsp:include page="footer.jsp"/>
</body>
</html>