package lab.db;

import java.sql.*;

public class DbCon {
	final String DBDRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/paper";
	final String DBUSER = "root";
	final String DBPWD = "19940504";
	Connection conn = null;// 数据库连接

	public DbCon() {
		try {
			Class.forName(DBDRIVER);// load the Connecting class
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	// another version to initialize with new parameters but not defautl
	// parameters
	public DbCon(String dbUrl, String dbUser, String dbPwd) {
		try {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(dbUrl, dbUrl, dbPwd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public Connection getConn() {
		return conn;
	}

	public ResultSet doQuery(String sql, Object[] params) {
		ResultSet rs = null;
		conn = this.getConn();
		PreparedStatement pstmt = null;
		try {
			if (conn == null)
				System.out.println("conn is null");
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (int i = 0; i < params.length; i++) {
			try {
				pstmt.setObject(i + 1, params[i]);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public int doUpdate(String sql, Object[] params) {
		int res = 0;
		conn = this.getConn();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for (int i = 0; i < params.length; i++) {
			try {
				pstmt.setObject(i + 1, params[i]);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
