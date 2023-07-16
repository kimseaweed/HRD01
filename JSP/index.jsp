<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="hrd01.DBPKG.ConnectionDB,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver1.0 </title>
<style>
	section *{
		margin:0;
		padding:0;
	}
	section>div{
		margin-left:30px;
	}
	section ol>li{
		margin-left:20px;
	}
div{
margin:0 auto;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"/>
<section>
	<h3>쇼핑몰회원관리 프로그램</h3>
	<div>
	<p>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 </p>
	<h4>프로그램 작성 순서</h4>
	<ol>
		<li>회원정보 테이블을 생성한다</li>
		<li>매출정보 테이블을 생성한다</li>
		<li>회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다</li>
		<li>회원정보 입력 회면 프로그램을 작성한다</li>
		<li>회원정보 조회 프로그램을 작성한다</li>
		<li>회원매출정보 조회 프로그램을 작성한다.</li>
	</ol>
	</div>
</section>
<div>
<h4>서버연결상태</h4>
<% 
try{
	Connection conn = ConnectionDB.getConnection();
	if(conn==null){
		out.println("서버연결실패");
	}else{
		out.println("서버연결완료");
	}
}catch(Exception e){
	out.println("서버오류발생");
	e.printStackTrace();
}
%>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>