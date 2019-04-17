package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryAuth;
import model.dao.PageDao;
import constant.Define;

public class AdminIndexNewsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexNewsCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		PageDao pageDao = new PageDao();
		//tổng số tin
		int current_page = 1;
		int sumNews = pageDao.countNews();
		int sumPage = (int)Math.ceil((float)sumNews/Define.ROW_COUNT_ADMIN);
		//lấy trang hiện tại - current_page
		
		if(request.getParameter("page") != null){
			current_page = Integer.parseInt(request.getParameter("page"));
		}
		//tính offset
		int offset = (current_page - 1)*Define.ROW_COUNT_ADMIN;
		request.setAttribute("sumPage", sumPage);
		request.setAttribute("current_page", current_page);
		request.setAttribute("alNews", pageDao.getItemsPaginationNews(offset));
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexNews.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
