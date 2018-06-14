<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
.drag {
	width: 150px;
	height: 150px;
	background: #98A1DD;
	display: inline-block;
	margin: 10px auto;
	margin-left: 10px;
	margin-right: 10px;
}

span{
	font-size: 60px;
}

.drag p{
	font-size: 20px;
}
.big {
	width: 170px;
	height: 170px;
	border: 2px dashed gray;
	margin: 20px;
}

section {
	width: 880px;
	height: 500px;
	background: #C9E8ED;
	margin: 15px auto;
	padding: 20px;
}
#table{
margin:15px auto;
}
</style>
<meta charset="utf-8">
<title>Drag & Drop</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<script>
		function dragStart(ev) {
			ev.dataTransfer.effectAllowed = 'copy';
			ev.dataTransfer.setData("id", ev.target.getAttribute('id'));
			ev.dataTransfer.setDragImage(ev.target, 100, 100);
			return true;
		}
		function dragEnter(ev) {
			event.preventDefault();
			return true;
		}
		function dragOver(ev) {
			event.preventDefault();
		}
		var data1;
		var data2="";
		function dragDrop1(ev) {
			data1 = ev.dataTransfer.getData("id");
			console.log(data1);
			ev.target.appendChild(document.getElementById(data1));
			ev.stopPropagation();
			return false;
		}
		function dragDrop2(ev) {
			data2 = ev.dataTransfer.getData("id");
			console.log(data2);
			ev.target.appendChild(document.getElementById(data2));
			ev.stopPropagation();
			return false;
		}
	</script>
	<%
		String[] china = new String[16];
		String[] korea = new String[16];
		String[] imgSRC = new String[16];

		BufferedReader reader = null;
		try {
			String filePath = application.getRealPath("/WEB-INF/lib/picto.txt");
			reader = new BufferedReader(new FileReader(filePath));
			int i = 0;
			while (true) {
				String str = reader.readLine();
				if (str == null)
					break;
				String[] arr = str.split("\t");
				//out.print(str);
				china[i] = arr[0];
				korea[i] = arr[1];
				imgSRC[i] = arr[2];
				i++;
			} //while
				//out.println("<script>console.log('"+korea.get(u)+"');</script>");
		} catch (Exception e) {
			out.println("파일을 읽을 수 옶서요");
		}
	%>
	<section id="section" ondragenter="return dragEnter(event)"
		ondrop="return dragDrop(event)" ondragover="return dragOver(event)">
		<%
		int cnt=0;
		for(int i=0; i<3;i++){
			for(int j=0; j<5; j++){
				%>
				<div class="drag" id="box<%=cnt %>" draggable="true"
					ondragstart="return dragStart(event)" name="box<%=cnt %>" value="<%=cnt %>">
					<span><%=china[cnt]%></span>
					<p><%=korea[cnt]%></p>
					</div>
				<%
				cnt++;
			}
			out.print("<br>");
		}
		%>
	</section>
	<table id="table">
		<tr>
			<td>
				<div class="big" id="leftB" ondragenter="return dragEnter(event)"
					ondrop="return dragDrop1(event)" ondragover="return dragOver(event)"></div>
			</td>
			<td>
				<span>+</span>
			</td>
			<td>
				<div class="big" id="rightB" ondragenter="return dragEnter(event)"
					ondrop="return dragDrop2(event)" ondragover="return dragOver(event)">
				</div>
			</td>
			<td>
				<span>=</span>
			</td>
			<td><div class="big" id="combiBox" >
				</div>
			</td>
		</tr>
	</table>
	
	<button class="button" onclick="comb()">조합하기</button>
	<form action="saveCard.jsp">
	<input type="hidden" id="hidVal" name="hidVal">
	<input type="submit" class="button" name="카드 저장하기">
	</form>
	<script>
	function comb(){
		var combi;//한자
		var answer;//뜻이름
		var val; //한자 num
		if((data1=="box0"&&data2=="box1")||(data1=="box1"&&data2=="box0")){
			val=1;
			combi="明";
			answer="밝을 명";
		}else if(data1=="box4"&&data2==""){
			val=2;
			combi="林";
			answer="수풀 림";
		}else if(data1=="box2"&&data2==""){
			val=3;
			combi="炎";
			answer="불꽃 염";
		}
		else if((data1=="box13"&&data2=="box11")||(data1=="box11"&&data2=="box13")){
			val=4;
			combi="問";
			answer="물을 문";
		}
		else if((data1=="box13"&&data2=="box0")||(data1=="box0"&&data2=="box13")){
			val=5;
			combi="間";
			answer="사이 간";
		}
		else if((data1=="box13"&&data2=="box12")||(data1=="box12"&&data2=="box13")){
			val=6;
			combi="聞";
			answer="들을 문";
		}
		else if((data1=="box1"&&data2=="box11")||(data1=="box11"&&data2=="box1")){
			val=7;
			combi="名";
			answer="이름 명";
		}//////////////////////////////////////////////////////////////////////////////////////////////////
		else if(data1=="box14"&&data2==""){
			val=8;
			combi="仌";
			answer="얼음 빙, 엉길 응";
		}
		else if((data1=="box4"&&data2=="box14")||(data1=="box14"&&data2=="box4")){
			val=9;
			combi="朲";
			answer="지붕들보 인";
		}
		else if((data1=="box4"&&data2=="box9")||(data1=="box9"&&data2=="box4")){
			val=10;
			combi="李";
			answer="오얏 리";
		}
		else if((data1=="box4"&&data2=="box11")||(data1=="box11"&&data2=="box4")){
			val=11;
			combi="杏";
			answer="살구 행";
		}
		else if((data1=="box10"&&data2=="box9")||(data1=="box9"&&data2=="box10")){
			val=12;
			combi="好";
			answer="좋을 호";
		}
		else if(data1=="box0"&&data2==""){
			val=13;
			combi="昍";
			answer="밝을 훤";
		}else if((data1=="box7"&&data2=="box14")||(data1=="box14"&&data2=="box7")){
			val=14;
			combi="㞤";
			answer="도울 음, 높을 잠";
		}else if((data1=="box12"&&data2=="box2")||(data1=="box2"&&data2=="box12")){
			val=15;
			combi="耿";
			answer="빛날 경";
		}
		else{
			combi="?";
			answer="?? ?";
			alert("값이 없군요!!");
		}
		document.getElementById('combiBox').value = val;
		document.getElementById('hidVal').value = val;
		document.getElementById('combiBox').innerHTML = "<h1>"+combi+"</h1><h4>"+answer+"</h4>";
		<%
		
		%>
		
	}
	</script>

</body>
</html>