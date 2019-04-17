package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.LibraryAuth;
import library.StringLibrary;
import model.bean.User;
import model.dao.UserDao;

public class AdminAddUserCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    public AdminAddUserCotroller() {
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
		
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		if ("admin".equals(userDao.getItem(userInfo.getId()).getLevel())){
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addUser.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=1");
			return;
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		String username = new String (request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		String fullname = new String (request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");
		String level = new String (request.getParameter("level").getBytes("ISO-8859-1"),"UTF-8");
		String password = StringLibrary.md5(new String (request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
		String email = new String (request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
		User objUser = new User(0, username, password, fullname, email, level);
		for (int i = 0; i < username.length() - 1; i++) {			
			if (username.charAt(i) == ' ') { //tên người dùng ko khoảng cách, có thể mở rộng tùy trường hợp
				response.sendRedirect(request.getContextPath()+"/admin/user/add?msg=addFail1");
				return;
			}
		}
		if (userDao.checkUser(username) != null) {
			//đã tồn tại username
			response.sendRedirect(request.getContextPath()+"/admin/user/add?msg=addFail");
			return;
		} else {
			if (userDao.addItem(objUser) > 0){
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=addSuc");
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=addFail");
			}
		}
	}

}
