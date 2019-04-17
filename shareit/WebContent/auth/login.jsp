<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
	
	<div class="container">
		<div class="blog">
		
		<div class="blog-content">
					
					<div class="blog-content-left login-right">
						<h1>Đăng nhập</h1>
						<%
					 		if (request.getParameter("msg") != null) {
					 			String msg = request.getParameter("msg");
					 			if ("loginFail".equals(msg)){
					 				out.print("<p style='color:red; font-weight:bold'>Đăng nhập thất bại, vui lòng đăng nhập lại!</p>");
					 			} 	
					 		}
				 		%>	
						<form action="<%=request.getContextPath() %>/auth/login" method="post">
							<div>
								<span>Username<label>*</label></span>
								<input type="text" name="username"> 
							</div>
							<div>
								<span>Password<label>*</label></span>
								<input type="password" name="password"> 
							</div>
							<input type="submit" value="Đăng nhập">
						</form>
						
					</div>
					
					<%@include file="/templates/public/inc/right_bar_top.jsp" %>
					<div class="clearfix"> </div>
				
				</div>
		</div>
<%@include file="/templates/public/inc/footer.jsp" %>		
		