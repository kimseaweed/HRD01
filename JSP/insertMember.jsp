<%@page import="java.time.LocalDate,hrd01.DBPKG.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver1.0 / 회원등록</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h3>홈쇼핑 회원등록</h3>
<form action="action.jsp" name="insert">
<input type="hidden" name="action" value="insert" />
<table border="1">
	<tr>
		<td>회원번호(자동발생)</td>
		<td><input type="text" name="custno" value="<%=new Dao().getCustnoInsert() %>" readonly/></td>
	</tr>
	<tr>
		<td>회원성명</td>
		<td><input type="text" name="custname"/></td>
	</tr>
	<tr>
		<td>회원전화</td>
		<td><input type="text" name="phone" /></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input type="text" name="address"/></td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" value="<%=LocalDate.now()%>"readonly/></td>
	</tr>
	<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<td><input type="text" name="grade" /></td>
	</tr>
	<tr>
		<td>도시코드</td>
		<td><input type="text" name="city"/></td>
	</tr>
	<tr style="text-align:center;">
		<td colspan="2"><input type="submit" value="등록" onclick="checkForm(); return false;"/><input type="button" onclick="location='searchMember.jsp'" value="조회"/></td>
	</tr>
</table>
</form>

<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
	function checkForm(){
		if(document.insert.custname.value==""){
			alert('회원성명이 입력되지 않았습니다');
			document.insert.custname.focus();
			return false;
		}else if(document.insert.phone.value==""){
			alert('회원전화가 입력되지 않았습니다');
			document.insert.phone.focus();
			return false;
		}else if(document.insert.address.value==""){
			alert('회원주소가 입력되지 않았습니다');
			document.insert.address.focus();
			return false;
		}else if(document.insert.joindate.value==""){
			alert('가입일자가 입력되지 않았습니다');
			document.insert.joindate.focus();
			return false;
		}else if(document.insert.grade.value==""){
			alert('고객등급이 입력되지 않았습니다');
			document.insert.grade.focus();
			return false;
		}else if(document.insert.city.value==""){
			alert('도시코드가 입력되지 않았습니다');
			document.insert.city.focus();
			return false;
		}else{			
		insert.submit();
		}
	}
</script>
</html>