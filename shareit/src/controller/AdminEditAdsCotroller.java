package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import library.LibraryAuth;
import library.LibraryFile;
import model.bean.Ads;
import model.bean.User;
import model.dao.AdsDao;
import model.dao.UserDao;

@MultipartConfig
public class AdminEditAdsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    public AdminEditAdsCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		int aid = Integer.parseInt(request.getParameter("aid"));
		if ("admin".equals(userDao.getItem(userInfo.getId()).getLevel())){
			AdsDao adsDao = new AdsDao();
			Ads objAds = adsDao.getItem(aid);
			request.setAttribute("objAds", objAds);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editAds.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/ads?msg=1");
			return;
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");		
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		int aid = Integer.parseInt(request.getParameter("aid"));
		String tenquangcao = request.getParameter("tenquangcao");
		String link = request.getParameter("link");
		AdsDao adsDao = new AdsDao();
		
		//xử lí hình ảnh
		String picture = "";
		//file 
		final String path = request.getServletContext().getRealPath("files");
		System.out.println(path);
		File dirFile = new File(path);
		if(!dirFile.exists()){
			dirFile.mkdir();
		}

		final Part filePart = request.getPart("hinhanh");
		final String fileName =  LibraryFile.getName(filePart);
		
		if (request.getParameter("delete_picture") != null) {
			if(!"".equals(fileName)){ // có chọn ảnh
				if (!"".equals(adsDao.getItem(aid).getPicture())) {
					//xóa hình ảnh cũ
					String filePath = path + File.separator + adsDao.getItem(aid).getPicture();
					File file = new File(filePath);
					file.delete();
				}
				OutputStream out = null;
				InputStream filecontent = null;
				picture = LibraryFile.rename(fileName) ;
				System.out.println(picture);
				try {
					out = new FileOutputStream(new File(path + File.separator + picture));
					filecontent = filePart.getInputStream();

					int read = 0;
					final byte[] bytes = new byte[1024];

					while ((read = filecontent.read(bytes)) != -1) {
						out.write(bytes, 0, read);
					}
				} catch (FileNotFoundException fne) {
					fne.printStackTrace();
				} finally {
					if (out != null) {
						out.close();
					}
					if (filecontent != null) {
						filecontent.close();
					}
				}
			} else {
				if (!"".equals(adsDao.getItem(aid).getPicture())) {
					//xóa hình ảnh cũ
					String filePath = path + File.separator + adsDao.getItem(aid).getPicture();
					File file = new File(filePath);
					file.delete();
				}
			}
		} else if (request.getParameter("delete_picture") == null) {
			if(!"".equals(fileName)){ // có chọn ảnh
				if (!"".equals(adsDao.getItem(aid).getPicture())) {
					//xóa hình ảnh cũ
					String filePath = path + File.separator + adsDao.getItem(aid).getPicture();
					File file = new File(filePath);
					file.delete();
				}
				OutputStream out = null;
				InputStream filecontent = null;
				picture = LibraryFile.rename(fileName) ;
				System.out.println(picture);
				try {
					out = new FileOutputStream(new File(path + File.separator + picture));
					filecontent = filePart.getInputStream();

					int read = 0;
					final byte[] bytes = new byte[1024];

					while ((read = filecontent.read(bytes)) != -1) {
						out.write(bytes, 0, read);
					}
				} catch (FileNotFoundException fne) {
					fne.printStackTrace();
				} finally {
					if (out != null) {
						out.close();
					}
					if (filecontent != null) {
						filecontent.close();
					}
				}
			} else {
				//lấy lại hình ảnh cũ
				picture = adsDao.getItem(aid).getPicture();	
			}
		}
		
		Ads objAds = new Ads(aid, tenquangcao, picture, link, 0);
		if (adsDao.editItem(objAds) > 0){
			response.sendRedirect(request.getContextPath()+"/admin/ads?msg=editSuc");
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/ads?msg=eidtFail");
		}
	}
}
