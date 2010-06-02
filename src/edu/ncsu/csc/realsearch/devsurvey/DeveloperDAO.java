package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeveloperDAO {

	public List<Developer> getAllDeveloperDistances(String username) throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<Developer> list = new ArrayList<Developer>(50);
		try {
			conn = DBConnector.getInstance().getConnection();
			ps = conn.prepareStatement("SELECT * FROM AllDistances "
					+ "WHERE User1=? OR User2=? ORDER BY Distance ASC");
			ps.setString(1, username);
			ps.setString(2, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				Developer dev = new Developer();
				String user1 = rs.getString("user1");
				String user2 = rs.getString("user2");
				dev.setUsername(username.equals(user2) ? user1 : user2); // the OTHER one
				dev.setDistanceTo(rs.getDouble("distance"));
				list.add(dev);
			}
			return list;
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
	}
	
	public Developer getDeveloper(String username) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnector.getInstance().getConnection();
			ps = conn.prepareStatement("SELECT * FROM Users WHERE User=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			rs.next();
			return new DeveloperBuilder().from(rs);
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
	}

	public List<Developer> getDevelopersForProject(String projectName) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<Developer> devs = new ArrayList<Developer>(100);
		try {
			conn = DBConnector.getInstance().getConnection();
			ps = conn.prepareStatement("SELECT * FROM Users WHERE Project=? ORDER BY Name ASC");
			ps.setString(1, projectName);
			rs = ps.executeQuery();
			while (rs.next()) {
				devs.add(new DeveloperBuilder().from(rs));
			}
			return devs;
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
	}
}
