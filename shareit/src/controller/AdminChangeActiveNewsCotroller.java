package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryAuth;
import model.dao.NewsDao;

public class AdminChangeActiveNewsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminChangeActiveNewsCotroller() {
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
		int active = Integer.parseInt(request.getParameter("aactive"));
		PrintWriter out = response.getWriter();
		NewsDao newsDao = new NewsDao();
		String cmt = "";
		if (active == 1) {
			
				cmt = 	"<a href=\"javascript:void(0)\" onclick=\"changeActive("
						+ id + "," + 0 +")\">"
						+"<img src=\""+ request.getContextPath() +"/templates/admin/assets/img/disactive.png\" alt=\"Disactive\" width=\"20px\"></a>";
				newsDao.changeActive(0, id);	

		} else if (active == 0) {
			if (newsDao.getItem(id).getIs_slide() == 0) {
				cmt = 	"<a href=\"javascript:void(0)\" onclick=\"changeActive("
						+ id + "," + 1 +"), changeSlide("+ id + "," + 1 +")\">"
						+"<img src=\""+ request.getContextPath() +"/templates/admin/assets/img/active.png\" alt=\"Active\" width=\"20px\"></a>";
				newsDao.changeActive(1, id);	
				
			} else {
				cmt = 	"<a href=\"javascript:void(0)\" onclick=\"changeActive("
						+ id + "," + 1 +")\">"
						+"<img src=\""+ request.getContextPath() +"/templates/admin/assets/img/active.png\" alt=\"Active\" width=\"20px\"></a>";
				newsDao.changeActive(1, id);
			}
		}
		out.print(cmt);
		
	}

}
