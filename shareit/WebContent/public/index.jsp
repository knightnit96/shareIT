<%@page import="model.bean.Ads"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="container">
	<div class="col-md-9 bann-right lefthome">
		<!-- banner -->
		<div class="banner">		
			<div class="header-slider">
				<div class="slider">
					<div class="callbacks_container">
					  	<ul class="rslides" id="slider">
					  	<%
							if (request.getAttribute("alNews") != null) {
								ArrayList<News> alNews = (ArrayList<News>) request.getAttribute("alNews"); 
								if (alNews.size() > 0){
									for(News objNews : alNews){
										if (objNews.getIs_slide() == 1){
										int id = objNews.getId();
										String name = objNews.getName();
										String slug = LibraryString.makeSlug(name);
										String url = request.getContextPath()+ "/"+slug+"-"+id+".html";
						%>
							<li>
								<a href="<%=url %>"><img style="height: 400px" src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" class="img-responsive" alt=""></a>
								<div class="caption">
									<h3><a href="<%=url %>"><%=objNews.getName() %></a></h3>
									<p><%=objNews.getPreview() %></p>
								</div>
							</li>
						<%}}}} %>
						</ul>
			  		</div>
				 </div>
			</div>
		</div>
		<!-- banner -->	
		<!-- nam-matis -->
		<div class="nam-matis">
			<div class="nam-matis-top">
				<%
					if (request.getAttribute("alNewsIndex") != null) {
						ArrayList<News> alNewsIndex = (ArrayList<News>) request.getAttribute("alNewsIndex"); 
						if (alNewsIndex.size() > 0){
							int a = 0;
							for(News objNews : alNewsIndex){
								a++;
								int id = objNews.getId();
								String name = objNews.getName();
								String slug = LibraryString.makeSlug(name);
								String url = request.getContextPath()+ "/"+slug+"-"+id+".html";
				%>
				<div class="col-md-6 nam-matis-1">
					<%
						if (!"".equals(objNews.getPicture())){
					%>
					<a href="<%=url %>"><img src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" class="img-responsive" alt=""></a>
					<%} else { %>
					<p>--Chưa cập nhật hình--</p>
					<%} %>
					<h3><a href="<%=url %>"><%=objNews.getName() %></a></h3>
					<p><%=objNews.getPreview() %></p>
				</div>
					<% if (a == 2|| a == 4){ %>
					<div class="clearfix"> </div>
					</div>
					<div class="nam-matis-top">
					<%} %>
				<%}}} %>
				<div class="clearfix"> </div>
			</div>	
		</div>
		<!-- nam-matis -->	
	</div>
	
	<%@include file="/templates/public/inc/right_bar_top.jsp" %>

	
	<div class="clearfix"> </div>
		<div class="fle-xsel">
			<ul id="flexiselDemo3">
				<%
					if (request.getAttribute("alAds") != null){
						ArrayList<Ads> alAds = (ArrayList<Ads>) request.getAttribute("alAds");
						for (Ads objAds : alAds){
							int id = objAds.getId();
							String name = objAds.getName();
							String slug = LibraryString.makeSlug(name);
							String url = request.getContextPath()+ "/"+slug+"-"+id+".html";
				%>
				<li>
					<a href="<%=url %>">
						<div class="banner-1">
							<img src="<%=request.getContextPath() %>/files/<%=objAds.getPicture() %>" class="img-responsive" alt="">
						</div>
					</a>
				</li>	
			<%}} %>			
			</ul>
							
							 <script type="text/javascript">
								$(window).load(function() {
									
									$("#flexiselDemo3").flexisel({
										visibleItems: 5,
										animationSpeed: 1000,
										autoPlay: true,
										autoPlaySpeed: 3000,    		
										pauseOnHover: true,
										enableResponsiveBreakpoints: true,
										responsiveBreakpoints: { 
											portrait: { 
												changePoint:480,
												visibleItems: 2
											}, 
											landscape: { 
												changePoint:640,
												visibleItems: 3
											},
											tablet: { 
												changePoint:768,
												visibleItems: 3
											}
										}
									});
									
								});
								</script>
								<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/jquery.flexisel.js"></script>
					<div class="clearfix"> </div>
		</div>
<%@include file="/templates/public/inc/footer.jsp" %>	