<%@ page language="java" import="java.util.*,bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录操作</title>
</head>
<body>
	<%  request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="user" class="bean.User" scope="session"/>
	
	<% 
		//hahahaha=<jsp:setProperty name="user" property="username" />=hahahaha
		String name = request.getParameter("username");
		String password = request.getParameter("password");
			User new_user = user.match(
			name,
			//user.getUsername(),
			password);
			//user.getPassword());
			System.out.println("new_user="+new_user);
	   request.setAttribute("user", new_user.getUsername());
	   if(new_user.getUsername()!=null){
		   session.setAttribute("Login","OK");
		   request.getRequestDispatcher("exam.jsp").forward(request, response);
	   }
	   else{
		   request.getRequestDispatcher("fail.jsp").forward(request, response);
	   } 
	%>
</body>
</html>