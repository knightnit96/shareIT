package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryAuth;
import model.dao.NewsDao;

public class AdminChangeSlideNewsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminChangeSlideNewsCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		int id = Integer.parseInt(request.getParameter("aid"));
		int slide = Integer.parseInt(request.getParameter("aslide"));
		PrintWriter out = response.getWriter();
		NewsDao newsDao = new NewsDao();
		String cmt = "";
		if (slide == 1) {
			cmt = 	"<a href=\"javascript:void(0)\" onclick=\"changeSlide("
					+ id + "," + 0 +")\">"
					+"<img src=\""+ request.getContextPath() +"/templates/admin/assets/img/disactive.png\" alt=\"Disactive\" width=\"20px\"></a>";
			newsDao.changeSlide(0, id);
		} else if (slide == 0) {
			cmt = 	"<a href=\"javascript:void(0)\" onclick=\"changeSlide("
					+ id + "," + 1 +")\">"
					+"<img src=\""+ request.getContextPath() +"/templates/admin/assets/img/active.png\" alt=\"Active\" width=\"20px\"></a>";
			newsDao.changeSlide(1, id);
		}
		out.print(cmt);
		
	}

}
