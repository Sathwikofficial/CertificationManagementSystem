package com.project.CertificationTrackingSystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;
    
    public void sendMessage(String to, String subject, String body) {
        try {
            // Create a simple mail message
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject(subject);
            message.setText(body);

            // Send the email
            mailSender.send(message);
            System.out.println("Email sent successfully to: " + to);
        } catch (Exception e) {
            System.err.println("Error while sending email to: " + to);
            e.printStackTrace();
        }
    }
}

