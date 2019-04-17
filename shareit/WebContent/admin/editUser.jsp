<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script>
$(document).ready(function (){
	$('#editUser').validate({
		rules:{
			username:{
				required : true,
				minlength: 5,
				maxlength: 30,
			},
			
			fullname:{
				required : true,
				minlength: 5,
				maxlength: 30,
			},
			password:{
				required : true,
				minlength: 5,
				maxlength: 30,
			},
			confirm_password:{
				equalTo:"#password"
			},
			email:{
				required : true,
				email:true
			},
			confirm_email:{
				equalTo : "#email"
			},
			
		},
		messages:{
			username:{
				required : "<p>Vui lòng nhập username</p>",
				minlength: "<p>Vui lòng nhập hơn 5 ký tự</p>",
				maxlength: "<p>Vui lòng nhập không quá 30 ký tự</p>",
			},
			
			fullname:{
				required : "<p>Vui lòng nhập fullname</p>",
				minlength: "<p>Vui lòng nhập hơn 5 ký tự</p>",
				maxlength: "<p>Vui lòng nhập không quá 30 ký tự</p>",
			},
			password:{
				required : "<p>Vui lòng nhập mật khẩu</p>",
				minlength: "<p>Vui lòng nhập hơn 5 ký tự</p>",
				maxlength: "<p>Vui lòng nhập không quá 30 ký tự</p>",
			},
			confirm_password:{
				equalTo: "<p>Mật khẩu xác nhận không đúng.Vui lòng nhập lại</p>"
			},
			email:{
				required : "<p>Vui lòng nhập email</p>",
				email: "<p>Vui lòng nhập đúng định dạng email.</p> "
			},
			confirm_email:{
				equalTo : "<p>Email xác nhận không đúng.Vui lòng nhập lại</p>"
			},		
		},	
	});	
});

</script>	
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Thêm quản trị viên</h4>
                            </div>
                            <div class="content">
                            <%
						 		if (request.getAttribute("objUser") != null ){
						 			User objUser = (User) request.getAttribute("objUser");
						 	%>
                                <form id="editUser" action="<%=request.getContextPath() %>/admin/user/edit?uid=<%=objUser.getId() %>" method="post">
                                    <div class="row"> 
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input type="text" name="username" class="form-control border-input" placeholder="Username" disabled value="<%=objUser.getUsername() %>">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Fullname</label>
                                                <input type="text" name="fullname" value="<%=objUser.getFullname() %>" class="form-control border-input" placeholder="Họ và tên">
                                            </div>
                                        </div>
                                       	<%
                                       		User userinfo = (User) session.getAttribute("sobjUser");
                                       	%>
                                        <div class="col-md-4">
                                            <label>Cấp bậc</label>
                                            <%
                                            	if ("admin".equals(userinfo.getLevel())){
                                            		String disabled = "";
                                            		if (userinfo.getId() == objUser.getId()){
                                            			disabled = "disabled";
                                            		}
                                            %>
                                            <select name="level" class="form-control border-input" <%=disabled %>>
                                            	<option <% if ("admin".equals(objUser.getLevel())) { out.print("selected = 'selected'");}%> value="admin">Admin</option>                                           	
                                            	<option <% if ("mod".equals(objUser.getLevel())) { out.print("selected = 'selected'");}%> value="mod">Mod</option>
                                            	<option <% if ("editor".equals(objUser.getLevel())) { out.print("selected = 'selected'");}%> value="editor">Editor</option>                                            	
                                            </select>
                                            <%} else if ("mod".equals(userinfo.getLevel())){ %>
                                            <select name="level" class="form-control border-input">                                                                   	
                                            	<option <% if ("mod".equals(objUser.getLevel())) { out.print("selected = 'selected'");}%>value="mod">Mod</option>
                                            	<option <% if ("editor".equals(objUser.getLevel())) { out.print("selected = 'selected'");}%> value="editor">Editor</option>                                            	
                                            </select>
                                            <%} else if ("editor".equals(userinfo.getLevel())){ %>
                                            <select name="level" class="form-control border-input" disabled>                                                                   	  
                                            	<option value="editor">Editor</option>                                            	
                                            </select>
                                            <%} %>
                                        </div>                                   
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mật khẩu</label>
                                                <input type="password" name="password" class="form-control border-input" placeholder="********" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nhập lại mật khẩu</label>
                                                <input type="password" name="confirm_password" class="form-control border-input" placeholder="********" value="">
                                            </div>
                                        </div>
                                    </div>                                   
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" name="email" class="form-control border-input" placeholder="abc@gmail.com" value="<%=objUser.getEmail() %>">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nhập lại email</label>
                                                <input type="text" name="confirm_email" class="form-control border-input" placeholder="abc@gmail.com" value="<%=objUser.getEmail() %>" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-info btn-fill btn-wd" value="Thực hiện" />
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@include file="/templates/admin/inc/footer.jsp" %>