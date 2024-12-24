package com.attendence;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class emailUtils {

    public static void sendEmail(String to, String subject, String body) {
        final String username = "fredtuyishime87@gmail.com"; // Your Gmail email
        final String password = "psag mofd pgwm nszu"; // App-specific password from Gmail

        // Gmail SMTP server settings
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Get the session object
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(username)); // This is the email the recipient will see

            // Set To: recipient email address
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // Set Subject: header field
            message.setSubject(subject);

            // Now set the actual message
            message.setText(body);

            // Send the email
            Transport.send(message);
            System.out.println("Email sent successfully to " + to);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
