<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#sNews').validate({
			rules:{
				news:{
					required : true,
				},
			},
			messages:{
				news:{
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
                           <h4 class="title">Tin tức</h4>
                           <form id="sNews" action="<%=request.getContextPath() %>/admin/tin-tuc/search" method="get">
                           	<div class="row">
                                   <div class="col-md-4">
                                       <div class="form-group">
                                           <input type="text" name="news" class="form-control border-input" placeholder="Tên tin tức" value="<%=request.getAttribute("news")%>">
                                       </div>
                                   </div>
                                   <div class="col-md-4">
                                   	<div class="form-group">
                                     <input type="submit" name="search" value="Tìm kiếm" class="is" />
                                    </div>
                                   </div>
                               </div>                               
                           </form>
                           
                           <a href="<%=request.getContextPath() %>/admin/tin-tuc/add" class="addtop"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/add.png" alt="" /> Thêm</a>
                       </div>
                       <div class="content table-responsive table-full-width">
                           <table class="table table-striped">
                               <thead> 
                               		<th style="width: 40px"></th>   
	                               	<th style="width: 250px">Tên bài viết</th>
	                               	<th style="width: 100px">Hình ảnh</th>
	                               	<th style="width: 100px">Ngày tạo</th>
	                               	<th style="width: 100px">Người viết</th>
	                               	<th style="width: 100px">Danh mục</th>
	                               	<th>Active</th>
	                               	<th>Slide</th>
	                               	<th style="width: 8px">View</th>
	                               	<th>Chức năng</th>
                               </thead>
                               <tbody>
                               		<%
	            						User userinfo = (User) session.getAttribute("sobjUser");
	            						if (request.getAttribute("alNews") != null) { 
	            							ArrayList<News> alNews = (ArrayList<News>) request.getAttribute("alNews");
	            							for (News objNews : alNews){
	            								if (request.getAttribute("news").equals(objNews.getName())){
	            								String picture = objNews.getPicture();
                               		%>
                                   <tr>
                                 		<td class="text-center"><input type="checkbox" value="check" name="check" /></td>                                
                                   		<td><a href="<%=request.getContextPath() %>/admin/tin-tuc/edit?nid=<%=objNews.getId() %>"><%=objNews	.getName() %></a></td>
                                   		<td>
                                   			<% 
												if (!"".equals(picture)){
													String urlPic = request.getContextPath() + "/files/" + picture;
											%>
											<img src="<%=urlPic %>" width="100px"/>
											<%} else {%>
												<p>--Chưa cập nhật hình--</p>
											<%} %>
                                   		</td>
                                   		<td><%=objNews.getDate_create() %></td>
                                   		<td><%=objNews.getFullname() %></td>
                                   		<td><%=objNews.getCname() %></td>
                                   		<td class="text-center" id="changeActive-<%=objNews.getId() %>">
                                   			<a href="javascript:void(0)" onclick="<% if (objNews.getActive()==1){ if (objNews.getIs_slide()==1){out.print("changeSlide("+ objNews.getId() +","+ objNews.getIs_slide() +"),");}} %> changeActive(<%=objNews.getId() %>, <%=objNews.getActive() %>)">
                                   				<% if (objNews.getActive() == 0){ %>
                                   				<img alt="Disactive" src="<%=request.getContextPath() %>/templates/admin/assets/img/disactive.png" width="20px"/>
                                   				<%} else if (objNews.getActive() == 1){ %>
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
										      url: "<%=request.getContextPath() %>/admin/tin-tuc/change-active",
										      type: 'POST',
										      cache: false,
										      data: {
										        aactive : active,
										        aid: id
										      },
										      success: function(data){
										        $("#changeActive"+'-'+id).html(data); 
										      },
										      error: function (){
										        alert('Có lỗi');
										      }
										    }); 
										  }
										</script>
                                   		<td class="text-center" id="change-<%=objNews.getId() %>">
                                   			<a href="javascript:void(0)" onclick="changeSlide(<%=objNews.getId() %>, <%=objNews.getIs_slide() %>) <% if (objNews.getIs_slide()==0){ if (objNews.getActive()==0){out.print(",changeActive("+ objNews.getId() +","+ objNews.getActive() +")");}} %>">
                                   				<% if (objNews.getIs_slide() == 0){ %>
                                   				<img alt="Disactive" src="<%=request.getContextPath() %>/templates/admin/assets/img/disactive.png" width="20px"/>
                                   				<%} else if (objNews.getIs_slide() == 1){ %>
                                   				<img alt="Active" src="<%=request.getContextPath() %>/templates/admin/assets/img/active.png" width="20px"/>
                                   				<%} %>
                                   			</a>
                                   		</td>  
                                   		<script type="text/javascript">
										  function changeSlide(id, slide){
										    $.ajaxSetup({
										    headers: {
										      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
										    }
										  });
										    $.ajax({
										      url: "<%=request.getContextPath() %>/admin/tin-tuc/change-slide",
										      type: 'POST',
										      cache: false,
										      data: {
										        aslide : slide,
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
                                   		<td class="text-center"><%=objNews.getView() %></td>
                                   		<td>
                                   			<a href="<%=request.getContextPath() %>/admin/tin-tuc/edit?nid=<%=objNews.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="Sửa" /> SỬA</a> &nbsp;||&nbsp;
                                   			<a href="<%=request.getContextPath() %>/admin/tin-tuc/del?nid=<%=objNews.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/del.gif" alt="Xóa" /> XÓA</a>
                                   		</td>
                                   
                                  	<%}} //end for %>
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