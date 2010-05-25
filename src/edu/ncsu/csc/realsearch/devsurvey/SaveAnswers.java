package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class SaveAnswers {
	private final String username;

	public SaveAnswers(String username) {
		this.username = username;
	}

	public List<String> saveTasks(HttpServletRequest req) throws InputValidationException, SQLException {
		String[] values = req.getParameterValues("roles");
		String answer = "";
		List<String> errors = new ArrayList<String>();
		for (String value : values) {
			try {
				ProjectTasks task = ProjectTasks.valueOf(value);
				answer += task.name() + ", ";
			} catch (Throwable t) {
				// ignore anything wrong here...
			}
		}
		new SurveyDAO().saveAnswer(username, 1, answer);
		return errors;
	}

	public List<String> saveNumMembers(String input) {
		List<String> errors = new ArrayList<String>();
		try {
			Integer numMembers = Integer.valueOf(input);
			if (numMembers < 0)
				errors.add("You cannot have a negative number of team members, that would be silly.");
			new SurveyDAO().saveAnswer(username, 2, numMembers + "");
		} catch (Throwable t) {
			errors.add("Please enter a valid integer for the number of teammates.");
		}
		return errors;
	}
}
