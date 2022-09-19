<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javaPro.inquiryDAO"%>
<%@ page import="javaPro.inquiry"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트 문장사용 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 건너오는 모든 파일을 UTF-8로 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
	String userID = null;
	// 로그인 된 사람은 회원가입페이지에 들어갈수 없다
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
	}
	int inquiryID = 0;
	if (request.getParameter("bbsID") != null) {
		inquiryID = Integer.parseInt(request.getParameter("inquiryID"));
	}
	if (inquiryID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 행위입니다')");
		script.println("location.href = '/.jsp'");
		script.println("</script>");
	}
	else{
		inquiryDAO InquiryDAO = new inquiryDAO();
		int result = InquiryDAO.delete(inquiryID);
		if (result == -1) { // 글삭제에 실패했을 경우
			PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 글삭제에 성공했을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href= 'Bbs.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>
