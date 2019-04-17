package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.LibraryAuth;
import model.bean.Ads;
import model.bean.User;
import model.dao.AdsDao;
import model.dao.UserDao;

@MultipartConfig
public class AdminDelAdsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    public AdminDelAdsCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		if ("admin".equals(userDao.getItem(userInfo.getId()).getLevel())){
			int aid = Integer.parseInt(request.getParameter("aid"));
			AdsDao adsDao = new AdsDao();
			Ads objAds = adsDao.getItem(aid);
			String picture = objAds.getPicture();
			if (adsDao.delItem(aid) > 0){
				//xóa hình nếu có
				if (!"".equals(picture)) {
					String filePath = request.getServletContext().getRealPath("files") + File.separator + picture;
					File file = new File(filePath);
					file.delete();
				}
				response.sendRedirect(request.getContextPath()+"/admin/ads?msg=delSuc");
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/ads?msg=delFail");
			}
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/ads?msg=1");
			return;
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
	}
}
