package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.LibraryAuth;
import model.bean.User;
import model.dao.CmtDao;
import model.dao.UserDao;

public class AdminDelCmtCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    public AdminDelCmtCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		CmtDao cmtDao = new CmtDao();
		if ("admin".equals(userDao.getItem(userInfo.getId()).getLevel())){
			int cmtid = Integer.parseInt(request.getParameter("cmtid"));
			if (cmtDao.delItem(cmtid) > 0){
				response.sendRedirect(request.getContextPath()+"/admin/comment?msg=delSuc");
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/comment?msg=delFail");
			}
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/comment?msg=1");
			return;
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
