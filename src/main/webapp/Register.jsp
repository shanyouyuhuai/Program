<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>注册</title>
<script type="text/javascript">
	$(function() {
		$(".form-horizontal")
				.bootstrapValidator(
						{
							feedbackIcons : {
								valid : "glyphicon glyphicon-ok",
								invalid : "glyphicon glyphicon-remove",
								validating : "glyphicon glyphicon-refresh"
							},
							fields : {
								name : {
									validators : {
										notEmpty : {
											message : '姓名值不能为空！'
										},
										regexp : {
											regexp : /^[\u0391-\uFFE5]{2,10}$/,
											message : '姓名必须是2-10位汉字'
										}
									}
								},


								username : {
									validators : {
										notEmpty : {
											message : '用户名不能为空'
										},
										remote : {
											url : "validate.action",
											message : '该用户名已存在',
											delay : 500,
											type : 'GET',


											data : function(validator) {
												return {
													username : $("input[name=username]").val()


												}
											}
										}


									}
								},
								password : {
									validators : {
										notEmpty : {
											message : '密码不能为空'
										},
										regexp : {
											regexp : /^(\w|\w){6,15}$/,
											message : '必须是6-15位数字字母下划线或者特殊字符'
										}
									}
								},
								repassword : {
									validators : {
										notEmpty : {
											message : '确认密码不能为空'
										},
										identical : {
											field : 'password',
											message : '两次密码不一致'
										}
									}
								},
								phone : {
									validators : {
										notEmpty : {
											message : '手机号不能为空'
										},
										regexp : {
											regexp : /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/,
											message : '手机号不合法'
										}
									}
								},
								touxiang : {
									validators : {
										notEmpty : {
											message : '头像不能为空'
										},


									}


								}
							}
						});
	});
</script>
</head>
<body background="image/bg2.jpg">

	<div class = "container">
		<h1 align = "center">图书管理系统----管理员注册</h1>
		<hr width="1000px">
		<form name="register" action="register" class="form-horizontal" method="post" 
			enctype="multipart/form-data">
		
			<!-- 头像 -->
			<div class="form-group">
				<label for="touxiang" class="col-sm-4 control-label">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="touxaing"
						name="touxiang" />
				</div>	
			</div>
		
			<!-- 姓名 -->
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name"
						name="name"/>
				</div>	
			</div>
			
			<!-- 手机 -->
			<div class="form-group">
				<label for="phone" class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="phone"
						name="phone"/>
				</div>	
			</div>
			
			
			<!-- 用户名 -->
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="username"
						name="username"/>
				</div>	
			</div>
			
			<!-- 密码 -->
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="password"/>
				</div>	
			</div>
			
			<!-- 确认密码 -->
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">确认密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="repassword">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-4">
					<button type="submit" class="btn btn-info">点击注册</button>
				</div>
			</div>
		
		</form>
		
		<div class="col-sm-offset-5 col-sm-4">
			<a href="Login.jsp">已经是管理员？直接登录</a>
		</div>
	
	</div>
		
</body>
</html>