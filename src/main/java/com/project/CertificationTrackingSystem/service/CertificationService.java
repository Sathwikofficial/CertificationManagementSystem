package com.project.CertificationTrackingSystem.service;

import com.project.CertificationTrackingSystem.model.Certification;
import com.project.CertificationTrackingSystem.model.User;
import com.project.CertificationTrackingSystem.repository.CertificationRepository;
import com.project.CertificationTrackingSystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CertificationService {

    @Autowired
    private CertificationRepository certificationRepository;

    @Autowired
    private UserRepository userRepository;

    
    public String addCertification(Certification certification) 
    {
    	
       certificationRepository.save(certification);
        return "Certificate Added Successfully";
        // Save the certification to the database
    }
    
    public List<Certification> getAllCertifications() {
        return certificationRepository.findAll();
    }

    public Certification getCertificationById(Long certificationId) {
        return certificationRepository.findById(certificationId)
                .orElseThrow(() -> new RuntimeException("Certification not found with ID: " + certificationId));
    }

    public List<Certification> getCertificationsByEmail(String email) {
        return certificationRepository.findByEmail(email);
    }
   
    public void deleteCertification(Certification certification) {
        certificationRepository.delete(certification);
    }


}
