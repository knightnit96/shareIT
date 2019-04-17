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

public class AdminEditUserCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    public AdminEditUserCotroller() {
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
		int uid = Integer.parseInt(request.getParameter("uid"));
		if ("admin".equals(userDao.getItem(userInfo.getId()).getLevel()) || "mod".equals(userDao.getItem(userInfo.getId()).getLevel()) ||(uid == userInfo.getId())){
			User objUser = userDao.getItem(uid);
			request.setAttribute("objUser", objUser);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editUser.jsp");
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
		int uid = Integer.parseInt(request.getParameter("uid"));
		String fullname = new String (request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");
		String level = new String (request.getParameter("level").getBytes("ISO-8859-1"),"UTF-8");
		String password = StringLibrary.md5(new String (request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
		String email = new String (request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
		if ("".equals(password)) {
			//lấy lại mật khẩu cũ
			password = userDao.getItem(uid).getPassword();
		} else {
			//cập nhật mật khẩu mới
			password = StringLibrary.md5(password);
		}
		User objUser = new User(uid, "", password, fullname, email, level);
		if (userDao.editItem(objUser) > 0){
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=editSuc");
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=editFail");
		}
	}

}
