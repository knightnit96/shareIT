<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
    <div class="content">
       <div class="container-fluid">
           <div class="row">
               <div class="col-md-12">
                   <div class="card">
                       <div class="header">
                           <h4 class="title">Danh mục</h4>
                           <%
						 		if (request.getParameter("msg") != null) {
						 			String msg = request.getParameter("msg");
						 			if ("addSuc".equals(msg)){
						 				out.print("<p class='category success'>Thêm thành công</p>");
						 			} else if ("addFail".equals(msg)){
						 				out.print("<p class='category error'>Thêm thất bại</p>");
						 			} else if ("editSuc".equals(msg)){
						 				out.print("<p class='category success'>Sửa thành công</p>");
						 			} else if ("editFail".equals(msg)){
						 				out.print("<p class='category error'>Sửa thất bại</p>");
						 			} else if ("delSuc".equals(msg)){
						 				out.print("<p class='category success'>Xóa thành công</p>");
						 			} else if ("delFail".equals(msg)){
						 				out.print("<p class='category error'>Xóa thất bại</p>");
						 			} else if ("1".equals(msg)){
						 				out.print("<p class='category error'>Bạn không có quyền thực hiện chức năng này</p>");
						 			}	
						 		}
						 	%>
                           <form action="<%=request.getContextPath() %>/admin/danh-muc/search" method="get">
                           		<div class="row">
                                   <div class="col-md-4">
                                       <div class="form-group">
                                           <input type="text" name="cat" class="form-control border-input" placeholder="Tên danh mục" value="">
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
                                 	<%} //end for %>
				 					<%} //end if %> 
                               </tbody>

                           </table>
							<div class="form-group" style="margin-left: 20px; display: inline;"">
                               <a href="<%=request.getContextPath() %>/admin/danh-muc/edit"><i class="ti-check"></i> Chọn tất cả</a>
                            </div>
                            <div class="form-group" style="margin-left: 10px; display: inline;">
                               <a href="<%=request.getContextPath() %>/admin/danh-muc/edit"><i class="ti-trash"></i> Xóa tất cả</a>
                            </div>
							<div class="text-center">
							    <ul class="pagination">
							    <%
									int sumPage = (Integer) request.getAttribute("sumPage");
									int current_page = (Integer) request.getAttribute("current_page");
									String active = "";
									if (sumPage <= 3) {
									for (int i = 1; i <= sumPage; i++){
										if (current_page == i){
											active = "class='active'";
										} else {
											active = "";
										}
								%>
									<li <%=active %>><a href="<%=request.getContextPath() %>/admin/danh-muc?page=<%=i %>" title=""><%=i %></a></li> 
								<%}} else { 
									if (current_page != 1) {
								%>
							        <li>
									  <a href="<%=request.getContextPath() %>/admin/danh-muc?page=<%=(current_page - 1) %>" aria-label="Previous">
										<span aria-hidden="true">«</span>
									  </a>
									</li>
									<li><a href="<%=request.getContextPath() %>/admin/danh-muc?page=<%=(current_page - 1) %>" title=""><%=(current_page - 1) %></a></li> 
								<%} %>
									<li class="active"><a href="<%=request.getContextPath() %>/admin/danh-muc?page=<%=current_page %>" title=""><%=current_page %></a></li> 
								<% if (current_page != sumPage){  %>
							        <li><a href="<%=request.getContextPath() %>/admin/danh-muc?page=<%=(current_page + 1) %>" title=""><%=(current_page + 1) %></a></li> 							       
							   		<li>
									  <a href="<%=request.getContextPath() %>/admin/danh-muc?page=<%=(current_page + 1) %>" aria-label="Next">
										<span aria-hidden="true">»</span>
									  </a>
									</li>
								<%}} %>
							    </ul>
							</div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
<%@include file="/templates/admin/inc/footer.jsp" %>