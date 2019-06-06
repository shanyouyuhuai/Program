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

<script type="text/javascript">
$(function(){
$(".deleteId").click(function(){
	
	var $url =this.href;
	
	$("#deleteForm").attr("action",$url);
	
	$("#deleteForm").submit();
	
	return false;
   });
});
</script>

<script type="text/javascript">
 
$(function(){

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
	 
	//导出所有用户信息
	$(".OutAll").click(function(){
		
		var flag = confirm("您确定要导出所有用户信息吗？");

		if (flag) {//真的话执行

			window.location.href = "http://localhost/manager/outAll";
		}
	});

	//导出所选的用户信息
	$(".OutSelect").click(function(){

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

			alert("请至少勾选一项进行导出！");

			location.href = "books";

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
		var queren = confirm("您确定要导出所勾选的用户吗？");

		if (queren == true) {

			location.href = "http://localhost/manager/outSelect?ids="+ str;

		} else {

			location.reload();
		}
	});
	
	 $(".deleteId").click(function(){
		   
		   var $url=this.href;
		   
		   //alert($url);
		   
		   $("#deleteForm").attr("action",$url);
		   
		   //提交表单
		   $("#deleteForm").submit();
		   
		   return false;
	   });
 });
</script>
</head>
<body background="image/12.jpg">
	
	 <li class="dropdown">
	 <a class="dropdown-toggle" data-toggle="dropdown">高级搜索<span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-right" role="menu">
					<li>
						<form action="books" class="form-horizontal" id="f1">

							<!-- 隐藏域，用来传递action -->

							<input type="hidden" name="action" value="findBookByWhere">

							<div class="form-group">
								<br> <label class="col-sm-4 control-label">选择分类：
								</label>
								<div class="controls col-sm-6">
									<select name="book.fenlei.name" class="form-control  input-sm"
										id="fList">
										<option value="0">----请选择----</option>
										<c:forEach items="${updateList }" var="fenlei">
											<option>${fenlei.name}</option>
										</c:forEach>
									</select><br>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4  control-label">书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
								<div class="controls col-sm-6">
									<input name="bname" type="text" class="form-control" /><br>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label"> 出&nbsp;版&nbsp;社:</label>
								<div class="controls  col-sm-6">
									<input name="chubanshe" type="text" class="form-control" /><br>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">借&nbsp;书&nbsp;人:</label>
								<div class="controls  col-sm-6">
									<input name="jieshuren" type="text" class="form-control" /><br>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4"> 状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label>
								<div class="controls  col-sm-6">
									<input name="zhuangtai" type="text" class="form-control" /><br>
								</div>
							</div>

							<div class="control-group">

								<div class="controls ss">
									<button type="submit" class="btn btn-info ">
										<span class="glyphicon glyphicon-search"></span> 开始搜索
									</button>
									<br> <br>
								</div>
							</div>

						</form>
					</li>

				</ul></li>


	<table align="center" width="200px" height="20px" frame="void">
		<caption align="top">
			<h3 align="center">
				<font color="red">查看图书</font>
			</h3>
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
			<td>删除</td>
			<td>修改</td>
		</tr>
		<c:forEach items="${pb.beanList }" var="q" varStatus="s">
			<tr align="center">
				<td><input type="checkbox" name="ids" value="${q.bid }" /></td>
				<td>${s.index+1 }</td>
				<td>${q.fname }</td>
				<td>${q.bname }</td>
				<td>${q.price }</td>
				<td>${q.chubanshe}</td>
				<td>${q.zhuangtai }</td>
				<td>${q.jieshuren }</td>
				<td><a href="book/${q.bid }" class="deleteId"><input
						type="submit" value="删除" /></a></td>
				<td><a href="book/${q.bid }"><input type="submit"
						value="修改" /></a></td>
			</tr>
		</c:forEach>
	</table>
	<form action="" method="post" id="deleteForm">
		<input type="hidden" name="_method" value="DELETE">
	</form>
	<p>
	<center>
		<ul class="pagination">
			第${pb.pageNow }页/共${pb.pages }页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<li><a href="books?pageNow=1">首页</a></li>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${pb.pageNow>1 }">
				<li><a href="books?pageNow=${pb.pageNow-1 }">上一页</a></li>
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
						<li><a href="books?pageNow=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<li><a href="books?pageNow=${pb.pageNow+1 }">下一页</a></li>
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<li><a href="books?pageNow=${pb.pages }">尾页</a></li>
		</ul>
	</center>
	<p>
	<div class="col col-sm-10" align="center">

		<ul class="nav nav-tabs">
			<li class="active"><a href="AddBook.jsp">添加图书</a></li>
			<li><a id="selectAll">全选</a></li>
			<li><a id="unselectAll">全不选</a></li>
			<li><a id="fanxuan">反选</a></li>

			<li><a class="OutSelect">导出选中</a></li>
			<li><a class="OutAll">导出全部</a></li>
		</ul>
	</div>
</body>
</html>