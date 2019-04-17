package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import model.bean.News;

public class NewsDao {
	LibraryConnectDb lcdb;
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public NewsDao() {
		lcdb = new LibraryConnectDb();
	}
	public int changeSlide(int is_slide, int id) {
		int result = 0;
		String sql = "UPDATE news SET is_slide = ? WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, is_slide);
			pst.setInt(2, id);		
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public int changeActive(int active, int id) {
		int result = 0;
		String sql = "UPDATE news SET active = ? WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, active);
			pst.setInt(2, id);		
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public News getItem(int nid) {
		News objNews = null;
		String sql = "SELECT n.id, n.name, preview, detail, date_create, n.created_by, picture, active, is_slide, n.cat_id, c.name as cname, view, u.fullname as fullname FROM news as n INNER JOIN cat_list as c ON n.cat_id = c.id INNER JOIN user as u ON n.created_by = u.id WHERE n.id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, nid);
			rs = pst.executeQuery();
			if (rs.next()){
				objNews = new News(rs.getInt("id"), rs.getString("name"),rs.getString("preview"), rs.getString("detail"), rs.getTimestamp("date_create"), rs.getInt("created_by"), rs.getString("picture"), rs.getInt("active"), rs.getInt("is_slide"), rs.getInt("cat_id"), rs.getString("cname"), rs.getInt("view"), rs.getString("fullname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return objNews;
	}
	public int addItem(News objNews) {
		int result = 0;
		String sql = "INSERT INTO news(name, preview, detail, picture, created_by, cat_id) VALUES (?, ?, ?, ?, ?, ?);";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objNews.getName());
			pst.setString(2, objNews.getPreview());
			pst.setString(3, objNews.getDetail());
			pst.setString(4, objNews.getPicture());
			pst.setInt(5, objNews.getCreated_by());
			pst.setInt(6, objNews.getCat_id());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public int editItem(News objNews) {
		int result = 0;
		String sql = "UPDATE news SET name = ?, preview = ?, detail = ?, picture = ?, cat_id = ? WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objNews.getName());
			pst.setString(2, objNews.getPreview());
			pst.setString(3, objNews.getDetail());
			pst.setString(4, objNews.getPicture());
			pst.setInt(5, objNews.getCat_id());
			pst.setInt(6, objNews.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public int delItem(int nid) {
		int result = 0;
		String sql = "DELETE FROM news WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, nid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public ArrayList<News> getList() {
		ArrayList<News> alNews = new ArrayList<>();
		String sql = "SELECT n.id, n.name, preview, detail, date_create, n.created_by, picture, active, is_slide, n.cat_id, c.name as cname, view, u.fullname as fullname FROM news as n INNER JOIN cat_list as c ON n.cat_id = c.id INNER JOIN user as u ON n.created_by = u.id";
		
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
	public ArrayList<News> getTinMoiNhat(){
		ArrayList<News> alNews = new ArrayList<News>();
		String sql = "SELECT n.id, n.name, preview, detail, date_create, n.created_by, picture, active, is_slide, n.cat_id, c.name as cname, view, u.fullname as fullname FROM news as n INNER JOIN cat_list as c ON n.cat_id = c.id INNER JOIN user as u ON n.created_by = u.id ORDER BY n.id DESC LIMIT 3";
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				News objNews = new News(rs.getInt("id"), rs.getString("name"),rs.getString("preview"), rs.getString("detail"), rs.getTimestamp("date_create"), rs.getInt("created_by"), rs.getString("picture"), rs.getInt("active"), rs.getInt("is_slide"), rs.getInt("cat_id"), rs.getString("cname"), rs.getInt("view"), rs.getString("fullname"));
				alNews.add(objNews);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				st.close();conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return alNews;
	}
	public ArrayList<News> getTinIndex(){
		ArrayList<News> alNews = new ArrayList<News>();
		String sql = "SELECT n.id, n.name, preview, detail, date_create, n.created_by, picture, active, is_slide, n.cat_id, c.name as cname, view, u.fullname as fullname FROM news as n INNER JOIN cat_list as c ON n.cat_id = c.id INNER JOIN user as u ON n.created_by = u.id ORDER BY n.id DESC LIMIT 6";
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				News objNews = new News(rs.getInt("id"), rs.getString("name"),rs.getString("preview"), rs.getString("detail"), rs.getTimestamp("date_create"), rs.getInt("created_by"), rs.getString("picture"), rs.getInt("active"), rs.getInt("is_slide"), rs.getInt("cat_id"), rs.getString("cname"), rs.getInt("view"), rs.getString("fullname"));
				alNews.add(objNews);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				st.close();conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return alNews;
	}
	public int countview (News objNews, int view) {
		int result = 0;
		String sql = "UPDATE news SET view = ? WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, view);
			pst.setInt(2, objNews.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
	public int delCmtNews(int nid) {
		int result = 0;
		String sql = "DELETE FROM comment WHERE news_id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, nid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return result;
	}
}
