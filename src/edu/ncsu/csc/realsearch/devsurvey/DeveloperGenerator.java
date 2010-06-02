package edu.ncsu.csc.realsearch.devsurvey;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class DeveloperGenerator {
	private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DeveloperGenerator.class);
	private int choppedListSize;
	private DeveloperDAO devDAO;

	public DeveloperGenerator() {
		choppedListSize = getListSize();
		devDAO = new DeveloperDAO();
	}

	public DeveloperGenerator(int finalListSize, DeveloperDAO devDAO) {
		this.choppedListSize = finalListSize;
		this.devDAO = devDAO;
	}

	public List<Developer> getDevelopers(String username) throws SQLException {
		List<Developer> list = devDAO.getAllDeveloperDistances(username);
		return fillInNames(chop(list));
	}

	private List<Developer> fillInNames(List<Developer> fillIn) throws SQLException {
		for (Developer dev : fillIn) {
			Developer fullDev = devDAO.getDeveloper(dev.getUsername());
			dev.setName(fullDev.getName());
		}
		return fillIn;
	}

	private List<Developer> chop(List<Developer> list) {
		if (list.size() < 2 || list.size() <= choppedListSize){
			log.debug("Going with the whole list.");
			return list;
		}

		List<Developer> choppedList = new ArrayList<Developer>(choppedListSize);
		choppedList.add(list.get(0));
		double chunk = list.size() / (choppedListSize - 1);
		for (int i = 1; i <= choppedListSize - 2; i++) {
			choppedList.add(list.get((int) (chunk * i)));
		}
		choppedList.add(list.get(list.size() - 1));
		return choppedList;
	}

	private int getListSize() {
		int size = 10;
		try {
			ResourceBundle bundle = ResourceBundle.getBundle("devsurvey");
			size = Integer.valueOf(bundle.getString("devsurvey.listsize"));
			size = size > 2 ? size : 2;
		} catch (Throwable t) {// problem? oh well - go with default.
		}
		log.info("Number of developers shown: " + size);
		return size;
	}
}
