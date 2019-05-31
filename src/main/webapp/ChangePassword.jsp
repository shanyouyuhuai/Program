<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--移动设备优先 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<!--导入核心css文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>
<title>修改密码</title>
<script type="text/javascript">
	
</script>
</head>
<body background="image/1.jpg">
	<div class="container">
		<h1 align="center">修改密码</h1>
		<hr width="1000px">
		<form action="changePassword" class="form-horizontal" method="post">
		
		
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">原密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="password" />
				</div>	
			</div>
			
			
			
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">新密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="newPassword"
						name="newPassword" />
				</div>	
			</div>
			
			
			
			<div class="form-group">
				<label for="rePassword" class="col-sm-4 control-label">确认密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="rePassword"
						name="rePassword" />
				</div>	
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-4">
					<button type="submit" class="btn btn-info">点击修改</button>
				</div>
			</div>
			
			
		</form>
	</div>
</body>
</html>