package com.project.CertificationTrackingSystem.repository;

import com.project.CertificationTrackingSystem.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin, Long> {
    Admin findByEmail(String email);
}
