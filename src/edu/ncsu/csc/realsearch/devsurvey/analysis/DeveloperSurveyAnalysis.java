package edu.ncsu.csc.realsearch.devsurvey.analysis;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DeveloperSurveyAnalysis {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		DBUtil dbUtil = new DBUtil("root", "root", "jdbc:mysql://localhost/developersurvey");
		question3(dbUtil);
		question4(dbUtil);
		question6(dbUtil);
		System.out.println("Done.");
	}

	private static void question6(DBUtil dbUtil) throws Exception {
		new ExpertsQuestion(dbUtil).run();
	}

	private static void question4(DBUtil dbUtil) throws Exception {
		new SecurityQuestion(dbUtil).run();
	}

	private static void question3(DBUtil dbUtil) throws SQLException {
		Connection conn = dbUtil.getConnection();
		conn.createStatement().execute("DELETE FROM Question3");
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Survey WHERE Question=3");
		PreparedStatement psInsert = conn
				.prepareStatement("INSERT INTO Question3(RespondingUser,OtherUser,PerceivedDistance,WeightedDNDistance,Project) VALUES (?,?,?,?,?)");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			String respondingUser = rs.getString("User");
			String[] answer = splitAnswer(rs.getString("Answer"));
			String otherUser = "";
			Integer perceivedDistance = null;
			for (String string : answer) {
				try {
					perceivedDistance = Integer.valueOf(string);
					// Ok, looks good - let's add it to the database
					respondingUser = respondingUser.trim();
					otherUser = otherUser.trim();
					String project = getProject(conn, respondingUser);
					double weightedDNDistance = getWeightedDNDistance(conn, respondingUser, otherUser);
					// System.out.println(respondingUser + " --" + perceivedDistance + "(" +
					// weightedDNDistance
					// + ")--> " + otherUser);
					psInsert.setString(1, respondingUser);
					psInsert.setString(2, otherUser);
					psInsert.setDouble(3, perceivedDistance);
					psInsert.setDouble(4, weightedDNDistance);
					psInsert.setString(5, project);
					psInsert.addBatch();
					perceivedDistance = 0;
					otherUser = "";
				} catch (NumberFormatException e) { // if not a number - append the name
					if (otherUser.length() > 0)
						otherUser += "-";
					otherUser += string;

				}
			}
			// for(int i=0;i<answer.length/2)
		}
		System.out.println("Executing batch insert...");
		psInsert.executeBatch();
		conn.close();
	}

	private static String getProject(Connection conn, String user) throws SQLException {
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Users WHERE User=?");
		ps.setString(1, user);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getString("Project");
	}

	private static double getWeightedDNDistance(Connection conn, String respondingUser, String otherUser)
			throws SQLException {
		PreparedStatement ps = conn
				.prepareStatement("SELECT * FROM AllDistances WHERE (User1=? AND User2=?) OR (User2=? AND User1=?)");
		ps.setString(1, respondingUser);
		ps.setString(2, otherUser);
		ps.setString(3, respondingUser);
		ps.setString(4, otherUser);
		ResultSet rs = ps.executeQuery();
		rs.next();
		double weightedDistance = rs.getDouble("Distance");
		if (Math.abs(weightedDistance - 100.0) < 1.0) {
			weightedDistance = 10000.0;
		}
		return weightedDistance;
	}

	private static String[] splitAnswer(String answer) {
		String[] split = answer.split("[\\-|\\,]");
		// for (String string : split) {
		// System.out.println("Token: " + string);
		// }
		return split;
	}
}
