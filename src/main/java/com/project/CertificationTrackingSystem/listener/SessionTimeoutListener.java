package com.project.CertificationTrackingSystem.listener;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class SessionTimeoutListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        LocalDateTime createdTime = LocalDateTime.now();  // Get the current time
        System.out.println("Session created: " + se.getSession().getId() + " at " + createdTime);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        LocalDateTime destroyedTime = LocalDateTime.now();  // Get the current time
        System.out.println("Session destroyed: " + se.getSession().getId() + " at " + destroyedTime);
    }
}
