<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td {
		border:1px solid #000000;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			if($('#i_name').val()==""){
				alert("이름을 입력해주세요.");
				$('#i_name').focus();				
			}else if($('#i_price').val()==""){
				alert("비밀번호를 입력해주세요.");
				$('#i_price').focus();	
			}else if($('#i_rate').val()==""||!(isNaN($('#i_rate').val()))){
				alert("할인률을 입력해주세요.");
				$('#i_rate').focus();	
			}else{
				$('#itemAddForm').submit();
			}
		});
	});
</script>
</head>
<body>
<form id="itemName" name="itemName" action="./itemAddAction.jsp" method="post">
<h1>Member Add</h1>
<table>	
	<tr>
		<td>Itemname :</td>
		<td><input type ="text" id="i_name" name="i_name"></td>
	</tr>
	<tr>
		<td>Itemprice : </td>
		<td><input type ="text" id="i_price" name="i_price"></td>
	</tr>
	<tr>
		<td>Itemrate : </td>
		<td><input type ="text" id="i_rate" name="i_rate"></td>
	</tr>
	<tr>
		<td colspan="2"><input type ="button" id="addBtn" value="itemAdd"></td>
	</tr>
</table>
</form>
</body>
</html>