package com.project.CertificationTrackingSystem.controller;

import com.project.CertificationTrackingSystem.model.Certification;
import com.project.CertificationTrackingSystem.model.User;
import com.project.CertificationTrackingSystem.service.CertificationService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.CertificationTrackingSystem.model.Admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.List;

@Controller
public class AdminController {

	@Autowired
	private CertificationService certificationService;

	@GetMapping("/admin/home")
	public String adminHome(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Admin admin = (Admin) session.getAttribute("admin");

		if (admin != null) {
			model.addAttribute("email", admin.getEmail());
			return "adminhome";
		}
		return "redirect:/login";
	}

	@GetMapping("/admin/view_allcertifications")
	public String viewAllCertifications(Model model) {
	    // Fetch all certifications
	    List<Certification> certifications = certificationService.getAllCertifications();
	    model.addAttribute("certifications", certifications);
	    return "view_allcertifications";
	}
	
	 @GetMapping("/admin/downloadCertification")
	    public void downloadCertification(@RequestParam("certificationId") Long certificationId, HttpServletResponse response) throws Exception {
	        Certification certification = certificationService.getCertificationById(certificationId);

	        if (certification != null) {
	            Blob fileBlob = certification.getCertificationFile();
	            byte[] fileData = fileBlob.getBytes(1, (int) fileBlob.length());

	            response.setContentType("application/octet-stream");
	            response.setHeader("Content-Disposition", "attachment; filename=" + certification.getCertificationName() + ".pdf");
	            response.getOutputStream().write(fileData);
	            response.getOutputStream().flush();
	        }
	    }
	 
	 @GetMapping("/admin/edit_certification")
	    public ModelAndView editCertification(@RequestParam("certificationId") Long certificationId) {
	        ModelAndView mv = new ModelAndView("edit_certification");
	        Certification certification = certificationService.getCertificationById(certificationId);
	        mv.addObject("certification", certification);
	        return mv;
	    }

	    @PostMapping("/admin/edit_certification")
	    public String updateCertification(@ModelAttribute Certification certification, Model model) {
	        try {
	            // Ensure we don't update certificationId, certificationFile, and email
	            Certification existingCert = certificationService.getCertificationById(certification.getCertificationId());
	            existingCert.setCertificationName(certification.getCertificationName());
	            existingCert.setIssuedBy(certification.getIssuedBy());
	            existingCert.setIssueDate(certification.getIssueDate());
	            existingCert.setExpirationDate(certification.getExpirationDate());
	            existingCert.setCertificateDescription(certification.getCertificateDescription());

	            // Save the updated certification
	            certificationService.addCertification(existingCert);

	            model.addAttribute("message", "Certification updated successfully!");
	        } catch (Exception e) {
	            model.addAttribute("error", "Error updating certification: " + e.getMessage());
	        }
	        return "redirect:/admin/home";
	    }

	    @GetMapping("/admin/delete_certification")
	    public String deleteCertification(@RequestParam("certificationId") Long certificationId, Model model) {
	        try {
	            Certification certification = certificationService.getCertificationById(certificationId);
	            certificationService.deleteCertification(certification);
	            model.addAttribute("message", "Certification deleted successfully!");
	        } catch (Exception e) {
	            model.addAttribute("error", "Error deleting certification: " + e.getMessage());
	        }
	        return "redirect:/admin/home";
	    }
	    

	
	


}
