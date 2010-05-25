package edu.ncsu.csc.realsearch.devsurvey;

import java.util.List;

public class InputValidationException extends Exception {

	private final List<String> errors;

	public InputValidationException(List<String> errors) {
		this.errors = errors;
	}

	public List<String> getErrors() {
		return errors;
	}

	public static void checkAndThrow(List<String> errors) throws InputValidationException {
		if (errors != null && errors.size() > 0)
			throw new InputValidationException(errors);
	}
}
