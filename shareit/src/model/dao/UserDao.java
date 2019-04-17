package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import model.bean.User;

public class UserDao {
	LibraryConnectDb lcdb;
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	public UserDao() {
		lcdb = new LibraryConnectDb();
		
	}
	public ArrayList<User> getList() {
		ArrayList<User> alUser = new ArrayList<>();
		String sql = "SELECT * FROM user";
		
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
	public User getUserLogin(User objUser) {
		User objUserResult = null;
		String sql = "SELECT * FROM user WHERE username = ? && password = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objUser.getUsername());
			pst.setString(2, objUser.getPassword());
			rs = pst.executeQuery();
			if (rs.next()){
				objUserResult = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"), rs.getString("level"));
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
		return objUserResult;
	}
	public int addItem(User objUser) {
		int result = 0;
		String sql = "INSERT INTO user(username, password, fullname, email, level) VALUES (?, ?, ?, ?, ?);";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objUser.getUsername());
			pst.setString(2, objUser.getPassword());
			pst.setString(3, objUser.getFullname());
			pst.setString(4, objUser.getEmail());
			pst.setString(5, objUser.getLevel());
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
	public User getItem(int uid) {
		User objUser = null;
		String sql = "SELECT * FROM user WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
			rs = pst.executeQuery();
			if (rs.next()){
				objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"), rs.getString("level"));
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
		return objUser;
	}
	public int editItem(User objUser) {
		int result = 0;
		String sql = "UPDATE user SET password = ?, fullname = ?, email = ?, level = ? WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objUser.getPassword());
			pst.setString(2, objUser.getFullname());
			pst.setString(3, objUser.getEmail());
			pst.setString(4, objUser.getLevel());
			pst.setInt(5, objUser.getId());
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
	public int delItem(int uid) {
		int result = 0;
		String sql = "DELETE FROM user WHERE id = ?";
		
		conn = lcdb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
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
	public User checkUser(String username) {
		conn = lcdb.getConnectMySql();
		User objUser = null;
		String sql = "SELECT * FROM user WHERE username = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if (rs.next()){
				objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"), rs.getString("level"));
			}
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
		return objUser;
	}
}
