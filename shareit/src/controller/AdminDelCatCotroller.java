package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.LibraryAuth;
import model.bean.News;
import model.bean.User;
import model.dao.CatDao;
import model.dao.UserDao;

public class AdminDelCatCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    public AdminDelCatCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		CatDao catDao = new CatDao();
		
		if ("admin".equals(userDao.getItem(userInfo.getId()).getLevel())){
			int cid = Integer.parseInt(request.getParameter("cid"));
			for (News objNews : catDao.getListNews(cid)) {
				catDao.delItemCmt(objNews.getId());
			}
			catDao.delItemNews(cid);
			if (catDao.delItem(cid) > 0){
				response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=delSuc");
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=delFail");
			}
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=1");
			return;
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
