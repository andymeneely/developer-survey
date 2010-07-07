package edu.ncsu.csc.realsearch.devsurvey.email;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Properties;
import java.util.Scanner;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.PropertyConfigurator;

public class SendEmail {
	private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(SendEmail.class);
	public static final String SUBJECT = "Wireshark developers needed for NCSU research project";

	public static void main(String[] args) throws Exception {
		Properties props = new Properties();
		PropertyConfigurator.configure(SendEmail.class.getResource("/log4j.properties"));
		props.load(new FileReader(new File("emaildata/email.properties")));

		String smtpPassword = getSMTPPassword();
		SMTPAuthenticator authenticator = new SMTPAuthenticator(props.getProperty("email.fromUser"),
				smtpPassword);
		Session mailSession = Session.getInstance(props, authenticator);
		mailSession.setDebug(true);
		Transport transport = mailSession.getTransport();
		transport.connect(props.getProperty("mail.smtps.host"),
				Integer.valueOf(props.getProperty("email.port")), props.getProperty("email.fromUser"),
				smtpPassword);

		Scanner scanner = new Scanner(new File(props.getProperty("email.listFile")));
		while (scanner.hasNextLine()) {
			String[] line = scanner.nextLine().split("\t");
			String email = line[0];
			String password = line[1];

			MimeMessage message = new MimeMessage(mailSession);
			message.addFrom(new Address[] { new InternetAddress("\"Andy Meneely\" <apmeneel@ncsu.edu>") });
			message.setSubject(SUBJECT);
			message.setContent(getContent(email, password), "text/plain");

			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			log.info("Email sent to " + email + " (" + password + ")");
		}
		transport.close();
		scanner.close();
		log.info("Done.");
	}

	private static class SMTPAuthenticator extends javax.mail.Authenticator {
		private final String user;
		private final String password;

		public SMTPAuthenticator(String user, String password) {
			this.user = user;
			this.password = password;
		}

		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(user, password);
		}
	}

	private static String getSMTPPassword() {
		System.out.print("Input NCSU account password: ");
		Scanner scanner = new Scanner(System.in);
		return scanner.nextLine();
	}

	private static String getContent(String email, String password) throws FileNotFoundException {
		String content = "";
		Scanner scanner = new Scanner(new File("emaildata/emailtemplate.txt"));
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();
			line = line.replaceAll("\\{email\\}", email);
			line = line.replaceAll("\\{password\\}", password);
			content += line + "\r\n";
		}
		scanner.close();
		return content;
	}
}
