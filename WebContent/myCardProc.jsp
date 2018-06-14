<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 모음집에 오신걸 환여</title>
<style>
html, body {
  position: relative;
  height: 100%;
  margin: 0;
  padding: 0;
}
.container {
font-family: 'helvetica', sans-serif;
font-size: 24px;
 transform: translate3d(0, 0, 0);
  background: linear-gradient(135deg, #2980b9 0%, #9b59b6 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e5799', endColorstr='#7db9e8',GradientType=1);

  position: relative;
  width: 100%;
  max-width: 960px;
  min-height: 100%;
  margin: 10px auto;
  padding: 20px;
  box-sizing: border-box;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}
.element-card {
  position: relative;
  width: 250px;
  height: 300px;
  transform-style: preserve-3d;
  transform: rotatey(0deg) translatex(0px) translatey(0px);
  transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  box-shadow: 4px 4px 20px rgba(0, 0, 0, 0.4);
  margin: 20px;
  cursor: pointer;
}
.element-card:hover {
  transform: rotatey(45deg) translatex(0px) translatey(0px);
}
.element-card.open {
    width: 250px;
  height: 300px;
  transform: rotatey(-180deg) translatex(0px) translatey(0px);
}
.element-card .front-facing {
  transform: rotateY(0deg) translateZ(2px);
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background-color: #ecf0f1;
  border: 2px white solid;
  border-radius: 5px;
}
.element-card .front-facing .abr {
  width: 100%;
  position: absolute;
  top: 30px;
  left: 0;
  font-size: 80px;
  margin: -35px 0 0 0;
  text-align: center;
  color: #3498db;
}
.element-card .front-facing .title {
  width: 100%;
  position: absolute;
  top: 60%;
  left: 0;
  text-transform: uppercase;
  font-size: 30px;
  margin: 15px 0 0 0;
  text-align: center;
  color: #3498db;
}
.element-card .back-facing {
  transform: rotateY(180deg) translateZ(0px);
  display: flex;
  flex-direction: column;
  flex-wrap: nowrap;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background-color: #ecf0f1;
  border: 2px white solid;
  border-radius: 5px;
  padding: 20px;
  text-align: center;
  overflow: hidden;
}
.element-card .back-facing p {
  font-size: 20px;
  margin: 0;
}
.element-card .back-facing a.btn {
  display: inline-block;
  background-color: white;
  padding: 5px;
  margin: 20px 0 0 0;
  color: #eee;
  background-color: #3498db;
  text-decoration: none;
  border-radius: 3px;
}
.element-card .back-facing a.btn:hover, .element-card .back-facing a.btn:focus {
  color: #fff;
  background-color: #2980b9;
}
.abr{
padding-top:50px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
	
	$('.element-card').on('click', function(){
		
		if ( $(this).hasClass('open') ) {
			$(this).removeClass('open');
		} else {
			$('.element-card').removeClass('open');
			$(this).addClass('open');
		}
		
	});
	
});
</script>
<%
	String[] chinaRe = {"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?"};
	String[] koreaRe = {"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?"};
	String[] numberRe = {"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?"};
	String[] addRe = {"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?"};

	String[] china = new String[16];
	String[] korea = new String[16];
	String[] number = new String[16];
	String[] add = new String[16];
	BufferedReader reader = null;
	int[] realNum = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	try{
		String filePath = application.getRealPath("/WEB-INF/lib/myCard.txt");
		reader = new BufferedReader(new FileReader(filePath));
		//out.print(filePath);
		while(true){
			String str = reader.readLine();
			if(str==null)break;
			int num = Integer.parseInt(str);
			//out.println(num);
			realNum[num-1] = 1;
		}//while
	}catch(Exception e){
		out.println("파일을 읽을 수 옶서요");
	}
	
	try{
		String filePath = application.getRealPath("/WEB-INF/lib/combi.txt");
		reader = new BufferedReader(new FileReader(filePath));
		int i=0;
		while(true){
			String str = reader.readLine();
			if(str==null)break;
			String[] arr = str.split("\t");
			number[i] = arr[0];
			china[i] = arr[1];
			korea[i] = arr[2];
			add[i] = arr[3];
			i++;
		}//while
		//out.println("<script>console.log('"+korea.get(u)+"');</script>");
	}catch(Exception e){
		out.println("파일을 읽을 수 옶서요");
	}
	
	for(int i=0; i<15; i++){
		if(realNum[i]==1){
			chinaRe[i] = china[i];
			koreaRe[i] = korea[i];
			addRe[i] = add[i];
		}
	}
%>
<h2>얼마나 카드를 모았을까?</h2>
<div class="container">
	<%
	int num=0;
	for(int j=0; j<5;j++){
		for(int k=0; k<3; k++){
	%>
	<div class="element-card">
		<div class="front-facing">
			<h1 class="abr"><%=chinaRe[num] %></h1>
			<p class="title"><%=koreaRe[num] %></p>
		</div>
		<div class="back-facing">
			<p class="addit"><%=addRe[num] %></p>
			<p><a class="btn" href="https://namu.wiki/w/<%=chinaRe[num] %>" target="_blank">더보기</a></p>
		</div>
	</div>
	<%
	num++;
	}
	out.println("<br>");
}
%>
</div>
</body>
</html>