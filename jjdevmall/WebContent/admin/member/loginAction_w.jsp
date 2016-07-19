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
	request.setCharacterEncoding("UTF-8");
	String loginId = request.getParameter("loginId");
	String loginPw = request.getParameter("loginPw");
	
/* 	System.out.println("loginId : " + loginId);
	System.out.println("loginPw : " + loginPw); */

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
	String dbUser = "root";
	String dbPass = "java0000";

//jdbc	
	
	try{
		Class.forName(driver);
 	 	
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
 	 	
 	 	conn.setAutoCommit(false);
 	 	
	 	sql="select * from member where member_id=?";// 왜나면 db에 있는 것과 비교해야 하니깐. select쿼리
 	 	pstmt = conn.prepareStatement(sql);//셀렉트 쿼리문 pstmt에 담아주고 준비시킨다.
 	 	
 	 	pstmt.setString(1, loginId); //pstmt안의 쿼리 에 있는 ?에 값을 넣어준다.
 	 	
 	 	rs = pstmt.executeQuery();//쿼리를 실행하고 그 값을 rs에 넣어준다.
 	 	String dbId = null;
 	 	String dbPw = null;
 	 	
 	 	
		if(rs.next()) {
			System.out.println("아이디 일치");
			dbId = rs.getString("member_id");
			dbPw = rs.getString("member_pw");
			if(loginPw.equals(dbPw)){//입력한 pw와 dbpw값을 비교 해서 일치 하는지,불일치하는지.
				System.out.println("로그인 성공");
				// 로그인 성공시(id pw모두가 db와 같을 때) 세션에 아이디,비번값 저장
				session.setAttribute("sessionMemberId", dbId);
				session.setAttribute("sessionMemberPw", dbPw);

			}else{
				System.out.println("비밀번호 불일치");
			}
		} else {
			System.out.println("아이디 불일치");
		}		
	} catch (Exception e) {

	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 index.jsp로 이동
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
</body>
</html>