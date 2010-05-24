package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.ResourceBundle;

public class DeveloperGenerator {
	private static Random rnd = new Random();

	public List<Developer> getDevelopers(String username) throws SQLException {
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
			return fillInNames(chop(list));
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
	}

	private List<Developer> fillInNames(List<Developer> fillIn) throws SQLException {
		for (Developer dev: fillIn) {
			Developer fullDev = new IdentifyDeveloper().getDeveloper(dev.getUsername());
			dev.setName(fullDev.getName());
		}
		return fillIn;
	}

	private List<Developer> chop(List<Developer> list) {
		int choppedListSize = getListSize();
		if (list.size() < 2 || list.size() <= choppedListSize)
			return list;
		int numRemoves = list.size() - choppedListSize;
		for (int i = 0; i < numRemoves; i++) {
			int index = rnd.nextInt(list.size());
			list.remove(index);
		}
		return list;
	}

	private int getListSize() {
		int size = 10;
		try {
			ResourceBundle bundle = ResourceBundle.getBundle("devsurvey");
			size = Integer.valueOf(bundle.getString("devsurvey.listsize"));
			size = size > 2 ? size : 2;
		} catch (Throwable t) {// problem? oh well - go with default.
		}
		return size;
	}
}
