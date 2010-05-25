package edu.ncsu.csc.realsearch.devsurvey;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class InitialPasswordValidator {
	private static org.apache.log4j.Logger log = org.apache.log4j.Logger
			.getLogger(InitialPasswordValidator.class);

	private class UserPass {
		@NotEmpty
		@Email
		private String user;

		@NotEmpty
		@Pattern(regexp = "[a-zA-Z0-9]+")
		private String password;

		public UserPass(String user, String password) {
			this.user = user;
			this.password = password;
		}

		public String getUser() {
			return user;
		}

		public void setUser(String user) {
			this.user = user;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
	}

	public boolean isValidUserPass(Object user, Object password) {
		boolean isValid = false;
		try {
			UserPass userPass = new UserPass((String) user, (String) password);
			Set<ConstraintViolation<UserPass>> violations = Validation.buildDefaultValidatorFactory()
					.getValidator().validate(userPass);
			for (ConstraintViolation<UserPass> cv : violations) {
				log.debug(cv.getPropertyPath() + ": " + cv.getMessage());
			}
			isValid = violations.isEmpty();
		} catch (Throwable t) {
		}
		return isValid;
	}
}
