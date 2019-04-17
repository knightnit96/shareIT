package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.LibraryAuth;
import model.bean.User;
import model.dao.UserDao;

public class AdminDelUserCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    public AdminDelUserCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		int uid = Integer.parseInt(request.getParameter("uid"));
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		User objUser = userDao.getItem(uid);
		if ("admin".equals(objUser.getLevel())) {
			//không cho xóa
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=delAdmin");
		} else {
			if ("admin".equals(userInfo.getLevel())){
				if (userDao.delItem(uid) > 0){
					response.sendRedirect(request.getContextPath()+"/admin/user?msg=delSuc");
					return;
				} else {
					response.sendRedirect(request.getContextPath()+"/admin/user?msg=delFail");
					return;
				}
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/user?msg=1");
				return;
			}
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	}

}
