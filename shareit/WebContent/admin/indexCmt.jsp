<%@page import="model.bean.Cmt"%>
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
                           <h4 class="title">Bình luận</h4>
                            <%
						 		if (request.getParameter("msg") != null) {
						 			String msg = request.getParameter("msg");
						 			if ("delSuc".equals(msg)){
						 				out.print("<p class='category success'>Xóa thành công</p>");
						 			} else if ("delFail".equals(msg)){
						 				out.print("<p class='category error'>Xóa thất bại</p>");
						 			} else if ("1".equals(msg)){
						 				out.print("<p class='category error'>Bạn không có quyền thực hiện chức năng này</p>");
						 			}		
						 		}
						 	%>                         
                           <form action="<%=request.getContextPath() %>/admin/comment/search" method="get">
                           	<div class="row">
                                   <div class="col-md-4">
                                       <div class="form-group">
                                           <input type="text" name="cmt" class="form-control border-input" placeholder="Bình luận" value="">
                                       </div>
                                   </div>
                                   <div class="col-md-4">
                                   	<div class="form-group">
                                     <input type="submit" name="search" value="Tìm kiếm" class="is" />
                                    </div>
                                   </div>
                               </div>                               
                           </form>
                            <% User userinfo = (User) session.getAttribute("sobjUser"); %>  
                       </div>
                       <div class="content table-responsive table-full-width">
                           <table class="table table-striped">
                               <thead>           
	                               	<th>Tên bài viết</th>
	                               	<th>Họ và tên</th>
	                               	<th>Email</th>
	                               	<th>Website</th>
	                               	<th>Bình luận</th>
	                               	<th>Active</th>
	                               	<th>Chức năng</th>
                               </thead>
                               <tbody>
                               		<%	            						
	            						if (request.getAttribute("alCmt") != null) { 
	            							ArrayList<Cmt> alCmt = (ArrayList<Cmt>) request.getAttribute("alCmt");
	            							for (Cmt objCmt : alCmt){
                               		%>
                                   <tr>                          
                                   		<td><%=objCmt.getNname() %></td>
                                   		<td><%=objCmt.getName_cmt() %></td>
                                   		<td><%=objCmt.getEmail_cmt() %></td>
                                   		<td><%=objCmt.getWeb_cmt() %></td>
                                   		<td><%=objCmt.getContent() %></td>
                                   		<%
                                   			if ("admin".equals(userinfo.getLevel())){
                                   		%>
                                   		<td class="text-center" id="change-<%=objCmt.getId() %>">
                                   			<a href="javascript:void(0)" onclick="changeActive(<%=objCmt.getId() %>, <%=objCmt.getActive() %>)">
                                   				<% if (objCmt.getActive() == 0){ %>
                                   				<img alt="Disactive" src="<%=request.getContextPath() %>/templates/admin/assets/img/disactive.png" width="20px"/>
                                   				<%} else if (objCmt.getActive() == 1){ %>
                                   				<img alt="Active" src="<%=request.getContextPath() %>/templates/admin/assets/img/active.png" width="20px"/>
                                   				<%} %>
                                   			</a>
                                   		</td> 
                                   		<script type="text/javascript">
										  function changeActive(id, active){
										    $.ajaxSetup({
										    headers: {
										      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
										    }
										  });
										    $.ajax({
										      url: "<%=request.getContextPath() %>/admin/comment/change-active",
										      type: 'POST',
										      cache: false,
										      data: {
										    	aactive : active,
										        aid: id
										      },
										      success: function(data){
										        $("#change"+'-'+id).html(data); 
										      },
										      error: function (){
										        alert('Có lỗi');
										      }
										    }); 
										  }
										</script>   
                                   		<td>
                                   			<a href="<%=request.getContextPath() %>/admin/comment/del?cmtid=<%=objCmt.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/del.gif" alt="Xóa" /> XÓA</a>
                                   		</td>
                                   		<%} else { %>
                                   		<td>
                                   			<% if (objCmt.getActive() == 0){ %>
                               				<img alt="Disactive" src="<%=request.getContextPath() %>/templates/admin/assets/img/disactive.png" width="20px"/>
                               				<%} else if (objCmt.getActive() == 1){ %>
                               				<img alt="Active" src="<%=request.getContextPath() %>/templates/admin/assets/img/active.png" width="20px"/>
                               				<%} %>
                                   		</td>
                                   		<td>Không có quyền</td>	
                                   		<%} %>
                                  	<%} //end for %>
				 					<%} //end if %> 
                                   </tr>                                 	
                               </tbody>
                           </table>
							<div></div>
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
									<li <%=active %>><a href="<%=request.getContextPath() %>/admin/comment?page=<%=i %>" title=""><%=i %></a></li> 
								<%}} else { 
									if (current_page != 1) {
								%>
							        <li>
									  <a href="<%=request.getContextPath() %>/admin/comment?page=<%=(current_page - 1) %>" aria-label="Previous">
										<span aria-hidden="true">«</span>
									  </a>
									</li>
									<li><a href="<%=request.getContextPath() %>/admin/comment?page=<%=(current_page - 1) %>" title=""><%=(current_page - 1) %></a></li> 
								<%} %>
									<li class="active"><a href="<%=request.getContextPath() %>/admin/comment?page=<%=current_page %>" title=""><%=current_page %></a></li> 
								<% if (current_page != sumPage){  %>
							        <li><a href="<%=request.getContextPath() %>/admin/comment?page=<%=(current_page + 1) %>" title=""><%=(current_page + 1) %></a></li> 							       
							   		<li>
									  <a href="<%=request.getContextPath() %>/admin/comment?page=<%=(current_page + 1) %>" aria-label="Next">
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