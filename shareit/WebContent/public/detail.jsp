<%@page import="model.bean.Cmt"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>

	<div class="container">
		<div class="blog">
			
		<div class="blog-content">
		
					<div class="blog-content-left">
						<%
							if(session.getAttribute("objNews") != null){	
								News objNews = (News) session.getAttribute(("objNews"));
						%>
						<div class="detail">
							<h1><%=objNews.getName() %></h1>
							<p><%=objNews.getView() %> lượt đã xem</p>
							<p class="sin"><%=objNews.getPreview() %></p>
							<%
								if (!"".equals(objNews.getPicture())){
							%>
							<img src="<%=request.getContextPath() %>/files/<%=objNews.getPicture() %>" class="img-responsive" alt="">
							<%} else { %>
							<p>--Chưa cập nhật hình--</p>
							<%} %>
							<p class="sin"><%=objNews.getDetail() %></p>
						</div>
							<div class="artical-links">
			  						 <ul>
		  						 		<li><small> </small><span><%=objNews.getDate_create() %></span></li>
		  						 		<li><small class="admin"> </small><span><%=objNews.getFullname() %></span></li>
		  						 	</ul>
			  					</div>
			  			
							<div class="respon">
								<h2>Thảo luận</h2>
								<% 
									if(session.getAttribute("alCmt") != null){	
										ArrayList<Cmt> alCmt = (ArrayList<Cmt>) session.getAttribute("alCmt");
										for (Cmt objCmt : alCmt){
											if (objCmt.getParent_id() == 0){
								%>
								<div class="strator">
									<h5><%=objCmt.getName_cmt() %></h5>
									<p><%=objCmt.getDate_create() %></p>
										<div class="strator-left">
											<img src="<%=request.getContextPath() %>/templates/public/images/co.png" class="img-responsive" alt="">
										</div>
										<div class="strator-right">
											<p class="sin"><%=objCmt.getContent() %></p>
										</div>
									<div class="clearfix"></div>
									<div class="rep">
										<a href="javascript:void(0)" class="reply" onclick="openform(<%=objCmt.getId()%>)">Trả lời</a>
									</div>
								</div>
								<div id="open-form-<%=objCmt.getId() %>" style="display:none">
									<div class="comment" >
										<div class="form-reply">
										<script type ="text/javascript">
											$(document).ready(function (){
												$('#rcmt').validate({
													rules:{
														hotenr:{
															required : true,
															minlength: 8,
															maxlength: 50
														},
														emailr:{
															required : true,
															email: true
														},
														websiter:{
															required : true,
															url : true
														},
														contentr:{
															required : true,
														},
													},
													messages:{
														hotenr:{
															required : "<p>Vui lòng nhập tên</p>",
															minlength: "<p>Vui lòng nhập hơn 8 ký tự</p>",
															maxlength: "<p>Vui lòng nhập không quá 50 ký tự</p>"
														},
														emailr:{
															required : "<p>Vui lòng nhập email</p>",
															email: "<p>Vui lòng nhập đúng định dạng email</p> "
														},
														websiter:{
															required : "<p>Vui lòng nhập website</p>",
															url: "<p>Vui lòng nhập đúng định dạng link<p>"
														},
														contentr:{
															required : "<p>Vui lòng nhập bình luận</p>",
														},
													},		
												});	
											});
										</script>		
										<form id="rcmt" method="post" action="javascript:void(0)" class="contact_form form-<%=objCmt.getId() %>">
										  <input type="text" name="hotenr" class="textbox" placeholder="Nhập họ tên">
						                  <input type="text" name="emailr" class="textbox" placeholder="Nhập email">
						                  <input type="text" name="websiter" class="textbox" placeholder="Nhập website">
						                  <textarea name="contentr" placeholder="Nội dung bình luận"></textarea>				
										 <div class="col-md-6">
											<input type="submit" value="Phản hồi" onclick="reply(<%=objCmt.getId()%>)">
                       						<input type="reset" value="Đóng" onclick="closeform(<%=objCmt.getId()%>)">
										 </div>
									   </form>
									   </div>
									</div>
								</div>
								<div class="col-md-12 thong-bao-1" style="display:none">									
									<div class="alert alert-success"><p><strong>Cảm ơn bạn đã phản hồi. Chúng tôi sẽ xem xét phản hồi của bạn</strong></p></div>
                      			</div>
								<%
									for (Cmt objCmt1 : alCmt){
										if (objCmt1.getParent_id() == objCmt.getId()){
								%>
								<div class="strator1">
									<h5><%=objCmt1.getName_cmt() %></h5>
									<p><%=objCmt1.getDate_create() %></p>
										<div class="strator-left">
											<img src="<%=request.getContextPath() %>/templates/public/images/co.png" class="img-responsive" alt="">
										</div>
										<div class="strator-right">
											<p class="sin"><%=objCmt1.getContent() %></p>
										</div>
									<div class="clearfix"></div>
								</div>
								<% }}}}} %>
								<div class="comment">
									<h2>Viết bình luận</h2>
									<script type ="text/javascript">
										$(document).ready(function (){
											$('#cmt').validate({
												rules:{
													hoten:{
														required : true,
														minlength: 8,
														maxlength: 50
													},
													email:{
														required : true,
														email: true
													},
													website:{
														required : true,
														url : true
													},
													content:{
														required : true,
													},
												},
												messages:{
													hoten:{
														required : "<p>Vui lòng nhập tên</p>",
														minlength: "<p>Vui lòng nhập hơn 8 ký tự</p>",
														maxlength: "<p>Vui lòng nhập không quá 50 ký tự</p>"
													},
													email:{
														required : "<p>Vui lòng nhập email</p>",
														email: "<p>Vui lòng nhập đúng định dạng email</p> "
													},
													website:{
														required : "<p>Vui lòng nhập website</p>",
														url: "<p>Vui lòng nhập đúng định dạng link<p>"
													},
													content:{
														required : "<p>Vui lòng nhập bình luận</p>",
													},
												},		
											});	
										});
									</script>		
									<form id="cmt" method="post" action="javascript:void(0)">
									 <input type="text" name="hoten" class="textbox" placeholder="Nhập họ tên">
							          <input type="text" name="email" class="textbox" placeholder="Nhập email">
							          <input type="text" name="website" class="textbox" placeholder="Nhập website">
							          <textarea name="content" placeholder="Nội dung bình luận"></textarea>

									 <div class="smt1">
										<input type="submit" value="Gửi">
									 </div>
								   </form>
								</div>
								<div class="thong-bao" style="display:none">
									<div class="alert alert-success"><p><strong>Cảm ơn bạn đã bình luận. Chúng tôi sẽ xem xét bình luận của bạn</strong></p></div>
								</div>		
							</div>
							<script type="text/javascript">
							  function openform(id){
							        $('#open-form-'+id).show();
							  }
							</script>
							<script type="text/javascript">
							  function closeform(id){
							        $('#open-form-'+id).hide();
							  }
							</script>
							<script type="text/javascript">
							  function reply(id_cmt){
							    var hoten = $('#open-form-'+ id_cmt + " input[name='hotenr']").val();
							    var email = $('#open-form-'+ id_cmt +  " input[name='emailr']").val();
							    var website = $('#open-form-'+ id_cmt +  " input[name='websiter']").val();
							    var content = $('#open-form-'+ id_cmt +  " textarea[name='contentr']").val();
							    var news_id = <%=objNews.getId() %>;
							    $.ajaxSetup({
							      headers: {
							        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
							      }
							    });
							    $.ajax({
							      url: "<%=request.getContextPath() %>/admin/comment/add",
							      type: 'POST',
							      cache: false,
							      data: {
							        ahoten: hoten,
							        aemail: email,
							        awebsite: website,
							        acontent: content,
							        anews_id: news_id,
							        aid_cmt: id_cmt,  
							      },
							      success: function(data){
							    	 
							    	 $('.thong-bao-1').show();
							    	 $('#open-form-'+id_cmt).hide();
							      },
							      error: function (){
							        alert('Có lỗi');
							      }
							    });  
							  }
							</script>
							<script type="text/javascript">
							  $(function(){
							    $(document).on('submit','.comment', function(){
							      var hoten = $( "input[name='hoten']").val();
							      var email = $( "input[name='email']").val();
							      var website = $( "input[name='website']").val();
							      var content = $( "textarea[name='content']").val();
							      var news_id = <%=objNews.getId() %>;
							      var id_cmt = 0;
							
							      $('#loadingmessage').show();
							      $.ajaxSetup({
							        headers: {
							          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
							        }
							      });
							      $.ajax({
							        url: "<%=request.getContextPath() %>/admin/comment/add",
							        type: 'POST',
							        cache: false,
							        data: {
							          ahoten: hoten,
							          aemail: email,
							          awebsite: website,
							          acontent: content,
							          anews_id: news_id,
							          aid_cmt: id_cmt,  
							        },
							        success: function(data){
							        	$('.thong-bao').show();
							        },
							        error: function (){
							          alert('Có lỗi');
							        }
							      });   
							    });
							  });
							</script>
							<%} %>
					</div>
					
					<%@include file="/templates/public/inc/right_bar_top.jsp" %>
					<div class="clearfix"> </div>
				
				</div>
		</div>
		<!-- /Blog -->
<%@include file="/templates/public/inc/footer.jsp" %>	