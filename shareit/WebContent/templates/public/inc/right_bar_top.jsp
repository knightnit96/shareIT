<%@page import="model.bean.Cat"%>
<%@page import="model.dao.CatDao"%>
<%@page import="library.LibraryString"%>
<%@page import="model.bean.News"%>
<%@page import="model.dao.NewsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-3 bann-left righthome">
	<div class="b-search">
		<form>
			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
			<input type="submit" value="">
		</form>
	</div>
	<h3>Bài viết mới</h3>
	<div class="blo-top">
		<%
			NewsDao newsDao = new NewsDao();
			for (News objNews : newsDao.getTinMoiNhat()){
				String name = objNews.getName();
				int id = objNews.getId();
				String slug = LibraryString.makeSlug(name);
				String url = request.getContextPath()+ "/"+slug+"-"+id+".html";
		%>
		<div class="blog-grids">
			<div class="blog-grid-left">
				<a href="<%=url %>"><img src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" class="img-responsive" alt=""></a>
			</div>
			<div class="blog-grid-right">
				<h4><a href="<%=url %>"><%=objNews.getName() %></a></h4>
			</div>
			<div class="clearfix"> </div>
		</div>
		<%} %>
	</div>
	<h3>Danh mục lập trình</h3>
	<div class="blo-top">
		<ul>
		<%
			CatDao catDao1 = new CatDao();
			for(Cat objCat : catDao1.getList()){	
				String name = objCat.getName();
				int id = objCat.getId();
				String slug = LibraryString.makeSlug(name);
				String url = request.getContextPath()+ "/"+slug+"-"+id;
				if (objCat.getParent_id() == 0){								
		%>
		<li>
			<a href="<%=url %>"><%=objCat.getName() %></a>
			<%
				for (Cat objCat2 : catDao1.getList()){
					if (objCat2.getParent_id() == objCat.getId()){
			%>
			<ul>
			<%
				for (Cat objCat1 : catDao1.getList()){
					if (objCat1.getParent_id() == objCat.getId()){
						String name1 = objCat1.getName();
						int id1 = objCat1.getId();
						String slug1 = LibraryString.makeSlug(name1);
						String url1 = request.getContextPath()+ "/"+slug1+"-"+id1;
			%>	
				<li><a href="<%=url1 %>"><%=objCat1.getName() %></a></li>	
			<%}} %>		
			</ul>	
			<% break;}} %>
		</li>
		<%}} %>
		</ul>
	</div>
</div>