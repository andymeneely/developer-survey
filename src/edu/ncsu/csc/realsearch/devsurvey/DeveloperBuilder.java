package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DeveloperBuilder {
	public Developer from(ResultSet rs) throws SQLException {
		Developer developer = new Developer();
		developer.setName(rs.getString("Name"));
		developer.setProject(rs.getString("Project"));
		developer.setUsername(rs.getString("User"));
		return developer;
	}
}
