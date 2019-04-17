<%@page import="model.bean.Ads"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#editAds').validate({
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
                                <h4 class="title">Sửa quảng cáo</h4>
                            </div>
                            <div class="content">
                            <%
                            	if (request.getAttribute("objAds") != null) {
                            		Ads objAds = (Ads) request.getAttribute("objAds");
                            %>
                                <form id="editAds" action="<%=request.getContextPath() %>/admin/ads/edit?aid=<%=objAds.getId() %>" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Tên quảng cáo</label>
                                                <input type="text" name="tenquangcao" class="form-control border-input" placeholder="Nhập tên quảng cáo" value="<%=objAds.getName() %>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                               	<label>Link</label>
                                                <input type="text" name="link" class="form-control border-input" placeholder="http://..." value="<%=objAds.getLink() %>"> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                               	<label>Hình ảnh</label>
                                                <input type="file" name="hinhanh" value=""> 
                                                <%
                                                	if (!"".equals(objAds.getPicture())){
                                                %>
                                                <p><img id="avartar-img-show" src="<%=request.getContextPath() %>/files/<%=objAds.getPicture() %>" alt="<%=objAds.getPicture() %>" class="img-responsive" ></p>
                                            	<%} %>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            	<%
                                                	if (!"".equals(objAds.getPicture())){
                                                %>
                                               	<label>Xóa hình ảnh</label>
                                                <p><input type="checkbox" id="active" name="delete_picture">Xóa</p>
                                          		<%} %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-info btn-fill btn-wd" value="Thực hiện" />
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@include file="/templates/admin/inc/footer.jsp" %>