package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CatDao;
import model.dao.NewsDao;
import model.dao.PageDao;
import constant.Define;

public class PublicCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicCatController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDao newsDao = new NewsDao();
		CatDao catDao = new CatDao();
		PageDao pageDao = new PageDao();
		int idCat = Integer.parseInt(request.getParameter("cid"));
		request.setAttribute("alNews", newsDao.getList());
		request.setAttribute("alNewsIndex", newsDao.getTinIndex());
		int sumNews = pageDao.countNewsByID(idCat);
		int sumPage = (int) Math.ceil((float)sumNews/Define.ROW_COUNT_PUBLIC);
		int current_page = 1;
		
		if (request.getParameter("page") != null) {
			current_page = Integer.parseInt(request.getParameter("page"));
		}
		int offset = (current_page - 1)*Define.ROW_COUNT_PUBLIC;
		request.setAttribute("objCat", catDao.getItem(idCat));
		request.setAttribute("sumPage", sumPage);
		request.setAttribute("current_page", current_page);
		request.setAttribute("listNews", pageDao.getItemsByIDPagination(idCat, offset));
		RequestDispatcher rd = request.getRequestDispatcher("/public/cat.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
