<%@page import="library.LibraryString"%>
<%@page import="model.bean.Cat"%>
<%@page import="model.dao.CatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Lập trình JAVA từ A-Z</title>
<link href="<%=request.getContextPath() %>/templates/public/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=request.getContextPath() %>/templates/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="lap trinh php, lap trinh java, dao tao php tai da nang" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,700' rel='stylesheet' type='text/css'>
<script src="<%=request.getContextPath() %>/templates/public/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/templates/public/js/responsiveslides.min.js"></script>
<script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
	
  </script>
	
</head>
<body>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="logo">
				<a href="<%=request.getContextPath() %>"><img src="<%=request.getContextPath() %>/templates/public/images/logo.png" class="img-responsive" alt=""></a>
			</div>
			
				<div class="head-nav">
					<span class="menu"> </span>
					<ul class="cl-effect-1">
						<li><a href="<%=request.getContextPath() %>">Trang chủ</a></li>
						<%
							CatDao catDao = new CatDao();
							for(Cat objCat : catDao.getList()){	
								String name = objCat.getName();
								int id = objCat.getId();
								String slug = LibraryString.makeSlug(name);
								String url = request.getContextPath()+ "/"+slug+"-"+id;
								if (objCat.getParent_id() == 0){								
						%>
						<li class="dropdown ">
							<a href="<%=url %>"><%=objCat.getName() %></a>
							
							<%
								for (Cat objCat2 : catDao.getList()){
									if (objCat2.getParent_id() == objCat.getId()){
							%>
							<ul class="dropdown-menu level2" role="menu">
							<%
								for (Cat objCat1 : catDao.getList()){
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
						<div class="clearfix"></div>
					</ul>
				</div>
				<!-- script-for-nav -->
					<script>
						$( "span.menu" ).click(function() {
						  $( ".head-nav ul" ).slideToggle(300, function() {
							// Animation complete.
						  });
						});
					</script>
				<!-- script-for-nav -->
				<div class="clearfix"> </div>
		</div>
	</div>
<!-- header -->
