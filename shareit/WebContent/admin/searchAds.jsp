<%@page import="model.bean.Ads"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#sAds').validate({
			rules:{
				ads:{
					required : true,
				},
			},
			messages:{
				ads:{
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
                           <h4 class="title">Quảng cáo</h4>                  
                           <form id="sAds" action="<%=request.getContextPath() %>/admin/ads/search" method="get">
                           	<div class="row">
                                   <div class="col-md-4">
                                       <div class="form-group">
                                           <input type="text" name="ads" class="form-control border-input" placeholder="Tên quảng cáo" value="<%=request.getAttribute("ads")%>">
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
                           <a href="<%=request.getContextPath() %>/admin/ads/add" class="addtop"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/add.png" alt="" /> Thêm</a>
                      		<%} %>
                       </div>
                       <div class="content table-responsive table-full-width">
                           <table class="table table-striped">
                               <thead>   
                               		<th>ID</th>        
	                               	<th>Tên quảng cáo</th>
	                               	<th>Hình ảnh</th>
	                               	<th>Link</th>
	                               	<th>Slide</th>
	                               	<th>Chức năng</th>
                               </thead>
                               <tbody>
                               		<%	            						
	            						if (request.getAttribute("alAds") != null) { 
	            							ArrayList<Ads> alAds = (ArrayList<Ads>) request.getAttribute("alAds");
	            							for (Ads objAds : alAds){
	            								if (request.getAttribute("ads").equals(objAds.getName())){
	            								String picture = objAds.getPicture();
                               		%>
                                   <tr> 
                                   		<td><%=objAds.getId() %></td>    
                                   		<td><%=objAds.getName() %></td>  
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
                                   		<td><a href="<%=objAds.getLink() %>"><%=objAds.getLink() %></a></td>      
                                   		<td class="text-center" id="change-<%=objAds.getId() %>">
                                   			<a href="javascript:void(0)" onclick="changeSlide(<%=objAds.getId() %>, <%=objAds.getIs_slide() %>)">
                                   				<% if (objAds.getIs_slide() == 0){ %>
                                   				<img alt="Disactive" src="<%=request.getContextPath() %>/templates/admin/assets/img/disactive.png" width="20px"/>
                                   				<%} else if (objAds.getIs_slide() == 1){ %>
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
										      url: "<%=request.getContextPath() %>/admin/ads/change-slide",
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
                                   		<% if ("admin".equals(userinfo.getLevel())){ %>
                                   		<td>
                                   			<a href="<%=request.getContextPath() %>/admin/ads/edit?aid=<%=objAds.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/edit.gif" alt="Sửa" /> SỬA</a> &nbsp;||&nbsp;  
                                   			<a href="<%=request.getContextPath() %>/admin/ads/del?aid=<%=objAds.getId() %>"><img src="<%=request.getContextPath() %>/templates/admin/assets/img/del.gif" alt="Xóa" /> XÓA</a>
                                   		</td>
                                   		<%} else { %>
                                   		<td>Ko có quyền</td>
                                   		<%} %>
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