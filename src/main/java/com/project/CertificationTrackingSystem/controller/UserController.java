package com.project.CertificationTrackingSystem.controller;

import com.project.CertificationTrackingSystem.model.User;
import java.util.List;

import com.project.CertificationTrackingSystem.model.Admin;
import com.project.CertificationTrackingSystem.model.Certification;
import com.project.CertificationTrackingSystem.service.UserService;
import com.project.CertificationTrackingSystem.service.AdminService;
import com.project.CertificationTrackingSystem.service.CertificationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class UserController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private CertificationService certificationService;

    @Autowired
    private AdminService adminService;

    @GetMapping("/signup")
    public String showSignupForm(HttpServletRequest request, Model model) {
        // Remove the session checking logic
        model.addAttribute("user", new User());
        return "signup";
    }

    @PostMapping("/signup")
    public String registerUser(@ModelAttribute User user, Model model) {
        try {
            userService.registerUser(user);
            model.addAttribute("successMessage", "Registration successful! Please log in.");
            model.addAttribute("user", new User()); // Reset the user object
        } catch (ResponseStatusException e) {
            model.addAttribute("errorMessage", e.getReason());
            return "signup";
        }
        return "signup";
    }

    @GetMapping("/user/home")
    public String userHome(HttpServletRequest request, Model model) {
        // The session management is now handled by JSP and Spring Security
        // No need for manual session validation here
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            return "redirect:/login"; // Redirect to login if session is invalid
        }

        User user = (User) session.getAttribute("user");
        model.addAttribute("email", user.getEmail());
        return "userhome";
    }

    @GetMapping("/login")
    public String showLoginForm(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);

        if (session != null) {
            User user = (User) session.getAttribute("user");
            Admin admin = (Admin) session.getAttribute("admin");

            if (user != null) {
                return "redirect:/user/home";
            } else if (admin != null) {
                return "redirect:/admin/home";
            }
        }

        return "login";
    }

    @PostMapping("/login")
    public String login(String email, String password, String role, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        if ("admin".equalsIgnoreCase(role)) {
            Admin admin = adminService.findByEmail(email);
            if (admin != null && admin.getPassword().equals(password)) {
                session.setAttribute("admin", admin);
                return "redirect:/admin/home";
            }
        } else {
            User user = userService.findByEmail(email);
            if (user != null && user.getPassword().equals(password)) {
                session.setAttribute("user", user);
                return "redirect:/user/home";
            }
        }

        model.addAttribute("error", "Invalid email or password.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }
    
    @GetMapping("/user/add_certification")
    public ModelAndView addcertification(@RequestParam("email") String email) {
    	    ModelAndView mv = new ModelAndView("add_certification");
    	    mv.addObject("email", email);
    	    return mv;
    	  }// This will load the add_certification.jsp form

	
	// Handle form submission to add certification
	@PostMapping("/user/add_certification")
	 public ModelAndView insertCertification(HttpServletRequest request, @RequestParam("file") MultipartFile file, HttpSession session) throws Exception {
	      String msg = null;

	      ModelAndView mv = new ModelAndView();

	      try {
	          // Generate random certification ID
	          long certificationId = (long)(Math.random() * 100000);

	          String certificationname = request.getParameter("certificationName");
	          String issuedBy = request.getParameter("issuedBy");
	          String issuedate = request.getParameter("issueDate");
	          String expirydate = request.getParameter("expirationDate");
	          String email = request.getParameter("email");
	          String certificateDescription = request.getParameter("certificateDescription");

	          byte[] bytes = file.getBytes();
	          Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);


	          // Create the Certification object
	          Certification cert = new Certification();
	          cert.setCertificationId(certificationId);
	          cert.setCertificationName(certificationname);
	          cert.setIssuedBy(issuedBy);
	          cert.setIssueDate(issuedate);
	          cert.setExpirationDate(expirydate);
	          cert.setEmail(email);
	          cert.setCertificateDescription(certificateDescription);
	          cert.setCertificationFile(blob);
	          

	          // Add certification to the database
	          msg = certificationService.addCertification(cert);
	          System.out.println(msg);

	          mv.setViewName("addcertificationsuccess");
	          mv.addObject("message", msg);
	      } 
	      catch(Exception e) {
	          msg = e.getMessage();
	          System.out.println(msg);
	          mv.setViewName("certificationerror");
	          mv.addObject("message", msg);
	      }
	      return mv;
	  }
	
	 @GetMapping("/user/view_mycertifications")
	    public String viewMyCertifications(HttpServletRequest request, Model model) {
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user") == null) {
	            return "redirect:/login";
	        }

	        User user = (User) session.getAttribute("user");
	        String email = user.getEmail();
	        
	        // Fetch certifications based on the email
	        List<Certification> certifications = certificationService.getCertificationsByEmail(email);
	        model.addAttribute("certifications", certifications);
	        return "view_mycertifications";
	    }

	    @GetMapping("/user/downloadCertification")
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
	
	    @GetMapping("/user/edit_certification")
	    public ModelAndView editCertification(@RequestParam("certificationId") Long certificationId) {
	        ModelAndView mv = new ModelAndView("edit_certification");
	        Certification certification = certificationService.getCertificationById(certificationId);
	        mv.addObject("certification", certification);
	        return mv;
	    }

	    @PostMapping("/user/edit_certification")
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
	        return "redirect:/user/home";
	    }

	    @GetMapping("/user/delete_certification")
	    public String deleteCertification(@RequestParam("certificationId") Long certificationId, Model model) {
	        try {
	            Certification certification = certificationService.getCertificationById(certificationId);
	            certificationService.deleteCertification(certification);
	            model.addAttribute("message", "Certification deleted successfully!");
	        } catch (Exception e) {
	            model.addAttribute("error", "Error deleting certification: " + e.getMessage());
	        }
	        return "redirect:/user/home";
	    }
	    
	    
	    @GetMapping("/user/monitor_myrenewals")
	    public String viewMyRenewals(HttpServletRequest request, Model model) {
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user") == null) {
	            return "redirect:/login";
	        }

	        User user = (User) session.getAttribute("user");
	        String email = user.getEmail();
	        
	        // Fetch certifications based on the email
	        List<Certification> certifications = certificationService.getCertificationsByEmail(email);
	        model.addAttribute("certifications", certifications);
	        return "monitor_myrenewals";
	    }
	    
	    @GetMapping("user/user_profile")
	    public String getUserProfile(@RequestParam("email") String email, Model model) {
	        // Fetch the user by email
	        User user = userService.findByEmail(email);
	        if (user == null) {
	            model.addAttribute("error", "User not found");
	            return "error"; // Show an error page if the user is not found
	        }

	        // Add user details to the model to be displayed in the view
	        model.addAttribute("user", user);

	        return "user_profile"; // Return the JSP name
	    }

	    @GetMapping("/user/User_DashBoard")
	    public String showUserDashBoard(HttpServletRequest request, Model model) {
	        
	        model.addAttribute("user", new User());
	        return "User_DashBoard";
	    }
	    
	    
	
	
}
