<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver1.0 / 회원수정</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h3>홈쇼핑 회원수정</h3>
<form action="action.jsp" name=update>
<input type="hidden" name="action" value="update" />
<table border="1">
	<tr>
		<td>회원번호</td>
		<td><input type="text" name="custno" value="<%=request.getParameter("custno")%>" readonly/></td>
	</tr>
	<tr>
		<td>회원성명</td>
		<td><input type="text" name="custname" value="<%=request.getParameter("custname")%>"/></td>
	</tr>
	<tr>
		<td>회원전화</td>
		<td><input type="text" name="phone" value="<%=request.getParameter("phone")%>"/></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input type="text" name="address" value="<%=request.getParameter("address")%>"/></td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" value="<%=request.getParameter("joindate")%>"/></td>
	</tr>
	<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<% String grade =  request.getParameter("grade");
		switch(grade){
		case "VIP" : grade="A";break;
		case "일반" : grade="B";break;
		case "직원" : grade="C";break;
		}
		%>
		<td><input type="text" name="grade" value="<%=grade%>"/></td>
	</tr>
	<tr>
		<td>도시코드</td>
		<td><input type="text" name="city" value="<%=request.getParameter("city")%>"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정" onclick="checkForm(); return false;"/><input type="button" onclick="location='searchMember.jsp'" value="조회"/></td>
	</tr>
</table>
</form>

<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
function checkForm(){
	if(document.update.custname.value==""){
		alert('회원성명이 입력되지 않았습니다');
		document.update.custname.focus();
		return false;
	}else if(document.update.phone.value==""){
		alert('회원전화가 입력되지 않았습니다');
		document.update.phone.focus();
		return false;
	}else if(document.update.address.value==""){
		alert('회원주소가 입력되지 않았습니다');
		document.update.address.focus();
		return false;
	}else if(document.update.joindate.value==""){
		alert('가입일자가 입력되지 않았습니다');
		document.update.joindate.focus();
		return false;
	}else if(document.update.grade.value==""){
		alert('고객등급이 입력되지 않았습니다');
		document.update.grade.focus();
		return false;
	}else if(document.update.city.value==""){
		alert('도시코드가 입력되지 않았습니다');
		document.update.city.focus();
		return false;
	}else{			
	update.submit();
	}
}
</script>
</html>