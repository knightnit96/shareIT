<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/left_bar.jsp" %>
<%@include file="/templates/admin/inc/header.jsp" %>
<script type ="text/javascript">
	$(document).ready(function (){
		$('#editCat').validate({
			rules:{
				tendanhmuc:{
					required : true,
					minlength: 5,
					maxlength: 30
				},
			},
			messages:{
				tendanhmuc:{
					required : "<p>Vui lòng nhập tên danh mục</p>",
					minlength: "<p>Vui lòng nhập hơn 5 ký tự</p>",
					maxlength: "<p>Vui lòng nhập không quá 30 ký tự</p>"
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
                                <h4 class="title">Sửa danh mục</h4>
                            </div>
                            <div class="content">
                            	<%
							 		if (request.getAttribute("objCat") != null ){
							 			Cat objCat = (Cat) request.getAttribute("objCat");
							 	%>
                                <form id="editCat" action="<%=request.getContextPath() %>/admin/danh-muc/edit?cid=<%=objCat.getId() %>" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Tên danh mục</label>
                                                <input type="text" name="tendanhmuc" class="form-control border-input" placeholder="Nhập tên danh mục" value="<%=objCat.getName()%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Danh mục cha</label>
                                                <%
													if (request.getAttribute("alCat") != null) { 
														ArrayList<Cat> alCat = (ArrayList<Cat>) request.getAttribute("alCat");
														String selected = "";
												%>
                                                <select name="danhmuccha" class="form-control border-input">
	                                               	<%
	                                               		if (objCat.getParent_id() == 0) {
	                                               	%>
	                                               	<option value="0" selected="selected">--Không có--</option>
	                                               		<%
	                                               		for (Cat objCat1 : alCat){
	                                               			if (objCat1.getParent_id() == 0) {
	                                               		%>
	                                               	<option value="<%=objCat1.getId() %>"><%=objCat1.getName() %></option>
	                                                <% }}} else { %>
	                                                <option value="0">--Không có--</option>
	                                                <% 
														for (Cat objCat1 : alCat){
															if (objCat1.getId() == objCat.getParent_id()) {
																selected = "selected = 'selected'";
															} else {
																selected = "";
															}
															if (objCat1.getParent_id() == 0) {
													%>
                                                	<option <%=selected  %> value="<%=objCat1.getId() %>"><%=objCat1.getName() %></option>
                                                	<%}}} //end for %>
                                                </select>
                                                <%} //end if %> 
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