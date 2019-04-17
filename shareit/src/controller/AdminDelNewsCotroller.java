package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryAuth;
import model.bean.News;
import model.dao.NewsDao;
@MultipartConfig
public class AdminDelNewsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsDao newsDao = new NewsDao();
    public AdminDelNewsCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		int nid = Integer.parseInt(request.getParameter("nid"));
		News objNews = newsDao.getItem(nid);
		String picture = objNews.getPicture();
		newsDao.delCmtNews(nid);
		if (newsDao.delItem(nid) > 0){
			//xóa hình nếu có
			if (!"".equals(picture)) {
				String filePath = request.getServletContext().getRealPath("files") + File.separator + picture;
				File file = new File(filePath);
				file.delete();
			}
			response.sendRedirect(request.getContextPath()+"/admin/tin-tuc?msg=delSuc");
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/tin-tuc?msg=delFail");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
