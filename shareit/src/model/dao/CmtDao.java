package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import model.bean.Cmt;

public class CmtDao {
	LibraryConnectDb lcdb;
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public CmtDao() {
		lcdb = new LibraryConnectDb();
		
	}
	public int changeActive(int active, int id) {
		int result = 0;
		String sql = "UPDATE comment SET active = ? WHERE id = ?";
		
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
	public int delItem(int cmtid) {
		int result = 0;
		String sql = "DELETE FROM comment WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cmtid);
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
	public ArrayList<Cmt> getList(int nid) {
		ArrayList<Cmt> alCmt = new ArrayList<>();
		String sql = "SELECT c.id, content, name_cmt, email_cmt, web_cmt, c.date_create, parent_id, c.news_id, c.active, n.name as nname FROM comment as c INNER JOIN news as n ON c.news_id = n.id WHERE c.news_id = "+ nid +" ORDER BY c.id DESC, parent_id DESC";
		
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
	public int addItem(Cmt objCmt) {
		int result = 0;
		String sql = "INSERT INTO comment(content, name_cmt, email_cmt, web_cmt, parent_id, news_id) VALUES (?, ?, ?, ?, ?, ?);";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objCmt.getContent());
			pst.setString(2, objCmt.getName_cmt());
			pst.setString(3, objCmt.getEmail_cmt());
			pst.setString(4, objCmt.getWeb_cmt());
			pst.setInt(5, objCmt.getParent_id());
			pst.setInt(6, objCmt.getNews_id());
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
