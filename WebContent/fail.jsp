<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录失败</title>
		<style type="text/css">
			div{
				margin:0 auto;
				text-align:center;
				background-color:#FFFFF4;
				}
			.div1{
				width:500px;
				height:300px;
				border-color:black;
				border-style:solid;
				broder-width:2px;
				margin-top:100px;
				}	
			.div2{
				width:500px;
				height:80px;
				border-bottom-color:black;
				border-bottom-style:solid;
				border-bottomwidth:2px;
				line-height:30px;
				}
			.div3{
				font-size:22px;
				font-face:"楷体";
				}
		</style>
	</head>
	<body bgcolor="lightpink">
		<div class="div1">
			<div class="div2"><h3><font face="楷体">登录失败</font></h3></div>
			<div class="div3"></div>
				<form  action="login.jsp" method=post name=form>
					<br>
					<h4><font face="楷体">用户名或密码错误！！</font></h4>
					<input type="submit" value="返回" style="width:100px;height:40px;">
				</form>
		</div>		
	</body>
</html>