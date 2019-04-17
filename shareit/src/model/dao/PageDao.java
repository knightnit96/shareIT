package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import constant.Define;
import library.LibraryConnectDb;
import model.bean.Ads;
import model.bean.Cat;
import model.bean.Cmt;
import model.bean.News;
import model.bean.User;

public class PageDao {
	LibraryConnectDb lcdb;
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public PageDao() {
		lcdb = new LibraryConnectDb();
	}
	public int countCat(){
		int result = 0;
		String sql = "SELECT COUNT(*) as sumCat FROM cat_list";
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()){
				result = rs.getInt("sumCat");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public ArrayList<Cat> getItemsPaginationCat(int offset) {
		ArrayList<Cat> alCat = new ArrayList<>();
		String sql = "SELECT * FROM cat_list ORDER BY id DESC LIMIT "+offset+","+Define.ROW_COUNT_ADMIN;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				Cat objCat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"));
				alCat.add(objCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return alCat;
	}
	public int countUser(){
		int result = 0;
		String sql = "SELECT COUNT(*) as sumUser FROM user";
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()){
				result = rs.getInt("sumUser");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public ArrayList<User> getItemsPaginationUser(int offset) {
		ArrayList<User> alUser = new ArrayList<>();
		String sql = "SELECT * FROM user ORDER BY id DESC LIMIT "+offset+","+Define.ROW_COUNT_ADMIN;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				User objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"), rs.getString("level"));
				alUser.add(objUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return alUser;
	}
	public int countAds() {
		int result = 0;
		String sql = "SELECT COUNT(*) as sumAds FROM advertisement";
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()){
				result = rs.getInt("sumAds");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public ArrayList<Ads> getItemsPaginationAds(int offset) {
		ArrayList<Ads> alAds = new ArrayList<>();
		String sql = "SELECT * FROM advertisement ORDER BY id DESC LIMIT "+offset+","+Define.ROW_COUNT_ADMIN;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				Ads objAds = new Ads(rs.getInt("id"), rs.getString("name"), rs.getString("picture"), rs.getString("link"), rs.getInt("is_slide"));
				alAds.add(objAds);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return alAds;
	}
	public int countNews() {
		int result = 0;
		String sql = "SELECT COUNT(*) as sumNews FROM news";
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()){
				result = rs.getInt("sumNews");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public ArrayList<News> getItemsPaginationNews(int offset) {
		ArrayList<News> alNews = new ArrayList<>();
		String sql = "SELECT n.id, n.name, preview, detail, date_create, n.created_by, picture, active, is_slide, n.cat_id, c.name as cname, view, u.fullname as fullname FROM news as n INNER JOIN cat_list as c ON n.cat_id = c.id INNER JOIN user as u ON n.created_by = u.id ORDER BY n.id DESC LIMIT "+offset+","+Define.ROW_COUNT_ADMIN;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				News objNews = new News(rs.getInt("id"), rs.getString("name"),rs.getString("preview"), rs.getString("detail"), rs.getTimestamp("date_create"), rs.getInt("created_by"), rs.getString("picture"), rs.getInt("active"), rs.getInt("is_slide"), rs.getInt("cat_id"), rs.getString("cname"), rs.getInt("view"), rs.getString("fullname"));
				alNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return alNews;
	}
	public int countNewsByID(int idCat) {
		int result = 0;
		String sql = "SELECT COUNT(*) as sumNews FROM news  WHERE cat_id = "+idCat;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()){
				result = rs.getInt("sumNews");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public ArrayList<News> getItemsByIDPagination(int idCat, int offset) {
		ArrayList<News> alNews = new ArrayList<>();
		String sql = "SELECT n.id, n.name, preview, detail, date_create, n.created_by, picture, active, is_slide, n.cat_id, c.name as cname, view, u.fullname as fullname FROM news as n INNER JOIN cat_list as c ON n.cat_id = c.id INNER JOIN user as u ON n.created_by = u.id WHERE n.cat_id = "+idCat+" ORDER BY n.id DESC LIMIT "+offset+","+Define.ROW_COUNT_PUBLIC;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				News objNews = new News(rs.getInt("id"), rs.getString("name"),rs.getString("preview"), rs.getString("detail"), rs.getTimestamp("date_create"), rs.getInt("created_by"), rs.getString("picture"), rs.getInt("active"), rs.getInt("is_slide"), rs.getInt("cat_id"), rs.getString("cname"), rs.getInt("view"), rs.getString("fullname"));
				alNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return alNews;
	}
	public int countCmt(){
		int result = 0;
		String sql = "SELECT COUNT(*) as sumCmt FROM comment";
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()){
				result = rs.getInt("sumCmt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public ArrayList<Cmt> getItemsPaginationCmt(int offset) {
		ArrayList<Cmt> alCmt = new ArrayList<>();
		String sql = "SELECT c.id, content, name_cmt, email_cmt, web_cmt, c.date_create, parent_id, c.news_id, c.active, n.name as nname FROM comment as c INNER JOIN news as n ON c.news_id = n.id ORDER BY c.id DESC LIMIT "+offset+","+Define.ROW_COUNT_ADMIN;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				Cmt objCmt = new Cmt(rs.getInt("id"), rs.getString("content"), rs.getString("name_cmt"), rs.getString("email_cmt"), rs.getString("web_cmt"), rs.getTimestamp("date_create"), rs.getInt("parent_id"), rs.getInt("news_id"), rs.getInt("active"), rs.getString("nname"));
				alCmt.add(objCmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return alCmt;
	}
}
