<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hrd01.DBPKG.*,hrd01.DTO.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%

PrintWriter script = response.getWriter();

Dao dao = new Dao();

String action = request.getParameter("action");

MemberDTO dto = new MemberDTO(
Integer.parseInt(request.getParameter("custno")),
request.getParameter("custname"),
request.getParameter("phone"),
request.getParameter("address"),
request.getParameter("joindate"),
request.getParameter("grade"),
request.getParameter("city") );



if(action.equals("insert")){
	int row=dao.setMemberInsert(dto);
	if(row==1){
		script.println("<script>");
		script.println("alert('회원등록이 완료 되었습니다.');");
		script.println("location.href='insertMember.jsp';");		
		script.println("</script>");
	}else{
		if(row==0){
			script.println("<script>");
			script.println("alert('이미 존재하는 회원번호입니다.');");
			script.println("history.back();");	
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('데이터베이스 오류.');");
			script.println("history.back();");	
			script.println("</script>");
		}
	}
}else{
	int row = dao.setMemberUpdate(dto);
	if(row==1){
		script.println("<script>");
		script.println("alert('회원정보 수정이 완료 되었습니다.');");
		script.println("history.back();");		
		script.println("</script>");
	}else{
		if(row==0){
			script.println("<script>");
			script.println("alert('이미 존재하는 회원번호입니다.');");
			script.println("history.back();");	
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('데이터베이스 오류.');");
			script.println("history.back();");	
			script.println("</script>");
		}
	}
}

%>
</body>
</html>