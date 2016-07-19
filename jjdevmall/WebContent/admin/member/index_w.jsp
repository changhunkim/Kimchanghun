<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#loginId').focus();
		$('#loginBtn').click(function(){
			if($('#loginId').val()==""){
				alert("ID를 입력하세요.");
				$('#loginId').focus();
			}else if($('#loginPw').val()==""){
				alert("PW를 입력하세요.");
				$('#loginPw').focus();
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
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form id="loginForm" action="<%=request.getContextPath()%>/member/loginAction.jsp" method="post">
			<table>
				<tr>
					<td>ID : </td>
					<td><input type = "text" id="loginId" name="loginId"></td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input type = "password" id="loginPw" name="loginPw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type = "button" id="loginBtn" value="Login"></td>
				</tr>
			</table>
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<%=sessionMemberId%>님 반갑습니다.<a href="<%=request.getContextPath()%>">[회원정보]</a>
		<a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">[로그아웃]</a>
<%		
	}
%>
</body>
</html>