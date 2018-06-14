<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Quicksand');
*, *:before, *:after {
  box-sizing: border-box;
}
body {
  height: 100vh;
  width: 100vw;
  margin: 0;
  padding: 0;
  
}
.container {
font-family: "Quicksand", sans-serif;
  font-size: 40px;
  height: 100%;
  width: 100%;
  padding: 5px;
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: repeat(9, 1fr);
  grid-gap: 10px;
}
.image img {
width:300px;
}

.china{
font-size:5em;
}

</style>
</head>
<%
		String pictoChar = request.getParameter("pictoChar");
	%>
<body>
	<script>
	$(function() {
		  $('.container div').click(function() {
		    $(this).toggleClass('flip')  
		  });
		})
</script>
	<h2><span class="grad">상형문자</span>란? 사물의 모양을 본떠 만든 문자!</h2>
	<%
	String[] china = new String[15];
	String[] korea = new String[15];
	String[] imgSRC = new String[15];
	
	BufferedReader reader = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/lib/picto.txt");
		reader = new BufferedReader(new FileReader(filePath));
		int i=0;
		while(true){
			String str = reader.readLine();
			if(str==null)break;
			String[] arr = str.split("\t");
			china[i] = arr[0];
			korea[i] = arr[1];
			imgSRC[i] = arr[2];
			i++;
		}//while
		//out.println("<script>console.log('"+korea.get(u)+"');</script>");
	}catch(Exception e){
		out.println("파일을 읽을 수 옶서요");
	}
%>
<%
//+"<img src='WEB-INF/lib/img/"+imgSRC+".png'
int cnt=0;
for(int i=0;i<5; i++ ){
	out.println("<div class='wiley-flip-cards'>");
	for(int j=0;j<3; j++ ){
		out.println("<div class='wiley-flip-card'>");
		out.println("<div class='wiley-flip-card-front uob' tabindex='0'>");
		out.println("<p class='image'><img src='image/"+imgSRC[cnt]+".png'></p></div>");
		out.println("<div class='wiley-flip-card-back uob' tabindex='0'>");
		out.println("<h1 class='china'>"+china[cnt]+"</h1><p class='korea'>"+korea[cnt]+"</p>");
		out.println("</div>");
		out.println("</div><br>");
		cnt++;
	}
	out.println("</div>");
}
%>
<script type="text/javascript" src="https://mediateam.tools/flipcard/public/js/cards.js"></script>

</body>
</html>