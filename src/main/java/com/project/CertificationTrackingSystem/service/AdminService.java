package com.project.CertificationTrackingSystem.service;

import com.project.CertificationTrackingSystem.model.Admin;
import com.project.CertificationTrackingSystem.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;

    public Admin findByEmail(String email) {
        return adminRepository.findByEmail(email);
    }
}
