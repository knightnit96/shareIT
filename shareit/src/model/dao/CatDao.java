package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import model.bean.Cat;
import model.bean.News;

public class CatDao {
	LibraryConnectDb lcdb;
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public CatDao() {
		lcdb = new LibraryConnectDb();
		
	}
	public ArrayList<Cat> getList() {
		ArrayList<Cat> alCat = new ArrayList<>();
		String sql = "SELECT * FROM cat_list ORDER BY id ASC, parent_id ASC";
		
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
	public int addItem(Cat objCat) {
		int result = 0;
		String sql = "INSERT INTO cat_list(name, parent_id) VALUES (?, ?);";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objCat.getName());
			pst.setInt(2, objCat.getParent_id());
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
	public Cat getItem(int cid) {
		Cat objCat = null;
		String sql = "SELECT * FROM cat_list WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			rs = pst.executeQuery();
			if (rs.next()){
				objCat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"));
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
		return objCat;
	}
	public int editItem(Cat objCat) {
		int result = 0;
		String sql = "UPDATE cat_list SET name = ?, parent_id = ?  WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objCat.getName());
			pst.setInt(2, objCat.getParent_id());
			pst.setInt(3, objCat.getId());
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
	public int delItem(int cid) {
		int result = 0;
		String sql = "DELETE FROM cat_list WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
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
	public ArrayList<News> getListNews(int cid) {
		ArrayList<News> alNews = new ArrayList<>();
		String sql = "SELECT n.id FROM cat_list as c INNER JOIN news as n ON c.id = n.cat_id WHERE news_id = "+cid;
		
		conn = lcdb.getConnectMySql();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()){
				News objNews = new News(rs.getInt("id"), null, null, null, null, 0, null, 0, 0, 0, null, 0, null);
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
	public int delItemCmt(int id) {
		int result = 0;
		String sql = "DELETE FROM comment WHERE news_id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
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
	public int delItemNews(int cid) {
		int result = 0;
		String sql = "DELETE FROM news WHERE cat_id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
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
