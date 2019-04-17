package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.LibraryAuth;
import model.bean.Cat;
import model.bean.User;
import model.dao.CatDao;
import model.dao.UserDao;

public class AdminEditCatCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatDao catDao = new CatDao();
	private UserDao userDao = new UserDao();
    public AdminEditCatCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		if (!"editor".equals(userDao.getItem(userInfo.getId()).getLevel())){
			request.setAttribute("alCat", catDao.getList());
			int cid = Integer.parseInt(request.getParameter("cid"));
			Cat objCat = catDao.getItem(cid);
			request.setAttribute("objCat", objCat);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editCat.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=1");
			return;
		}	
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");	
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		String tendanhmuc = request.getParameter("tendanhmuc");
		int danhmucha = Integer.parseInt(request.getParameter("danhmuccha"));
		Cat objCat = new Cat(cid, tendanhmuc, danhmucha);
		if (catDao.editItem(objCat) > 0){
			response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=editSuc");
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=editFail");
		}
	}
}
