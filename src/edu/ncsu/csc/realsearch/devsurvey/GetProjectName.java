package edu.ncsu.csc.realsearch.devsurvey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class GetProjectName {
	public static String fromSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			Object attribute = session.getAttribute("thisProject");
			if (attribute != null) {
				return attribute.toString();
			} else {
				String thisProject = "this project";
				try {
					String projectName = new DeveloperDAO()
							.getDeveloper(request.getUserPrincipal().getName()).getProject();
					thisProject = "the " + projectName + " project";
					session.setAttribute("thisProject", thisProject);
				} catch (Throwable t) {
					thisProject = "this project";
				}
				return thisProject;
			}
		} catch (Throwable t) {
			return "this project";
		}
	}
}
