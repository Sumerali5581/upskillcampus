package com.example.uniconverge.Controller;

import com.example.uniconverge.Model.*;
import com.example.uniconverge.Repository.AppointmentRepository;
import com.example.uniconverge.Repository.DoctorRepository;
import com.example.uniconverge.Repository.PrescriptionRepository;
import com.example.uniconverge.Repository.UserRepository;
import com.example.uniconverge.Service.AppointmentService;
import com.example.uniconverge.Service.DoctorService;
import com.example.uniconverge.Service.EmailService;
import com.example.uniconverge.Service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    //Login and Registration logic starts here

    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/")
    public String landing(Model model)
    {
        return "page";
    }
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public String submit(@RequestParam("name") String name,
                         @RequestParam("email") String email,
                         @RequestParam("password") String password, HttpSession session)
    {
        if(userService.checkEmail(email))
        {
            //session.setAttribute("msg", "Email id already exist");
            session.setAttribute("registrationSuccess", false);
            session.setAttribute("registrationError", true);
        }
        else {
            User user=new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            userRepository.save(user);
            System.out.println("Data Saved");
            //session.setAttribute("msg", "Registered");
            session.setAttribute("registrationSuccess", true);
            session.setAttribute("registrationError", false);
        }
        return "redirect:/";
    }
    String name="";
    @PostMapping ("/log")
    public String loginHomepage(@RequestParam("email1") String userName,
                                @RequestParam("password1") String password, org.springframework.ui.Model model) {
        User u = null;

        try {
            u = userRepository.findByEmail(userName);
        } catch (Exception e) {
            System.out.println("User not found !!!");
        }
        name=u.getName();
        if(u==null)
        {
            // User not found in the database
            return "redirect:/login/errorUserNotFound";

        }
        else if(!u.getPassword().equals(password))
        {
            // Password does not match
            return "redirect:/login/errorIncorrectPassword";
        }
        else
        //if (u != null && u.getPassword().equals(password))
        {
            model.addAttribute("USERNAME", userName);
            String role = u.getRole();
            //If user is admin
            if (role != null && role.equals("admin")) {
                return "redirect:/admin_dashboard";
            }
            //If user is doctor
            else if (role != null && role.equals("doctor")) {
                return "redirect:/doctor_appointment";
            }
            //If user is patient
            else {
                return "redirect:/patient_appointment";
            }
        }
    }

    @GetMapping("/login/errorUserNotFound")
    public String errorUserNotFound(org.springframework.ui.Model model) {
        model.addAttribute("errorMessage", "User not found. Please register!");
        return "error";
    }

    @GetMapping("/login/errorIncorrectPassword")
    public String errorIncorrectPassword(org.springframework.ui.Model model) {
        model.addAttribute("errorMessage", "Incorrect password. Please try again!");
        return "error";
    }
    @GetMapping("logout")
    public String out(org.springframework.ui.Model model)
    {
        return "page";
    }

    //Login and Registration ends here

    //Appointment booking and confirming logic starts here

    @Autowired
    private AppointmentRepository appointmentRepository;

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private DoctorService doctorService;

    @RequestMapping("/patient_appointment")
    public String showPage(org.springframework.ui.Model model) {
        System.out.println(name);
        return "patient_dashboard";
    }

    @RequestMapping("/appointmentForm")
    public String appointmentForm(org.springframework.ui.Model model, HttpServletRequest request) {
        List<Doctor> doctors = doctorService.getAllDoctors();
        model.addAttribute("doctors", doctors);
        model.addAttribute("userName", name);

        // Add attribute to check if appointment was successfully requested
        boolean appointmentSuccess = request.getParameter("appointmentSuccess") != null;
        model.addAttribute("appointmentSuccess", appointmentSuccess);

        boolean appointmentExists = request.getParameter("appointmentExists") != null;
        model.addAttribute("appointmentExists", appointmentExists);

        return "patient_appointment";
    }

    @PostMapping("/submitAppointment")
    public String submit(
            @RequestParam("doctorName") String doctor_name,
            @RequestParam("appointmentDate") Date date,
            RedirectAttributes redirectAttributes
    ) {
        boolean appointmentExists = appointmentRepository.existsByPatientNameAndDoctorName(name, doctor_name);

        if (appointmentExists) {
            redirectAttributes.addAttribute("appointmentExists", true);
            return "redirect:/appointmentForm";
        }

        Appointment appointment = new Appointment();
        appointment.setPatient_name(name);
        appointment.setDoctor_name(doctor_name);
        appointment.setDate(date);
        appointmentRepository.save(appointment);

        // Add success flag
        redirectAttributes.addAttribute("appointmentSuccess", true);
        System.out.println("Data Saved");
        return "redirect:/appointmentForm";
    }
    @GetMapping("/checkAppointment")
    public String checkAppointment(org.springframework.ui.Model model) {
        //List<Appointment> appointments = appointmentService.getAllAppointments();
        List<Appointment> appointments=appointmentRepository.findAppointmentByPatientName(name);
        model.addAttribute("appointments", appointments);
        for (Appointment appointment : appointments) {
            System.out.println(appointment);
        }
        return "checkAppointment";
    }
    @RequestMapping("/doctor_appointment")
    public String confirm(org.springframework.ui.Model model,HttpServletRequest request) {
        //List<Appointment> appointments = appointmentService.getAllAppointments();
        System.out.println(name);
        List<Appointment> appointments=appointmentRepository.findByDoctorName(name);
        boolean appointmentConfirmed = request.getParameter("appointmentConfirmed") != null;
        model.addAttribute("appointmentConfirmed", appointmentConfirmed);
        model.addAttribute("appointments", appointments);
        return "doctor_dashboard";
    }

    @PostMapping("/confirmAppointment")
    public String confirmAppointment(@RequestParam("confirmingId") Long id,
                                     @RequestParam("confirmingTime") String time) {

        appointmentService.updateAppointment(id, time);
        return "redirect:/doctor_appointment";
    }

    //Appointment logic ends here

    //Prescription logic starts here

    @RequestMapping("/doctor_prescription")
    public String doctor_prescription(Model model,HttpServletRequest request)
    {
        List<Appointment> appointments = appointmentRepository.findByDoctorNameAndStatus(name, "confirm");
        boolean prescriptionConfirmed = request.getParameter("prescriptionConfirmed") != null;
        model.addAttribute("prescriptionConfirmed", prescriptionConfirmed);
        model.addAttribute("appointments", appointments);
        return "doctor_prescriptionPage";
    }

    @Autowired
    private PrescriptionRepository prescriptionRepository;
    @PostMapping("/submitPrescription1")
    public String submit(@RequestParam("appointment") Long appointment,
                         @RequestParam("patientName") String patientName,
                         @RequestParam("symptoms") String symptoms,
                         @RequestParam("prescription") String prescription,
                         RedirectAttributes redirectAttributes)
    {
        boolean prescriptionExists=prescriptionRepository.existsByAppointment(appointment);

        if(prescriptionExists)
        {
            redirectAttributes.addAttribute("prescriptionExists", true);
            return "redirect:/doctor_prescription";
        }
        Prescription pres=new Prescription();
        pres.setAppointmentId(appointment);
        pres.setPatientName(patientName);
        pres.setPrescriptionText(symptoms);
        pres.setDoctorprescriptionText(prescription);
        prescriptionRepository.save(pres);
        redirectAttributes.addAttribute("prescriptionSaved", true);
        return "redirect:/doctor_prescription";
    }

    @RequestMapping("/patient_prescription")
    public String patient_prescription(Model model)
    {
        List<Prescription> prescriptions = prescriptionRepository.findPrescriptionByPatientName(name);

        // Add prescriptions to the model
        model.addAttribute("prescriptions", prescriptions);

        // Print each prescription for debugging
        for (Prescription prescription : prescriptions) {
            System.out.println(prescription);
        }

        // Return the view name
        return "patient_prescriptionPage";

    }

    //Prescription logic ends here

    //Admin logic starts here

    @RequestMapping("/admin_dashboard")
    public String admin_dashboard(Model model)
    {
        return "admin_dashboard";
    }

    @RequestMapping("/admin_appointment")
    public String admin_appointment(Model model)
    {
        List<Appointment> appointments=appointmentRepository.findAll();
        model.addAttribute("appointments",appointments);
        return "admin_appointmentPage";
    }

    @RequestMapping("/admin_prescription")
    public String admin_prescription(Model model)
    {
        List<Prescription> prescriptions=prescriptionRepository.findAll();
        for (Prescription prescription : prescriptions) {
            System.out.println(prescription);
        }
        model.addAttribute("prescriptions",prescriptions);
        return "admin_prescriptionPage";
    }

    @RequestMapping("/admin_role")
    public String admin_role(Model model)
    {
        List<Doctor> doctors=doctorRepository.findAll();
        model.addAttribute("doctors",doctors);
        return "show_doctor";
    }

    @RequestMapping("/add_doctor")
    public String add_doctor(Model model)
    {
        List<User> users=userRepository.findAll();
        model.addAttribute("users",users);
        return "doctor";
    }

    @PostMapping("/confirmDoctor")
    public String confirmAppointment(@RequestParam("confirmingId") Long id) {

        userService.updateDoctor(id);
        return "speciality";
    }

    @PostMapping("/submitdoctor")
    public String submitDoctor(@RequestParam("name") String name,
                               @RequestParam("specification") String specification) {

        Doctor existingDoctor = doctorRepository.findByName(name);

        if (existingDoctor != null) {
            // If doctor exists, update the existing doctor
            existingDoctor.setSpecification(specification);
            doctorRepository.save(existingDoctor);
            System.out.println("Data Updated");
        } else {
            // If doctor does not exist, create a new doctor
            Doctor doctor = new Doctor();
            doctor.setName(name);
            doctor.setSpecification(specification);
            doctorRepository.save(doctor);
            System.out.println("Data Saved");
        }

        return "redirect:/admin_role";
    }

    @RequestMapping("/admin_help")
    public String admin_help(Model model)
    {
        return "admin_contact";
    }

    @RequestMapping("/admin_about")
    public String admin_about(Model model)
    {
        return "admin_about";
    }

    @RequestMapping("/doctor_about")
    public String doctor_about(Model model)
    {
        return "doctor_about";
    }

    @RequestMapping("/doctor_help")
    public String doctor_help(Model model)
    {
        return "doctor_contact";
    }

    @RequestMapping("/patient_about")
    public String patient_about(Model model)
    {
        return "patient_about";
    }

    @RequestMapping("/patient_help")
    public String patient_help(Model model)
    {
        return "patient_contact";
    }

    @Autowired
    private EmailService emailService;

    @PostMapping("/smtp_form1")
    public String sendMail(@ModelAttribute EmailForm emailForm, @RequestParam("files") List<MultipartFile> files) {
//	    List<String> toEmails = Arrays.asList(emailForm.getEmail().split(","));
        ArrayList<String> toEmails= new ArrayList<String>();
        toEmails.add("aishwarya.bangar@mitaoe.ac.in");
        toEmails.add("sumer.ali@mitaoe.ac.in");
        emailService.sendEmailWithAttachments(toEmails, emailForm.getSubject(), emailForm.getBody(), files);
        return "redirect:/patient_appointment";
    }
    @PostMapping("/smtp_form2")
    public String sendMail2(@ModelAttribute EmailForm emailForm, @RequestParam("files") List<MultipartFile> files) {
//	    List<String> toEmails = Arrays.asList(emailForm.getEmail().split(","));
        ArrayList<String> toEmails= new ArrayList<String>();
        toEmails.add("aishwarya.bangar@mitaoe.ac.in");
        toEmails.add("sumer.ali@mitaoe.ac.in");
        emailService.sendEmailWithAttachments(toEmails, emailForm.getSubject(), emailForm.getBody(), files);
        return "redirect:/admin_dashboard";
    }
    @PostMapping("/smtp_form3")
    public String sendMail3(@ModelAttribute EmailForm emailForm, @RequestParam("files") List<MultipartFile> files) {
//	    List<String> toEmails = Arrays.asList(emailForm.getEmail().split(","));
        ArrayList<String> toEmails= new ArrayList<String>();
        toEmails.add("aishwarya.bangar@mitaoe.ac.in");
        toEmails.add("sumer.ali@mitaoe.ac.in");
        emailService.sendEmailWithAttachments(toEmails, emailForm.getSubject(), emailForm.getBody(), files);
        return "redirect:/doctor_appointment";
    }

    //Admin logic ends here
}
