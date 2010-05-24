package edu.ncsu.csc.realsearch.devsurvey;

public enum ProjectTasks {
	Development("Writing code."), Testing("Write and/or execute tests."), Design("Design"), Management(
			"Project management"), Inspection("Code inspection."), FixBugs("Fix defects.");

	private final String description;

	private ProjectTasks(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
}
