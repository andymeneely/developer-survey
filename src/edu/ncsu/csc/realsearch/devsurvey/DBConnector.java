package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnector {
	private static DBConnector instance = null;

	public static DBConnector getInstance() {
		if (instance == null)
			instance = new DBConnector();
		return instance;
	}

	private DBConnector() {
	}
	
	public Connection getConnection() throws SQLException {
		try {
			return ((DataSource) (((Context) new InitialContext().lookup("java:comp/env")))
					.lookup("jdbc/devsurvey")).getConnection();
		} catch (NamingException e) {
			throw new SQLException(("Context Lookup Naming Exception: " + e.getMessage()));
		}
	}
}
