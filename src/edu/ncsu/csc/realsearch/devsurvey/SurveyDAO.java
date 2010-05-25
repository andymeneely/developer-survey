package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SurveyDAO {

	public void saveAnswer(String username, int questionID, String answer) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnector.getInstance().getConnection();
			ps = conn.prepareStatement("INSERT INTO Survey(User, Question, Answer) VALUES (?,?,?)");
			ps.setString(1, username);
			ps.setInt(2, questionID);
			ps.setString(3, answer);
			ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
	}

}
