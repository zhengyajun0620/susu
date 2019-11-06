<%@ page language="java" import="java.util.*,bean.*,java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>全部试题</title>
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
	<body bgcolor="lightyellow">
		<form action="result.jsp" method=post name=form>
			<br/><h2 align="center"><font face="楷体">全部试题</font></h2>
			
			<ol>
				<% request.setCharacterEncoding("UTF-8"); %>
				<jsp:useBean id="question" class="bean.Question" scope="session"/>
				<% 
					List<Question> new_questionView = question.QList(); 
					
				for(int i=0;i<new_questionView.size();i++){
					if(new_questionView.get(i).type.toString().equals("单选题")){
						out.print("<li>");
						out.print(new_questionView.get(i).title.toString()+"("+new_questionView.get(i).type.toString()+")");
						out.print("<br>");
						out.print("<INPUT type="+"'radio'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'A'"+">");
						out.print("A、"+new_questionView.get(i).optionA.toString()+"<br>");
						out.print("<INPUT type="+"'radio'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'B'"+">");
						out.print("B、"+new_questionView.get(i).optionB.toString()+"<br>");
						out.print("<INPUT type="+"'radio'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'C'"+">");
						out.print("C、"+new_questionView.get(i).optionC.toString()+"<br>");
						out.print("<INPUT type="+"'radio'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'D'"+">");
						out.print("D、"+new_questionView.get(i).optionD.toString()+"<br>");
						out.print("</li><br>");
					}
					else if(new_questionView.get(i).type.toString().equals("判断题")){
						out.print("<li>");
						out.print(new_questionView.get(i).title.toString()+"("+new_questionView.get(i).type.toString()+")");
						out.print("<br>");
						out.print("<INPUT type="+"'radio'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'A'"+">");
						out.print("A、"+new_questionView.get(i).optionA.toString()+"<br>");
						out.print("<INPUT type="+"'radio'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'B'"+">");
						out.print("B、"+new_questionView.get(i).optionB.toString()+"<br>");
						out.print("</li><br>");
					}
					else if(new_questionView.get(i).type.toString().equals("多选题")){
						out.print("<li>");
						out.print(new_questionView.get(i).title.toString()+"("+new_questionView.get(i).type.toString()+")");
						out.print("<br>");
						out.print("<INPUT type="+"'checkbox'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'A'"+">");
						out.print("A、"+new_questionView.get(i).optionA.toString()+"<br>");
						out.print("<INPUT type="+"'checkbox'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'B'"+">");
						out.print("B、"+new_questionView.get(i).optionB.toString()+"<br>");
						out.print("<INPUT type="+"'checkbox'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'C'"+">");
						out.print("C、"+new_questionView.get(i).optionC.toString()+"<br>");
						out.print("<INPUT type="+"'checkbox'"+"name='"+new_questionView.get(i).id.toString()+"' value="+"'D'"+">");
						out.print("D、"+new_questionView.get(i).optionD.toString()+"<br>");
						out.print("</li><br>");
					}
					else{
						out.print("没有这类题型！");
						out.print("题型："+new_questionView.get(i).type.toString()+"<br>");
					}
					
					
				}
				%>
			
			</ol>
			<input type="submit" value="提交" style="width:100px;height:40px;"/>
		</form>
		
		<% 
			String Login = (String)session.getAttribute("Login");
			if(Login!=null&&Login.equals("OK")){
				System.out.println("singleView:session.getId()="+session.getId());
			}
			else{
				out.println("<script>alert('请先登录，谢谢！经过3秒之后，将会自动返回登录界面~');</script>");
				response.setHeader("Refresh","3;URL=login.jsp");
			}
		%>
	</body>
</html>