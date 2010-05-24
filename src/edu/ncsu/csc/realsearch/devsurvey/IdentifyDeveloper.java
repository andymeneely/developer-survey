package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IdentifyDeveloper {

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
}
