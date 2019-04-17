package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.News;
import model.dao.CmtDao;
import model.dao.NewsDao;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicDetailController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(30);
		NewsDao newsDao = new NewsDao();
		CmtDao cmtDao = new CmtDao();
		int nid = Integer.parseInt(request.getParameter("did"));
		News objNews1 = newsDao.getItem(nid);
		if (session.isNew()){
			int view = objNews1.getView() + 1;
			newsDao.countview(objNews1, view);
		}
		News objNews = newsDao.getItem(nid);
		session.setAttribute("alCmt", cmtDao.getList(nid));
		session.setAttribute("objNews", objNews);
		RequestDispatcher rd = request.getRequestDispatcher("/public/detail.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
