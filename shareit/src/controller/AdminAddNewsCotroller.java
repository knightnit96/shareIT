package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import library.LibraryAuth;
import library.LibraryFile;
import model.bean.News;
import model.bean.User;
import model.dao.CatDao;
import model.dao.NewsDao;
@MultipartConfig
public class AdminAddNewsCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatDao catDao = new CatDao();
	private NewsDao newsDao = new NewsDao();
    public AdminAddNewsCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		request.setAttribute("alCat", catDao.getList());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/addNews.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		//kiểm tra đã đăng nhập chưa
		if (LibraryAuth.checkLogin(request, response) == false){
			return;
		}
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("sobjUser");
		
		String name = request.getParameter("tenbaiviet");
		int cat_id = Integer.parseInt(request.getParameter("danhmuc"));
		System.out.println(cat_id);
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		int created_by = userInfo.getId();
		
		//xử lí hình ảnh
		String picture = "";
		//file 
		final String path = request.getServletContext().getRealPath("files");
		System.out.println(path);
		File dirFile = new File(path);
		if(!dirFile.exists()){
			dirFile.mkdir();
		}

		final Part filePart = request.getPart("picture");
		final String fileName =  LibraryFile.getName(filePart);

		if(!"".equals(fileName)){ // có chọn ảnh
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
		}
		
		News objNews = new News(0, name, preview, detail, null, created_by, picture, 0, 0, cat_id, "", 0, "");
		if (newsDao.addItem(objNews) > 0){
			response.sendRedirect(request.getContextPath()+"/admin/tin-tuc?msg=addSuc");
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/tin-tuc?msg=addFail");
		}
	}

}
