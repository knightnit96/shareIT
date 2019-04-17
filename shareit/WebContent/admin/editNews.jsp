<%@page import="model.bean.Cat"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#editNews').validate({
			rules:{
				tenbaiviet:{
					required : true,
					minlength: 5,
					maxlength: 30
				},
				preview:{
					required : true,
				},
				detail:{
					required : true,
				},
			},
			messages:{
				tenbaiviet:{
					required : "<p>Vui lòng nhập tên bài viết</p>",
					minlength: "<p>Vui lòng nhập hơn 5 ký tự</p>",
					maxlength: "<p>Vui lòng nhập không quá 30 ký tự</p>"
				},	
				preview:{
					required : "<p>Vui lòng nhập tên danh mục</p>",
				},	
				detail:{
					required : "<p>Vui lòng nhập tên danh mục</p>",
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
                                <h4 class="title">Thêm tin tức</h4>
                            </div>
                            <div class="content">
                            <%
						 		if (request.getAttribute("objNews") != null ){
						 			News objNews = (News) request.getAttribute("objNews");
						 	%>
                                <form id="editNews" action="<%=request.getContextPath() %>/admin/tin-tuc/edit?nid=<%=objNews.getId() %>" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tên bài viết</label>
                                                <input type="text" name="tenbaiviet" class="form-control border-input" placeholder="Nhập tên bài viết" value="<%=objNews.getName() %>">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Danh mục</label>
                                                <%
													if (request.getAttribute("alCat") != null) { 
														ArrayList<Cat> alCat = (ArrayList<Cat>) request.getAttribute("alCat");	
														String selected = "";
												%>
												<select name="danhmuc" class="form-control border-input">
												<%
													for (Cat objCat : alCat){
														if (objNews.getCat_id() == objCat.getId()){
															selected = "selected = 'selected'";
														} else {
															selected = "";
														}
														if (objCat.getParent_id() == 0) {
												%>
													<option <%=selected  %> value="<%=objCat.getId() %>"><%=objCat.getName() %></option>
												<% } else if (objCat.getParent_id() != 0) {%>
													<option <%=selected  %> value="<%=objCat.getId() %>">|--<%=objCat.getName() %></option>
												
												<%}} %>
												</select>
												<%} %>
                                            </div>
                                        </div>
                                        <div></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
						                    <div class="form-group">
						                        <label>Hình ảnh</label>
						                        <input type="file" name="picture" class="form-control" placeholder="Chọn ảnh" /><br />
												<%
													if(!"".equals(objNews.getPicture())){
												%>
													<img id="avartar-img-show" alt="<%=objNews.getPicture() %>" src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" class="img-responsive" />
												<%} %>
						                    </div> 
						                </div>
						                <div class="col-md-6">
                                            <div class="form-group">
                                            	<%
                                                	if (!"".equals(objNews.getPicture())){
                                                %>
                                               	<label>Xóa hình ảnh</label>
                                                <p><input type="checkbox" id="active" name="delete_picture">Xóa</p>
                                          		<%} %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
						                <div class="col-md-12">
						                    <div class="form-group">
						                        <label>Mô tả</label>
						                        <textarea name="preview" rows="4" class="form-control border-input" placeholder="Mô tả bài viết"><%=objNews.getPreview() %></textarea>
						                    </div>
						                </div>
						            </div>
						            <div class="row">
						                <div class="col-md-12">
						                    <div class="form-group">
						                        <label>Chi tiết</label>
						                        <textarea name="detail" rows="6" class="form-control border-input ckeditor" placeholder="Nội dung bài viết"><%=objNews.getDetail() %></textarea>
						                   		<script type="text/javascript">
													var ckeditor = CKEDITOR.replace('detail');
													CKFinder.setupCKEditor(ckeditor, '<%=request.getContextPath() %>/ckfinder/')
												</script>
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