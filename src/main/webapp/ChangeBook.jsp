<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width,initial-scale=1">
<!--移动设备优先 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<!--导入核心css文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript"src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<title>修改图书</title>

</head>
<body  background="image/1.jpg">

<div class="container">
		<h3 align="center">修改图书信息</h3>
		<hr width="1000px">

		<form action="book" method="post" enctype="application/x-www-form-urlencoded">

			<input type="hidden" name="_method" value="PUT"> 
			<input type="hidden" name="bid" value="${book.bid }" />
				
			<li>
			 <label>请选择分类:</label>
				
				<select name="fId" class="form-control" >
				
				<c:forEach items="${fList }" var="f">
				
				  <c:if test="${f.fId == book.fId }">
				  
				  <option value="${f.fId }" selected="selected">${f.fname }</option>
				  </c:if>
				  <c:if test="${f.fId != book.fId }">
				  
				  <option value="${f.fId }">${f.fname }</option>
				  </c:if>
				</c:forEach>
				</select>
				</li>
				
				
				<div class="form-group">
				<label >分类名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" 
						name="fname" value="${book.fname }">
				</div>
			</div>
			<div class="form-group">
				<label >图书名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" 
						name="bname" value="${book.bname }">
				</div>
			</div>

			<div class="form-group">
				<label >图书价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control"name="price"
						value="${book.price }">
				</div>
			</div>

			<div class="form-group">
				<label >出版社</label>
				<div class="col-sm-4">
					<input type="text" class="form-control"
						name="chubanshe" value="${book.chubanshe }" /></div>
			</div>

			<div class="form-group">
				<label >状态</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" 
						name="zhuangtai" value="${book.zhuangtai }" />
				</div>
			</div>
			
			<div class="form-group">
				<label >借书人</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" 
						name="jieshuren" value="${book.jieshuren }" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">修改信息</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>