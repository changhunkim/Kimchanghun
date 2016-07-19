<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#loginId').focus();
		$('#loginBtn').click(function(){
			if($('#admId').val()==""){
				alert("ID를 입력하세요.");
				$('#admId').focus();
			}else if($('#admPw').val()==""){
				alert("PW를 입력하세요.");
				$('#admPw').focus();
			}else{
				$('#loginForm').submit();
			}
		});
	});
</script>
</head>
<body>
<h1>Login</h1>

<%
	String sessionMemberId = (String)session.getAttribute("sessioAdminId");
	
	if(sessionMemberId == null) { // 로그인이 안된 상태
		
		//아래에<%=request.getContextPath()이걸 붙여주는 이유가 머지
		
%>
		<form id= "loginForm" action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp"> 
			<!-- 로그인 폼 구현 -->
			
			<input type="text"  id="admId" name="admId">
			<input type="password"  id="admPw" name="admPw">
			<input type="button" id="loginBtn" value="Log-in">
		</form>
<%		
	} else { // 로그인이 된 상태

%>
		<ol>
			<li><a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">로그아웃</a>
			<li><a href="">상품관리</a></li>
			<li><a href="">주문관리</a></li>
			<li><a href="">회원관리</a></li>
		</ol>
		
		
		
<%		
	}
%>
</body>
</html>