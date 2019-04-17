<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath() %>/templates/admin/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<%=request.getContextPath() %>/templates/admin/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>AdminCP - VinaEnter</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="<%=request.getContextPath() %>/templates/admin/assets/css/themify-icons.css" rel="stylesheet">
	
	 <!--   Core JS Files   -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/assets/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/assets/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/ckeditor/ckeditor.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/ckfinder/ckfinder.js" type="text/javascript"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="<%=request.getContextPath() %>/templates/admin/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="<%=request.getContextPath() %>/templates/admin/assets/js/demo.js"></script>
</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="<%=request.getContextPath() %>/admin" class="simple-text">Admin</a>
            </div>
			
            <ul class="nav">
            	<li <%if("/shareit/admin/indexCat.jsp".equals(request.getRequestURI())){out.print("class='active'");} %>>
                    <a href="<%=request.getContextPath() %>/admin/danh-muc">
                        <i class="ti-map"></i>
                        <p>Danh mục</p>
                    </a>
                </li>
            	 <li <%if("/shareit/admin/indexNews.jsp".equals(request.getRequestURI())){out.print("class='active'");} %>>
                    <a href="<%=request.getContextPath() %>/admin/tin-tuc">
                        <i class="ti-view-list-alt"></i>
                        <p>Tin tức</p>
                    </a>
                </li>
                <li <%if("/shareit/admin/indexComment.jsp".equals(request.getRequestURI())){out.print("class='active'");} %>>
                    <a href="<%=request.getContextPath() %>/admin/comment">
                        <i class="ti-comment"></i>
                        <p>Bình luận</p>
                    </a>
                </li>
                <li <%if("/shareit/admin/indexUser.jsp".equals(request.getRequestURI())){out.print("class='active'");} %>>
                    <a href="<%=request.getContextPath() %>/admin/user">
                        <i class="ti-user"></i>
                        <p>Quản trị viên</p>
                    </a>
                </li>
                <li <%if("/shareit/admin/indexAdvertisement.jsp".equals(request.getRequestURI())){out.print("class='active'");} %>>
                    <a href="<%=request.getContextPath() %>/admin/ads">
                        <i class="fa fa-money"></i>
                        <p>Quảng cáo</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>