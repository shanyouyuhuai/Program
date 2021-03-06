<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width,initial-scale=1">

<!--移动设备优先 -->

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<!--导入核心css文件 -->

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript"src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>添加图书</title>
<script type="text/javascript" src="js/ajax.js"></script>

 <script type="text/javascript" src="js/jquery.js"></script>
 
  <script type="text/javascript">
		var flag;

		function validateBName() {

			var bname = document.add.bname;

			var nameReg = /^[\u0391-\uFFE5_A-z0-9]{1,15}$/;

			var bNameMsg = document.getElementById("bNameMsg");

			ajax({
				method : "POST",
				url : "BookServlet",
				params : "action=validateBName&bname=" + bname.value,
				type : "text",
				success : function(data) {
					if (nameReg.test(bname.value)) {

						//bnameMsg.style.color = "darkcyan";

						//bnameMsg.innerHTML = "姓名合法";		

						if (data == "1") {//图书名称已经存在

							bNameMsg.style.color = "red";

							bNameMsg.innerHTML = "此图书名称已经存在";

							bname.focus();

							flag = false;

						} else {//图书名称不存在

							bNameMsg.style.color = "darkcyan";

							bNameMsg.innerHTML = "此图书名称可以添加";

							flag = true;
						}
					} else {

						bNameMsg.style.color = "red";

						bNameMsg.innerHTML = "必须是长度为1-15的汉字字母数字下划线";

						bname.focus();

						flag = false;
					}

				}
			})
		}

		function validatePrice() {

			var price = document.add.price;

			var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;

			var priceMsg = document.getElementById("priceMsg");

			if (reg.test(price.value)) {

				priceMsg.style.color = "darkcyan";

				priceMsg.innerHTML = "价格格式合法";

				return true;
			} else {

				priceMsg.style.color = "red";

				priceMsg.innerHTML = "价格格式不合法，正确格式为  52.11 或   52 或0.99";

				price.focus();

				return false;
			}

		};

		function addb() {

			//alert(flag);
			return (flag) && validatePrice();
		};

		$(function() {

			$("tr:even").css("background-color", "transparent");

			$("tr:odd").css("background-color", "transparent");

			//事件
			$("tr").mouseover(function() {

				$(this).css("background-color", "LightYellow");
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
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="book" method="post"
					enctype="application/x-www-form-urlencoded" name="add"
					onsubmit="return addb()">
					<br>
					<h1 class="text-center text-danger">
						<font face="幼圆">添加图书</font>
					</h1>
					<hr>
					<ul class="nav">
						<li><b>请选择您想要添加的分类:</b></li>
						<li><select name="fId" class="form-control">
								<c:forEach items="${flist }" var="f">
									<option value="${f.fId }">${f.fname }</option>
								</c:forEach>
						</select>
					</ul>
					<br>
                      <div class="form-group">
						<label>分&nbsp;类&nbsp;名&nbsp;称:</label> <input type="text"
							name="fname" class="form-control"
							placeholder="分类名称" />
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="bname" onblur="validateBName()" class="form-control"
							placeholder="图书名称" /> <span id="bNameMsg"></span>
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" onblur="validatePrice()" class="form-control"
							placeholder="图书价格" /> <span id="priceMsg"></span>
					</div>
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chubanshe" class="form-control" placeholder="出版社" />
					</div>
					<div class="form-group">
						<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label> <label
							class="radio-inline"> <input type="radio"
							name="zhuangtai" value="未借出" checked />未借出
						</label> <label class="radio-inline"> <input type="radio"
							name="zhuangtai" value="借出" />借出
						</label>
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> <input
							type="text" name="jieshuren" checked value="无"
							class="form-control" />
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning"
									style="width: 200px;">添加</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger"
									style="width: 200px;">重填</button></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>