<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
	<div class="container">
		<div class="blog">
			
		<div class="blog-content">
					<div class="blog-content-left">
						<div class="blog-articals">
						<%
							Cat objCat3 = (Cat) request.getAttribute("objCat");
							if (request.getAttribute("listNews") != null) {
								ArrayList<News> listNews = (ArrayList<News>) request.getAttribute("listNews"); 
								if (listNews.size() > 0){
									for(News objNews : listNews){
										int id = objNews.getId();
										String name = objNews.getName();
										String slug = LibraryString.makeSlug(name);
										String url = request.getContextPath()+ "/"+slug+"-"+id+".html";
						%>
						<div class="blog-artical">
						
							<div class="blog-artical-info">
								<div class="blog-artical-info-img">
									<%
										if (!"".equals(objNews.getPicture())){
									%>
									<a href="<%=url %>"><img style="height: 500px" src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" title="post-name"></a>
									<%} else { %>
									<p>--Chưa cập nhật hình--</p>
									<%} %>
								</div>
								<div class="blog-artical-info-head">
									<h2><a href="<%=url %>"><%=objNews.getName() %></a></h2>
									<h6><%=objNews.getDate_create() %> by <%=objNews.getFullname() %></h6>
									
								</div>
								<div class="blog-artical-info-text">
									<p><%=objNews.getPreview() %><a href="<%=url %>">[...]</a></p>
								</div>
								<div class="artical-links">
		  						 	<ul>
		  						 		<li><small> </small><span><%=objNews.getDate_create() %></span></li>
		  						 		<li><small class="admin"> </small><span><%=objNews.getFullname() %></span></li>
		  						 		<li><a href="<%=url %>"><small class="no"> </small><span>No comments</span></a></li>
		  						 		<li><a href="<%=url %>"><small class="posts"> </small><span>View posts</span></a></li>
		  						 	</ul>
		  						 </div>
							</div>
							<div class="clearfix"> </div>
						</div>
						<%}}} %>
					</div>
					<!--start-blog-pagenate-->
							<nav>
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
									<li <%=active %>><a href="<%=request.getContextPath() %>/cat?page=<%=i %>&cid=<%=objCat3.getId() %>" title=""><%=i %></a></li> 
								<%}} else { 
									if (current_page != 1) {
								%>
							        <li>
									  <a href="<%=request.getContextPath() %>/cat?page=<%=(current_page - 1) %>&cid=<%=objCat3.getId() %>" aria-label="Previous">
										<span aria-hidden="true">«</span>
									  </a>
									</li>
									<li><a href="<%=request.getContextPath() %>/cat?page=<%=(current_page - 1) %>&cid=<%=objCat3.getId() %>" title=""><%=(current_page - 1) %></a></li> 
								<%} %>
									<li class="active"><a href="<%=request.getContextPath() %>/cat?page=<%=current_page %>&cid=<%=objCat3.getId() %>" title=""><%=current_page %></a></li> 
								<% if (current_page != sumPage){  %>
							        <li><a href="<%=request.getContextPath() %>/cat?page=<%=(current_page + 1) %>&cid=<%=objCat3.getId() %>" title=""><%=(current_page + 1) %></a></li> 							       
							   		<li>
									  <a href="<%=request.getContextPath() %>/cat?page=<%=(current_page + 1) %>&cid=<%=objCat3.getId() %>" aria-label="Next">
										<span aria-hidden="true">»</span>
									  </a>
									</li>
								<%}} %>
							  </ul>
							</nav>
				<!--//End-blog-pagenate-->
					</div>
					
					<%@include file="/templates/public/inc/right_bar_top.jsp" %>
					<div class="clearfix"> </div>
				
				</div>
		</div>
		<!-- /Blog -->
<%@include file="/templates/public/inc/footer.jsp" %>	