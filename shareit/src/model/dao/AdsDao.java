package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import model.bean.Ads;

public class AdsDao {
	LibraryConnectDb lcdb;
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public AdsDao() {
		lcdb = new LibraryConnectDb();
		
	}
	public int changeSlide(int is_slide, int id) {
		int result = 0;
		String sql = "UPDATE advertisement SET is_slide = ? WHERE id = ?";
		
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
	public ArrayList<Ads> getList() {
		ArrayList<Ads> alAds = new ArrayList<>();
		String sql = "SELECT * FROM advertisement";
		
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
	public int addItem(Ads objAds) {
		int result = 0;
		String sql = "INSERT INTO advertisement(name, picture, link) VALUES (?, ?, ?);";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objAds.getName());
			pst.setString(2, objAds.getPicture());
			pst.setString(3, objAds.getLink());
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
	public Ads getItem(int aid) {
		Ads objAds = null;
		String sql = "SELECT * FROM advertisement WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, aid);
			rs = pst.executeQuery();
			if (rs.next()){
				objAds = new Ads(rs.getInt("id"), rs.getString("name"), rs.getString("picture"), rs.getString("link"), rs.getInt("is_slide"));
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
		return objAds;
	}
	public int editItem(Ads objAds) {
		int result = 0;
		String sql = "UPDATE advertisement SET name = ?, picture = ?, link = ? WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objAds.getName());
			pst.setString(2, objAds.getPicture());
			pst.setString(3, objAds.getLink());
			pst.setInt(4, objAds.getId());
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
	public int delItem(int aid) {
		int result = 0;
		String sql = "DELETE FROM advertisement WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, aid);
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
