<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>login</title>
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
				font-size:18px;
				}
		</style>
	</head>
	<body bgcolor="lightpink">
		<div class="div1">
			<div class="div2"><br/>在线答题系统</div>
			<div class="div3">	
			<form  action="log_do.jsp" method=post name=form>
				<br/>
				用户：<input type="text" name="username" style="width:200px;height:30px;background-color:white;"/>
				<br/><br/>
				密码：<input type="password" name="password" style="width:200px;height:30px;background-color:white;"/>
				<br/><br/>
				<input type="reset" value="重置" style="width:100px;height:40px;"/>
				<input type="submit" value="登录" style="width:100px;height:40px;"/>
			</form>
			</div>
		</div>		
	</body>
</html>