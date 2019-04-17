package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Define;
import library.LibraryAuth;
import model.dao.CatDao;
import model.dao.PageDao;

public class AdminIndexCatCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexCatCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		PageDao pageDao = new PageDao();
		CatDao catDao = new CatDao();
		//tổng số tin
		int current_page = 1;
		int sumCat = pageDao.countCat();
		int sumPage = (int)Math.ceil((float)sumCat/Define.ROW_COUNT_ADMIN);
		//lấy trang hiện tại - current_page
		
		if(request.getParameter("page") != null){
			current_page = Integer.parseInt(request.getParameter("page"));
		}
		//tính offset
		int offset = (current_page - 1)*Define.ROW_COUNT_ADMIN;
		request.setAttribute("sumPage", sumPage);
		request.setAttribute("current_page", current_page);
		request.setAttribute("alCat", pageDao.getItemsPaginationCat(offset));
		request.setAttribute("alCat1", catDao.getList());
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexCat.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
