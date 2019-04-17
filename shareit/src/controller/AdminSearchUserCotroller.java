package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryAuth;
import model.dao.UserDao;

public class AdminSearchUserCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminSearchUserCotroller() {
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
		UserDao userDao = new UserDao();
		String user = new String (request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
		request.setAttribute("user", user);
		request.setAttribute("alUser", userDao.getList());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/searchUser.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
