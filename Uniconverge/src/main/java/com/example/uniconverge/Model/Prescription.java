package com.example.uniconverge.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Prescription {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String patientName;
    private String prescriptionText;
    private String doctorprescriptionText;

    public Long getAppointment() {
        return appointment;
    }

    public void setAppointment(Long appointment) {
        this.appointment = appointment;
    }

    private Long appointment;
    @Override
    public String toString() {
        return "Prescription{" +
                "id=" + id +
                ", patientName='" + patientName + '\'' +
                ", prescriptionText='" + prescriptionText + '\'' +
                ", doctorprescriptionText='" + doctorprescriptionText + '\'' +
                ", appointment='" + appointment + '\'' +
                '}';
    }



    public Prescription(Long id, String patientName, String prescriptionText, String doctorprescriptionText, Long appointment) {
        this.id = id;
        this.patientName = patientName;
        this.prescriptionText = prescriptionText;
        this.doctorprescriptionText = doctorprescriptionText;
        this.appointment = appointment;
    }


    public Long getAppointmentId() {
        return appointment;
    }

    public void setAppointmentId(Long appointmentId) {
        this.appointment = appointmentId;
    }



    // Default value for doctorprescriptionText
    public Prescription() {
        this.doctorprescriptionText = "not Seen";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPrescriptionText() {
        return prescriptionText;
    }

    public void setPrescriptionText(String prescriptionText) {
        this.prescriptionText = prescriptionText;
    }

    public String getDoctorprescriptionText() {
        return doctorprescriptionText;
    }

    public void setDoctorprescriptionText(String doctorprescriptionText) {
        this.doctorprescriptionText = doctorprescriptionText;
    }
}
