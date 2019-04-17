<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#addAds').validate({
			rules:{
				tenquangcao:{
					required : true,
					minlength: 5,
					maxlength: 30
				},
				link:{
					required : true,
					url : true
				},
			},
			messages:{
				tenquangcao:{
					required : "<p>Vui lòng nhập tên quảng cáo</p>",
					minlength: "<p>Vui lòng nhập hơn 5 ký tự</p>",
					maxlength: "<p>Vui lòng nhập không quá 30 ký tự</p>"
				},
				link:{
					required : "<p>Vui lòng nhập link</p>",
					url: "<p>Vui lòng nhập đúng định dạng link<p>"
				},
			},		
		});	
	});
</script>		
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Thêm quảng cáo</h4>
                            </div>
                            <div class="content">
                                <form id="addAds" action="<%=request.getContextPath() %>/admin/ads/add" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Tên quảng cáo</label>
                                                <input type="text" name="tenquangcao" class="form-control border-input" placeholder="Nhập tên quảng cáo" value="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                               	<label>Link</label>
                                                <input type="text" name="link" class="form-control border-input" placeholder="http://..." value=""> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                               	<label>Hình ảnh</label>
                                                <input type="file" name="hinhanh" value=""> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-info btn-fill btn-wd" value="Thực hiện" />
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@include file="/templates/admin/inc/footer.jsp" %>