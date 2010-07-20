package edu.ncsu.csc.realsearch.devsurvey.analysis;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class SecurityQuestion {

	private final DBUtil dbUtil;

	private static String[] choice = { "I work with this person frequently.", // 0
			"This person is conveniently located near me.",// 1
			"This person knows a lot about software security in general.",// 2
			"This person has worked on similar features to this one before.", // 3
			"In the past, this person has worked on parts of this project with high security risk.",// 4
			"This person is highly experienced in software engineering.",// 5
			"Someone I respect recommended this person.",// 6
			"This person is my superior."// 7
	};

	public SecurityQuestion(DBUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	public void run() throws Exception {
		System.out.println("Analyzing Question 4 (Security)");
		Connection conn = dbUtil.getConnection();
		conn.createStatement().execute("DELETE FROM Question4");
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM Survey WHERE Question=4");
		PreparedStatement psInsert = conn
				.prepareStatement("INSERT INTO Question4(RespondingUser,Project,ChoiceNum,Choice,Points) VALUES(?,?,?,?,?)");
		ResultSet rs = ps.executeQuery();
		String respondingUser = "";
		while (rs.next()) {
			respondingUser = rs.getString("User");
			String[] split = rs.getString("Answer").split("\\,");
			for (int i = 0; i < choice.length; i++) {
				int total = Integer.valueOf(split[i].replaceAll("total" + i + ":", "").trim());
				String project = getProject(conn, respondingUser);
				psInsert.setString(1, respondingUser);
				psInsert.setString(2, project);
				psInsert.setInt(3, i);
				psInsert.setString(4, choice[i]);
				psInsert.setInt(5, total);
				psInsert.addBatch();
			}
		}
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

}
