<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	var flag;

	function validateBName() {

		var bname = document.add.bname;

		var xmlhttp = getXMLHttpRequest();

		xmlhttp.open("POST", "BookServlet", true);

		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		xmlhttp.send("action=validateBName&bname=" + bname.value);

		var nameReg = /^[\u0391-\uFFE5_A-z0-9]{1,15}$/;

		var bNameMsg = document.getElementById("bNameMsg");

		if (nameReg.test(bname.value)) {

			//bnameMsg.style.color = "darkcyan";

			//bnameMsg.innerHTML = "姓名合法";		

			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var content = xmlhttp.responseText;

					var span = document.getElementById("bNameMsg");

					if (content == "1") {//图书名称已经存在

						span.style.color = "red";

						span.innerHTML = "此图书名称已经存在";

						span.focus();

						flag = false;

					} else {//图书名称不存在

						span.style.color = "darkcyan";

						span.innerHTML = "此图书名称可以添加";

						flag = true;

					}

				}

			}

		} else {

			bNameMsg.style.color = "red";

			bNameMsg.innerHTML = "必须是长度为1-15的汉字字母数字下划线";

			flag = false;
		}

	}

	//2.校验价格
	function validatePrice() {

		var price = document.add.price;

		var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;

		var priceMsg = document.getElementById("priceMsg");

		if (reg.test(price.value)) {

			priceMsg.style.color = "darkcyan";

			priceMsg.innerHTML = "价格格式合法";

			flag = true;
		} else {

			priceMsg.style.color = "red";

			priceMsg.innerHTML = "价格格式不合法，正确格式为  52.11 或   52 或0.99";

			flag = false;
		}

	}

	function addb() {

		//alert(flag);
		return (flag);
	}
</script>
</head>
<body background="./imgs/11.jpg">
	<form action="BookServlet?action=addbooks" method="post"
		enctype="application/x-www-form-urlencoded" name="add"
		onsubmit="return addb()">
		<table align="center" width="600px" height="100px" border="1px"
			cellspacing="0" bordercolor="silver" >
			<caption align="top">
				<h1>
					<font color="red">添加图书</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			<tr align="center">
				<td>请选择分类:</td>
				<td><select name="name">
						<c:forEach items="${updateList }" var="fenlei">
							<option>${fenlei.name }</option>
						</c:forEach>
				</select></td>
			</tr>
			
			<tr align="center">
				<td width="100px">图&nbsp;书&nbsp;分&nbsp;类:</td>
				<td width="200px"><input type="text" name="fname"
					onblur="validatefName()" /></td>
				<td width="300px"><span id="fNameMsg"></span></td>
			</tr>
			<tr align="center">
				<td width="100px">图&nbsp;书&nbsp;名&nbsp;称:</td>
				<td width="200px"><input type="text" name="bname"
					onblur="validateBName()" /></td>
				<td width="300px"><span id="bNameMsg"></span></td>
			</tr>
			<tr align="center">
				<td width="100px">图&nbsp;书&nbsp;价&nbsp;格:</td>
				<td width="200px"><input type="text" name="bprice"
					onblur="validatePrice()" /></td>
				<td width="300px"><span id="priceMsg"></span></td>
			</tr>
			<tr align="center">
				<td width="100px">出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</td>
				<td width="200px"><input type="text" name="bpublish" /></td>
			</tr>
			<tr align="center">
				<td width="100px">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</td>
				<td width="200px"><input type="radio" name="status" checked
					value="未借出" />未借出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="radio" name="status" value="借出" />借出</td>
			</tr>
			<tr align="center">
				<td width="100px">借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</td>
				<td width="200px"><input type="text" name="borrower" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重填" /></td>
			</tr>
		</table>
	</form>
</body>
</html>