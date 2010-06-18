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

public class SendEmail {

	public static final String SUBJECT = "Wireshark developers needed for NCSU research project";

	public static void main(String[] args) throws Exception {
		Properties props = new Properties();
		props.load(new FileReader(new File("emaildata/email.properties")));

		String password = getPassword();
		SMTPAuthenticator authenticator = new SMTPAuthenticator(props.getProperty("email.fromUser"), password);
		Session mailSession = Session.getInstance(props, authenticator);
		mailSession.setDebug(true);
		Transport transport = mailSession.getTransport();

		MimeMessage message = new MimeMessage(mailSession);
		message.addFrom(new Address[] { new InternetAddress("\"Andy Meneely\" <apmeneel@ncsu.edu>") });
		message.setSubject(SUBJECT);
		message.setContent(getContent(), "text/plain");

		message.addRecipient(Message.RecipientType.TO, new InternetAddress("ameneely@ara.com"));

		transport.connect(props.getProperty("mail.smtps.host"), Integer.valueOf(props
				.getProperty("email.port")), props.getProperty("email.fromUser"), password);

		transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
		transport.close();

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

	private static String getPassword() {
		System.out.print("Input NCSU account password: ");
		Scanner scanner = new Scanner(System.in);
		return scanner.nextLine();
	}

	private static String getContent() throws FileNotFoundException {
		String content = "";
		Scanner scanner = new Scanner(new File("emaildata/emailtemplate.txt"));
		while(scanner.hasNextLine()){
			String line = scanner.nextLine();
			line = line.replaceAll("\\{email\\}", "ameneely@ara.com");
			line = line.replaceAll("\\{password\\}", "abc123");
			content += line + "\r\n";
		}
		scanner.close();
		return content;
	}
}
