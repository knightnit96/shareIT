package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryAuth;
import model.dao.NewsDao;

public class AdminSearchNewsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminSearchNewsCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");	
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		NewsDao newsDao = new NewsDao();
		String news = new String (request.getParameter("news").getBytes("ISO-8859-1"),"UTF-8");
		request.setAttribute("news", news);
		request.setAttribute("alNews", newsDao.getList());
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/searchNews.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
