package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdsDao;
import model.dao.NewsDao;

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicIndexController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDao newsDao = new NewsDao();
		AdsDao adsDao = new AdsDao();
		request.setAttribute("alNews", newsDao.getList());
		request.setAttribute("alNewsIndex", newsDao.getTinIndex());
		request.setAttribute("alAds", adsDao.getList());
		RequestDispatcher rd = request.getRequestDispatcher("/public/index.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
