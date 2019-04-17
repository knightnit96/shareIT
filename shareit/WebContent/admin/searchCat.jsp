<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#sCat').validate({
			rules:{
				cat:{
					required : true,
				},
			},
			messages:{
				cat:{
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
                           <h4 class="title">Danh mục</h4>
                           <form id="sCat" action="<%=request.getContextPath() %>/admin/danh-muc/search" method="get">
                           		<div class="row">
                                   <div class="col-md-4">
                                       <div class="form-group">
                                           <input type="text" name="cat" class="form-control border-input" placeholder="Tên danh mục" value="<%=request.getAttribute("cat")%>">
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
                          		if (!"editor".equals(userinfo.getLevel())){
                          %> 
                           <a href="<%=request.getContextPath() %>/admin/danh-muc/add" class="addtop"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/add.png" alt="" /> Thêm</a>
                     	<%} %>
                       </div>
                       <div class="content table-responsive table-full-width">
                           <table class="table table-striped">
                               <thead> 
                               		<th style="width: 90px">Check</th>   
	                               	<th style="width: 700px">Tên danh mục</th>
	                               	<th>Chức năng</th>
                               </thead>
                               <tbody>
                               		<%
	                               		if (request.getAttribute("alCat") != null) { 
	            							ArrayList<Cat> alCat = (ArrayList<Cat>) request.getAttribute("alCat");
	            							for (Cat objCat : alCat){
	            								if (request.getAttribute("cat").equals(objCat.getName())){
                               		%>
                                   <tr>
                                 	<td class="check-<%=objCat.getId()%>"><a href="javascript:void(0)" onclick="checkActive(<%=objCat.getId()%>, 0)"><i class="ti-layout-width-full"></i></a></td>
                                 	
                                 	<%
                                 		if (objCat.getParent_id() == 0) {
                                 	%>
                                   		<td><a href="<%=request.getContextPath() %>/admin/danh-muc/edit?cid=<%=objCat.getId() %>"><%=objCat.getName() %></a></td>
                                   		<%
                                   			if ("admin".equals(userinfo.getLevel())){
                                   		%>
                                   		<td>
                                   			<a href="<%=request.getContextPath() %>/admin/danh-muc/edit?cid=<%=objCat.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="" /> SỬA</a> &nbsp;||&nbsp;
                                   			<a href="<%=request.getContextPath() %>/admin/danh-muc/del?cid=<%=objCat.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/del.gif" alt="" /> XÓA</a>
                                   		</td>
                                   		<%} else if ("mod".equals(userinfo.getLevel())){ %>
                               			<td>
                               				<a href="<%=request.getContextPath() %>/admin/danh-muc/edit?cid=<%=objCat.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="" /> Sửa</a>
                               			</td>
                               			<%} else if ("editor".equals(userinfo.getLevel())){ %>
                               			<td>Không có quyền</td>
                               			<%} %>
                                   	<% 
                                 		} else {
                                 			String name="";
                                 			if (request.getAttribute("alCat1") != null) { 
    	            							ArrayList<Cat> alCat1 = (ArrayList<Cat>) request.getAttribute("alCat1");
                                 			for (Cat objCat1 : alCat1){
                                 				if (objCat1.getId() ==  objCat.getParent_id()) {
                                 					name = objCat1.getName();
                                 				}
                                 			}}
                                   	%>
                                   			<td><a href="<%=request.getContextPath() %>/admin/danh-muc/edit?cid=<%=objCat.getId() %>"><%=name %> |-- <%=objCat.getName() %></a></td>
                                   			<%
	                                   			if ("admin".equals(userinfo.getLevel())){
	                                   		%>
                                   			<td>
                                   				<a href="<%=request.getContextPath() %>/admin/danh-muc/edit?cid=<%=objCat.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="" /> Sửa</a> &nbsp;||&nbsp;
                                   				<a href="<%=request.getContextPath() %>/admin/danh-muc/del?cid=<%=objCat.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/del.gif" alt="" /> Xóa</a>
                                   			</td>
                                   			<%} else if ("mod".equals(userinfo.getLevel())){ %>
                                   			<td>
                                   				<a href="<%=request.getContextPath() %>/admin/danh-muc/edit?cid=<%=objCat.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="" /> Sửa</a>
                                   			</td>
                                   			<%} else if ("editor".equals(userinfo.getLevel())){ %>
                                   			<td>Không có quyền</td>
                                   			<%} %>
                                   	<%} %>
                                   
                                   </tr>
                                 	<%}} //end for %>
				 					<%} //end if %> 
                               </tbody>

                           </table>
							<div class="form-group" style="margin-left: 20px; display: inline;"">
                               <a href="<%=request.getContextPath() %>/admin/danh-muc/edit"><i class="ti-check"></i> Chọn tất cả</a>
                            </div>
                            <div class="form-group" style="margin-left: 10px; display: inline;">
                               <a href="<%=request.getContextPath() %>/admin/danh-muc/edit"><i class="ti-trash"></i> Xóa tất cả</a>
                            </div>
							
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
<%@include file="/templates/admin/inc/footer.jsp" %>