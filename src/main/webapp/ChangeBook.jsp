<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改图书</title>
</head>
<body  background="image/14.jpg">

<div class="container">
		<h3 align="center">修改图书信息</h3>
		<hr width="1000px">

		<form action="book" class="form-horizontal" method="post">

			<input type="hidden" name="_method" value="PUT"> <input
				type="hidden" name="id" value="${book.id } }" />
				
				<ul class="nav">
				<li><b>请选择您想要修改的分类:</b></li>
				<li>
				<select name="fId" class="form-control">
				
				<c:forEach items="${flist }" var="f">
				  <c:if test="${f.id ==book.fenlei.id }">
				  
				  <option value="${f.id }" selected="selected">${f.name }</option>
				  </c:if>
				  <c:if test="${f.id!=book.fenlei.id }">
				  
				  <option value="${f.id }">${f.name }</option>
				  </c:if>
				</c:forEach>
				</select>
				</li>
				</ul>
			<div class="form-group">
				<label for="monstername" class="col-sm-4 control-label">图书名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" 
						name="banem" value="${book.bname }">
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="col-sm-4 control-label">图书价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control"name="price"
						value="${book.price }">
				</div>
			</div>

			<div class="form-group">
				<label for="birthday" class="col-sm-4 control-label">出版社</label>
				<div class="col-sm-4">
					<input type=text" class="form-control"
						name="chubanshe" value="${book.chubanshe }" /></div>
			</div>

			<div class="form-group">
				<label for="entryday" class="col-sm-4 control-label">状态</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" 
						name="zhuangtai" value="${book.zhuangtai }" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="entryday" class="col-sm-4 control-label">借书人</label>
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