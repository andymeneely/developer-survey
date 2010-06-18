package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class AutoSuggestList {

	private Developer thisDev;
	private List<Developer> devs;

	public AutoSuggestList(String username) throws SQLException {
		thisDev = new DeveloperDAO().getDeveloper(username);
		devs = new DeveloperDAO().getDevelopersForProject(thisDev.getProject());
	}

	public List<String> getAllTeammates() {
		List<String> list = new LinkedList<String>();
		for (Developer dev : devs) {
			list.add(dev.getName() + " - " + dev.getUsername());
		}
		return list ;
	}

	public String getAllTeammatesArray() throws SQLException {
		String javascriptArray = "[";
		for (Developer dev : devs) {
			if (!thisDev.getUsername().equals(dev.getUsername())) {
				javascriptArray += "'" + dev.getName() + " - " + dev.getUsername() + "',";
			}
		}
		return javascriptArray.substring(0, javascriptArray.length() - 1) + "]";
	}

}
