package com.project.CertificationTrackingSystem.repository;

import com.project.CertificationTrackingSystem.model.Certification;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CertificationRepository extends JpaRepository<Certification, Long> {
    // Custom query methods if needed
	List<Certification> findByEmail(String email);
	
	
	
}
