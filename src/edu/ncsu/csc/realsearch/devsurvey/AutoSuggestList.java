package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.SQLException;
import java.util.List;

public class AutoSuggestList {

	public String getAllTeammatesArray(String username) throws SQLException {
		String javascriptArray = "[";
		Developer thisDev = new DeveloperDAO().getDeveloper(username);
		List<Developer> devs = new DeveloperDAO().getDevelopersForProject(thisDev.getProject());
		for (Developer dev : devs) {
			if (!thisDev.getUsername().equals(dev.getUsername())) {
				javascriptArray += "'" + dev.getName() + " - " + dev.getUsername() + "',";
			}
		}
		return javascriptArray.substring(0, javascriptArray.length() - 1) + "]";
	}

}
