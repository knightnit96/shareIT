<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main-panel">
	<nav class="navbar navbar-default">
           <div class="container-fluid">
               <div class="navbar-header">
                   <button type="button" class="navbar-toggle">
                       <span class="sr-only">Toggle navigation</span>
                       <span class="icon-bar bar1"></span>
                       <span class="icon-bar bar2"></span>
                       <span class="icon-bar bar3"></span>
                   </button>
                   <a class="navbar-brand" href="<%=request.getContextPath() %>/admin">Trang quản lý</a>
               </div>
               <div class="collapse navbar-collapse">
                 	<%
                  		if (session.getAttribute("sobjUser") != null){
                  			User sobjUser = (User)session.getAttribute("sobjUser");
                  	%>
                   <ul class="nav navbar-nav navbar-right">
                   		<li>
                          	<a href="<%=request.getContextPath() %>/admin/user/edit?uid=<%=sobjUser.getId() %>">
							<i class="ti-user"></i>
							<p><%=sobjUser.getFullname() %></p>
                           </a>
                       </li>
						<li>
                           	<a href="<%=request.getContextPath() %>/auth/logout">
							<i class="fa fa-power-off"></i>
							<p>Logout</p>
                           </a>
                       </li>
                   </ul>
                   <%} %>
               </div>
           </div>
       </nav>