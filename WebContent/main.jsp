<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한자배우는 어린이 : 한 린</title>
<link rel="stylesheet" type="text/css" href="color.css">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
#left{ float:left;}
 ul{width:50%;
        list-style:none;
        text-align: center;
        border-top :2px solid steelblue;
        border-bottom: 2px solid teal;
        padding:10px 0px;
    }

    ul li{
        display: inline;
        margin: 10px;
        text-transform: uppercase;
        letter-spacing: 3px;
        padding:10px;
    }
    ul li a{
        text-decoration: none;
        color:tomato;
    }
</style>
</head>
<body>
	<%
		String contentpage = request.getParameter("CONTENTPAGE");
	%>
	<div id="main">
	<header class="sidebar">
	<div>
		<h2><a href="index.jsp" target="_self"><span class="grad">한</span>자배우는 어<span class="grad">린</span>이 : 한 린</a></h2>
	</div>
	<center>
    <nav>
    	 <ul>
     		<li><a href="pictoChar.jsp">배우기</a></li>
			<li><a href="cardLab.jsp">카드 실험실</a></li>
			<li><a href="myCard.jsp">카드 모음집</a></li>
     	 </ul> 
    </nav>  
    </center>
	</header>
	<div id="content">
	<jsp:include page="<%= contentpage %>"></jsp:include>
	</div>
	</div>
</body>
</html>