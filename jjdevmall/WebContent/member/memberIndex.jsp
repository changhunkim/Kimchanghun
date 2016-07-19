<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	div
	{	
		border: 1px solid #000000;
		width: 50%;
		margin: 0 auto;
		padding-top: 20px;
	}
</style>

<title>Insert title here</title>
</head>
<body>
	<%
		//관리자 로그인 페이지 입니다
		
		//관리자 로그인 정보를 확인
		boolean memberLogin = false;
		if(session.getAttribute("memberLogin") != null){
			memberLogin = (boolean)session.getAttribute("memberLogin");
		}
		//로그인이 되어있다면 메뉴출력
		if(memberLogin){
	%>
		<div>
			<h1>회원 페이지</h1>
		</div>
		
		<div>
			<%=session.getAttribute("memberId") %>님환영합니다.
		</div>
		
		<div>
			<ul>
				<li><a href="<%=request.getContextPath() %>/admin/member/memberList.jsp">회원정보 조회</a></li>
				
				<li><a href="<%=request.getContextPath() %>/admin/member/adminLogout.jsp">로그아웃</a></li>
			</ul>
		</div>
	
	<%
		//로그인 정보가 없으면 로그인 페이지로 이동
		}else{
			response.sendRedirect(request.getContextPath()+"/member/memberlogin.jsp");
		}
	%>
</body>
</html> <!-- 박학철님 폼 참고 -->