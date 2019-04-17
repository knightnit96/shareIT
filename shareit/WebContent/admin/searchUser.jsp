<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#sUser').validate({
			rules:{
				user:{
					required : true,
				},
			},
			messages:{
				user:{
					required : "<p>Vui lòng nhập dữ liệu</p>",
				},
			},		
		});	
	});
</script>		
    <div class="content">
       <div class="container-fluid">
           <div class="row">
               <div class="col-md-12">
                   <div class="card">
                       <div class="header">
                           <h4 class="title">Quản trị viên</h4>                 
                           <form id="sUser" action="<%=request.getContextPath() %>/admin/user/search" method="get">
                           	<div class="row">
                                   <div class="col-md-4">
                                       <div class="form-group">
                                           <input type="text" name="user" class="form-control border-input" placeholder="Tên đăng nhập" value="<%=request.getAttribute("user")%>">
                                       </div>
                                   </div>
                                   <div class="col-md-4">
                                   	<div class="form-group">
                                     <input type="submit" name="search" value="Tìm kiếm" class="is" />
                                    </div>
                                   </div>
                               </div>                               
                           </form>
                            <% User userinfo = (User) session.getAttribute("sobjUser"); 
                          		if ("admin".equals(userinfo.getLevel())){
                          	%> 
                           <a href="<%=request.getContextPath() %>/admin/user/add" class="addtop"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/add.png" alt="" /> Thêm</a>
                      		<%} %>
                       </div>
                       <div class="content table-responsive table-full-width">
                           <table class="table table-striped">
                               <thead>           
	                               	<th>Tên đăng nhập</th>
	                               	<th>Fullname</th>
	                               	<th>Email</th>
	                               	<th>Cấp bậc</th>
	                               	<th>Chức năng</th>
                               </thead>
                               <tbody>
                               		<%	            						
	            						if (request.getAttribute("alUser") != null) { 
	            							ArrayList<User> alUser = (ArrayList<User>) request.getAttribute("alUser");
	            							for (User objUser : alUser){
	            								if (request.getAttribute("user").equals(objUser.getUsername())){
                               		%>
                                   <tr>                          
                                   		<td><a href="<%=request.getContextPath() %>/admin/user/edit?uid=<%=objUser.getId() %>"><%=objUser.getUsername() %></a></td>
                                   		<td><%=objUser.getFullname() %></td>
                                   		<td><%=objUser.getEmail() %></td>
                                   		<td><%=objUser.getLevel() %></td>
                                   		
                                   		<%
                                   			if ("admin".equals(userinfo.getLevel())){
                                   		%>
                                   		<td>
                                   			<a href="<%=request.getContextPath() %>/admin/user/edit?uid=<%=objUser.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="Sửa" /> SỬA</a> 
                                   			<%
												if(!"admin".equals(objUser.getLevel())) {
											%>
                                   			&nbsp;||&nbsp; 
                                   			<a href="<%=request.getContextPath() %>/admin/user/del?uid=<%=objUser.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/del.gif" alt="Xóa" /> XÓA</a>
                                   		</td>
                                   		<%}} else if ("mod".equals(userinfo.getLevel())){ 
                                   				if ("mod".equals(objUser.getLevel())||"editor".equals(objUser.getLevel())) {
                                   		%>
                                   		<td>
                                   			<a href="<%=request.getContextPath() %>/admin/user/edit?uid=<%=objUser.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="Sửa" /> SỬA</a>
                                   		</td>
                                   		<%} else { %>
                                   		<td>Không có quyền</td>	
                                   		<%}} else if ("editor".equals(userinfo.getLevel())){ 
                                   			if (userinfo.getId() == objUser.getId()){
                                   		%>
                                   		<td>
                                   			<a href="<%=request.getContextPath() %>/admin/user/edit?uid=<%=objUser.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="Sửa" /> SỬA</a>
                                   		</td>
                                   		<%} else {%>
                                   			<td></td>
                                   		<%} %>
                                  	<%}}} //end for %>
				 					<%} //end if %> 
                                   </tr>                                 	
                               </tbody>
                           </table>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
<%@include file="/templates/admin/inc/footer.jsp" %>