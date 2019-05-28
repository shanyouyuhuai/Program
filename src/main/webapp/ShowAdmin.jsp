<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<title>查看管理员信息</title>

<script type="text/javascript">
	window.onload = function() {

		var opt = {

			method : "POST",
			url : "showAdmin",
			params : "action=ShowAdmin",
			type : "json",
			success : function(data) {

				var admin = data;

				var id = document.getElementById("id");

				id.innerHTML = admin.id;
				
				

				var name = document.getElementById("name");

				name.innerHTML = admin.name;
				
				
				var phone = document.getElementById("phone");

				phone.innerHTML = admin.phone;
				

				var account = document.getElementById("username");

				account.innerHTML = admin.username;
				

				var password = document.getElementById("password");

				password.value = admin.password;
				

				
			}
		};

		ajax(opt);

	};

	$(function() {

		$("tr:even").css("background-color", "transparent");

		$("tr:odd").css("background-color", "transparent");

		$("tr").mouseover(function() {

			$(this).css("background-color", "silver");

		});

		$("tr").mouseout(function() {

			$("tr:even").css("background-color", "transparent");

			$("tr:odd").css("background-color", "transparent");

		});
	});
</script>
</head>
<body background="image/1.jpg">
	
	<div class="container">
		<h1 align="center">查看管理员</h1>
		<br><br>
		
		<table class="table table-bordered table-hover table-striped">
			<tr align="center">
				<th>编号</th>
				<th id="id"></th>
			</tr>
			
			<tr align="center">
				<th>姓名</th>
				<th id="name"></th>
			</tr>
			
			<tr align="center">
				<th>手机</th>
				<th id="phone"></th>
			</tr>
			
			<tr align="center">
				<th>账号</th>
				<th id="username"></th>
			</tr>
			
			<tr align="center">
				<th>密码</th>
				<th><input type="password" id="password" disabled="disabled" /></th>
			</tr>
			
		</table>
	
	</div>
	
</body>
</html>