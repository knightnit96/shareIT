package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryAuth;
import model.dao.CatDao;

public class AdminSearchCatCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminSearchCatCotroller() {
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
		CatDao catDao = new CatDao();
		String cat = new String (request.getParameter("cat").getBytes("ISO-8859-1"),"UTF-8");
		request.setAttribute("cat", cat);
		request.setAttribute("alCat", catDao.getList());
		request.setAttribute("alCat1", catDao.getList());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/searchCat.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
