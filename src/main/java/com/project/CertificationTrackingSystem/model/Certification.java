package com.project.CertificationTrackingSystem.model;

import java.sql.Blob;

import jakarta.persistence.*;

@Entity
public class Certification {

    @Id
    private Long certificationId;
    private String certificationName;
    private String issuedBy;
    private String issueDate;
    private String expirationDate;
    private Blob certificationFile;
    private boolean isActive = false;
    
    // Replacing userId with email
    private String email; // Email of the user associated with the certification
    
    // New field for certification description
    private String certificateDescription;

    // Getters and Setters
    public Long getCertificationId() {
        return certificationId;
    }

    public void setCertificationId(Long certificationId) {
        this.certificationId = certificationId;
    }

    public String getCertificationName() {
        return certificationName;
    }

    public void setCertificationName(String certificationName) {
        this.certificationName = certificationName;
    }

    public String getIssuedBy() {
        return issuedBy;
    }

    public void setIssuedBy(String issuedBy) {
        this.issuedBy = issuedBy;
    }

    public String getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(String issueDate) {
        this.issueDate = issueDate;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Blob getCertificationFile() {
        return certificationFile;
    }

    public void setCertificationFile(Blob certificationFile) {
        this.certificationFile = certificationFile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCertificateDescription() {
        return certificateDescription;
    }

    public void setCertificateDescription(String certificateDescription) {
        this.certificateDescription = certificateDescription;
    }
    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
