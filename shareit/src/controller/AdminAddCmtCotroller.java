package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Cmt;
import model.dao.CmtDao;

public class AdminAddCmtCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddCmtCotroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");	
		
		CmtDao cmtDao = new CmtDao();
		String hoten = request.getParameter("ahoten");
		String email = request.getParameter("aemail");
		String website = request.getParameter("awebsite");
		String content = request.getParameter("acontent");
		int news_id = Integer.parseInt(request.getParameter("anews_id"));
		int id_cmt = Integer.parseInt(request.getParameter("aid_cmt"));
		Cmt objCmt = new Cmt(0, content, hoten, email, website, null, id_cmt, news_id, 0, "");
		cmtDao.addItem(objCmt);
	}
}
