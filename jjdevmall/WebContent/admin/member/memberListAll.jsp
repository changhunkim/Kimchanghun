<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table,td {
		border:1px solid #000000;
	}
</style>
</head>
<body>
<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=UTF-8";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, dbUser, dbPw);

	String sql1 = "SELECT member_id, member_Pw, member_name, member_Sex, member_Age FROM member";
	
	PreparedStatement stmt1 = conn.prepareStatement(sql1);
	
	ResultSet rs1 = stmt1.executeQuery();


%>	
	<table>
		<tr>
			<td>Id</td>
			<td>Password</td>
			<td>Name</td>
			<td>Sex</td>
			<td>Age</td>
		</tr>	

</body>
</html>