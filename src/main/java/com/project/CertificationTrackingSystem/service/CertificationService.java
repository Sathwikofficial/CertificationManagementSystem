package com.project.CertificationTrackingSystem.service;

import com.project.CertificationTrackingSystem.model.Certification;
import com.project.CertificationTrackingSystem.model.User;
import com.project.CertificationTrackingSystem.repository.CertificationRepository;
import com.project.CertificationTrackingSystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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
    
    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public List<Certification> getCertificationsExpiringSoon(String email) {
        List<Certification> certifications = certificationRepository.findByEmail(email);
        
        return certifications.stream()
                .filter(cert -> {
                    try {
                        Date expirationDate = dateFormat.parse(cert.getExpirationDate());
                        Date today = new Date();
                        long differenceInMilliSeconds = expirationDate.getTime() - today.getTime();
                        long differenceInDays = differenceInMilliSeconds / (1000 * 60 * 60 * 24);
                        return differenceInDays <= 30 && differenceInDays >= 0;
                    } catch (ParseException e) {
                        e.printStackTrace();
                        return false;
                    }
                })
                .collect(Collectors.toList());
    }
    
    public List<Certification> getAllCertificationsExpiringSoon() {
        List<Certification> certifications = certificationRepository.findAll(); // Fetch all certifications
        
        return certifications.stream()
                .filter(cert -> {
                    try {
                        Date expirationDate = dateFormat.parse(cert.getExpirationDate());
                        Date today = new Date();
                        long differenceInMilliSeconds = expirationDate.getTime() - today.getTime();
                        long differenceInDays = differenceInMilliSeconds / (1000 * 60 * 60 * 24);
                        return differenceInDays <= 30 && differenceInDays >= 0;
                    } catch (ParseException e) {
                        e.printStackTrace();
                        return false;
                    }
                })
                .collect(Collectors.toList());
    }



}
