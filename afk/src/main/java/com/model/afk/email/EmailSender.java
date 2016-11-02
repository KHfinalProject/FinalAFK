package com.model.afk.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;


public class EmailSender  {
     
    @Autowired
    protected JavaMailSender  mailSender;
 
    public int SendEmail(Email email) throws Exception {
    	 
        MimeMessage msg = mailSender.createMimeMessage();
        int result = 0;
        try {
        	System.out.println(":::::::::::::::: sender S:: " + email.getSubject());
        	System.out.println(":::::::::::::::: sender C:: " + email.getContent());
        	System.out.println(":::::::::::::::: sender R:: " + email.getReciver());
        	msg.setSubject(email.getSubject());
	        msg.setText(email.getContent());
	        msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReciver()));
	        
        }catch(MessagingException e) {
        	System.out.println("<<<<<<<<<:::::::::::MessagingException::::::::::>>>>>>>>>>>");
        	e.printStackTrace();
        	result = 0;
            return result;
        }
        try {
        	mailSender.send(msg);
        }catch(MailException e) {
        	System.out.println("<<<<<<<<<:::::::::::MailException발생::::::::::>>>>>>>>>>");
        	e.printStackTrace();
        	result = 0;
            return result;
        }
        result = 1;
        return result;
        
    }

}

