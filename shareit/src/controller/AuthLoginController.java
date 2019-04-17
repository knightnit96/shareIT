package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.StringLibrary;
import model.bean.User;
import model.dao.UserDao;

public class AuthLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;    
	private UserDao userDao = new UserDao();
    public AuthLoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher rd = request.getRequestDispatcher("/auth/login.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");		
		
		//String ten = new String (request.getParameter("ten").getBytes("ISO-8859-1"),"UTF-8");
		String username = request.getParameter("username");
		String password = StringLibrary.md5(new String (request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
	
		User objUser = new User(0, username, password, "", "", "");
		User objUserLogin = userDao.getUserLogin(objUser);	
		if (objUserLogin != null){
			//đăng nhập đúng
			//tạo session
			HttpSession session = request.getSession();
			session.setAttribute("sobjUser", objUserLogin);
			//chuyển hướng
			response.sendRedirect(request.getContextPath()+"/admin");
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/auth/login?msg=loginFail");
			return;
		}	
	}
}
