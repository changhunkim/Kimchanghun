<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String i_name = request.getParameter("i_name");
	int i_price = Integer.parseInt(request.getParameter("i_price"));
	String i_rate = ("i_rate");

 	System.out.print(i_name + i_price + i_rate );
 	
 //jdbc
 	 
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	
 	String driver = "com.mysql.jdbc.Driver";
 	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
 	String dbUser = "root";
 	String dbPw = "java0000";
 	
 //01
 	Class.forName(driver);
 //02	
 	conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
	conn.setAutoCommit(false);
 //03
 	String sql=
 	"INSERT INTO member (member_id, member_pw, member_name, member_sex, member_age) VALUES (?, ?, ?, ?, ?)";
 	pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
 	
 	pstmt.setString(1, m_id);
 	pstmt.setString(2, m_pw);
 	pstmt.setString(3, m_name);
 	pstmt.setString(4, m_gender);
 	pstmt.setInt(5, m_age);
 //04 
 	pstmt.executeUpdate();

%>
</body>
</html>
 
 	