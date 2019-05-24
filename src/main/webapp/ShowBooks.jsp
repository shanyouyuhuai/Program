<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看图书</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--移动设备优先 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="icont/iconfont.css">
<!--导入核心css文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<!-- <script type="text/javascript">
	window.onload = function() {

		var selectAll = document.getElementById("selectAll");

		selectAll.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = true;
			}
		};

		var unselectAll = document.getElementById("unselectAll");

		unselectAll.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = false;
			}

		};

		var fanxuan = document.getElementById("fanxuan");

		fanxuan.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					check[i].checked = false;

				} else {

					check[i].checked = true;
				}

			}

		};

		var deleteStudent = document.getElementById("deleteStudent");

		deleteStudent.onclick = function() {

			var check = document.getElementsByName("ids");

			//判断一下,他选了没有
			var flag = false;

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					flag = true;

					break;

				}
			}

			if (flag == false) {

				alert("请至少勾选一项进行删除！");

				location.href = "BookServlet?action=showBook";

				return;
			}

			//如果选择了

			var str = "";

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					str = str + check[i].value + ",";

				}
			}

			//去除最后一个逗号
			str = str.slice(0, str.length - 1);

			//发送给服务器
			var queren = confirm("您确定要删除这些图书吗？");

			if (queren == true) {

				location.href = "BookServlet?action=delete&ids=" + str;

			} else {

				location.reload();
			}
		};

		ajax({

			method : "POST",

			url : "FenLeiServlet",

			params : "action=updateShowClassfies",

			type : "xml",

			success : function(data) {

				var select = document.getElementById("fenleiList");

				alert(typeof data);

				var names = data.getElementsByTagName("name");

				for (var i = 0; i < names.length; i++) {

					var name = names[i];

					var opt = document.createElement("option");

					var value;

					if (window.addEventListener) {

						value = name.textContent;
					} else {

						value = text;
					}

					opt.innerHTML = value;

					opt.value = value;

					select.appendChild(opt);

				}
			}

		});

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
</script> -->
</head>
<body background="image/12.jpg">

	<!-- <div class="container-fluid" id="div1">
		<div class="col col-md-5" id="div2">

			<ul class="nav nav-tabs">

				<li class="active"><a href="#" id="selectAll">全选</a></li>

				<li><a href="#" id="unselectAll">全不选</a></li>
				<li><a href="#" id="fanxuan">反选</a></li>
				<li><a href="#" id="deleteStudent">删除</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">高级搜索<span class="caret"></span></a>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<li>

							<form action="BookServlet" class="form-horizontal" id="f1">

								<input type="hidden" name="action" value="findbookbywhere">

								<div class="control-group">

									<br> <label class="col-sm-4 control-label">
										选择您想查看的分类: </label>
									<div class="controls col-sm-6">

										<select name="findfname" id="fenleiList"
											class="form-control input-sm">

											<option>----请选择-----</option>

										</select>


									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">图书名:</label>
									<div class="controls col-sm-6 ">
										<input name="bname" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">价格:</label>
									<div class="controls col-sm-6 ">
										<input name="bprice" type="text"
											class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">出版社:</label>
									<div class="controls col-sm-6 ">
										<input name="bpublish" type="text"
											class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">状态:</label>
									<div class="controls col-sm-6 ">
										<input name="status" type="text"
											class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">借书人:</label>
									<div class="controls col-sm-6 ">
										<input name="borrower" type="text"
											class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group  ">

									<div class="controls ss">
										<button type="submit" class="btn   btn-info ">
											<span class="glyphicon glyphicon-search"></span> 开始搜索
										</button>
										<br> <br>
									</div>
								</div>

							</form>
						</li>
					</ul>
		</div>
	</div> -->

	<table align="center" width="200px" height="20px" frame="void">
		<caption align="top">
			<h1>
				<font color="red">查看图书</font>
			</h1>

			<hr>

		</caption>
		
	</table>
	<table align="center" width="600px" height="200px" border="1px"
		cellspacing="0" bordercolor="silver">
		<tr align="center">
			<!-- <td>选择</td> -->
			<td>图书编号</td>
			<td>分类名称</td>
			<td>图书名称</td>
			<td>图书价格</td>
			<td>图书出版社</td>
			<td>状态</td>
			<td>借书人</td>
			<td>修改</td>
		</tr>
		<c:forEach items="${mlist }" var="q" varStatus="s">
			<tr align="center">
				<%-- <td><input type="checkbox" name="ids" value="${q.bid }" /></td> --%>
				<td>${s.index+1 }</td>
				<td>${q.fname }</td>
				<td>${q.bname }</td>
				<td>${q.price }</td>
				<td>${q.chubanshe}</td>
				<td>${q.zhuangtai }</td>
				<td>${q.jieshuren }</td>
				<td><a href="BookServlet?action=showone&bid=${q.bid }"><input
						type="submit" value="修改" /></a></td>
			</tr>
		</c:forEach>
	</table>
	<p>
	<center>
		<ul class="pagination">
			第${pb.pageNow }页/共${pb.pages }页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<li><a href="BookServlet?action=showBookByPage&pageNow=1">首页</a></li>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${pb.pageNow>1 }">
				<li><a
					href="BookServlet?action=ShowBookpage
		&pageNow=${pb.pageNow-1 }">上一页</a></li>
			</c:if>
			<!-- 分两种情况		 
		   1.如果页数小于10
		   2.如果页数大于10 
		-->
			<c:choose>
				<c:when test="${pb.pages<=10 }">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="${pb.pages }"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
					<c:set var="end" value="${pb.pageNow+4 }"></c:set>
					<c:if test="${begin<=1 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="10"></c:set>
					</c:if>
					<c:if test="${end>=pb.pages }">
						<c:set var="begin" value="${pb.pageNow-9 }"></c:set>
						<c:set var="end" value="${pb.pages }"></c:set>
					</c:if>
				</c:otherwise>
			</c:choose>
			<!-- 循环十个数 -->
			<c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${pb.pageNow==i }">
						<li class="active"><span>${i }</span></li>
					</c:when>
					<c:otherwise>
						<li><a href="BookServlet?action=ShowBookpage&pageNow=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<li><a
					href="BookServlet?action=ShowBookpage&pageNow=${pb.pageNow+1 }">下一页</a></li>
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<li><a
				href="BookServlet?action=ShowBookpage&pageNow=${pb.pages }">尾页</a></li>
		</ul>
	</center>
	<p>
	<table align="center">
		<tr align="center">
			<td>没有您需要的图书？您可以点击这里<a href="AddBooks.jsp">添加图书</a></td>
		</tr>
	</table>
</body>
</html>