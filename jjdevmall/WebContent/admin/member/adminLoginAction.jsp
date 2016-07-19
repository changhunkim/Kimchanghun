<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String admId = request.getParameter("admId");//()의 글자와 똑같은 글자에 담긴 값을 받아온다. 
	String admPw = request.getParameter("admPw");
	
	//out.println(admId+"admId"); 
	//out.println(admId+"admPw"); 
	//잘넘어 왔고 db 연결 하자.
	

	Connection conection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	String sql = null;
	
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=UTF-8";
	String dbUser = "root";
	String dbPass = "java0000";
	
	
//jdbc	
	try{
		Class.forName(driver);
		
		conection = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		
		conection.setAutoCommit(false);
		
		sql="select * from member where member_id=?";
		statement = conection.prepareStatement(sql);
 	 	statement.setString(1, admId);
		
 	 	if(resultSet.next()) {
			System.out.println("관리자 로그인 성공");
			// 세션에 아이디값 저장
			session.setAttribute("sessioAdminId", resultSet.getString(""));
		} else {
			System.out.println("관리자 로그인 실패");
		}
	} catch (Exception e) {
		
	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 adminIndex.jsp로 이동
	//response.sendRedirect("/admin/member/adminIndex.jsp");
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
</body>
</html>