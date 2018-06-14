<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String number = request.getParameter("hidVal");
PrintWriter writer = null;
try{
	String filePath = application.getRealPath("/WEB-INF/lib/myCard.txt");
	out.println(filePath);
	writer = new PrintWriter(new FileWriter(filePath, true));
	writer.println(number);
	writer.flush();
	out.println("<script> var r = confirm('내 카드 모음집으로 이동합니다.'); ");
	out.println("if (r == true) {");
	out.println("location.href = 'myCard.jsp';");
	out.println("}");
	out.println("</script>");
}
catch(Exception e){
	out.println("오류 발생");
	e.printStackTrace();
}
%>
</body>
</html>