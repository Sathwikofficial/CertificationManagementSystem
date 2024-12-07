package com.project.CertificationTrackingSystem.repository;

import com.project.CertificationTrackingSystem.model.Certification;
import com.project.CertificationTrackingSystem.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    User findByPhoneNumber(String phoneNumber); 
    
    
    
}
