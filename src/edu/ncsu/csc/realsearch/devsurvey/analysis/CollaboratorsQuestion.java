package edu.ncsu.csc.realsearch.devsurvey.analysis;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class CollaboratorsQuestion {

	private final DBUtil dbUtil;

	public CollaboratorsQuestion(DBUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	public void run() throws Exception {
		System.out.println("Analyzing Question 5 (Collaborators)");
		Connection conn = dbUtil.getConnection();
		conn.createStatement().execute("DELETE FROM Question5");
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Survey WHERE Question=5");
		PreparedStatement psInsert = conn
				.prepareStatement("INSERT INTO Question5(RespondingUser,Collaborator,Project) VALUES(?,?,?)");
		ResultSet rs = ps.executeQuery();
		String respondingUser = "";
		while (rs.next()) {
			respondingUser = rs.getString("User");
			String[] answers = rs.getString("Answer").split(",");
			for (String str : answers) {
				String answer = str.trim();
				if (answer.length() > 0) {
					String collaborator = getCollaborator(conn, answer);
					if (collaborator != null) {
						String project = getProject(conn, respondingUser);
						System.out.println("(" + project + ") " + respondingUser + " --> " + collaborator);
						psInsert.setString(1, respondingUser);
						psInsert.setString(2, collaborator);
						psInsert.setString(3, project);
						psInsert.addBatch();
					}
				}
			}
		}
		psInsert.executeBatch();
		conn.close();
	}

	private String getCollaborator(Connection conn, String answer) throws Exception {
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Users WHERE INSTR(?, User)>0 ");
		ps.setString(1, answer);
		ResultSet rs = ps.executeQuery();
		try {
			rs.next();
			return rs.getString("User");
		} catch (Exception t) {
			System.err.println("Cannot find expert " + answer);
			// throw t;
			return null;
		}
	}

	private static String getProject(Connection conn, String user) throws SQLException {
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Users WHERE User=?");
		ps.setString(1, user);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getString("Project");
	}

}
