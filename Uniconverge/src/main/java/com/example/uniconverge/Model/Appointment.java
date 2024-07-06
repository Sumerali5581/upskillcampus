package com.example.uniconverge.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.sql.Date;

@Entity
public class Appointment {
    @jakarta.persistence.Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;
    private String patientName;
    private String doctorName;
    private Date date;
    private String time;
    private String status;

    // Getters and Setters

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getPatient_name() {
        return patientName;
    }

    public void setPatient_name(String patient_name) {
        this.patientName = patient_name;
    }

    public String getDoctor_name() {
        return doctorName;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctorName = doctor_name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Constructors

    @Override
    public String toString() {
        return "Appointment{" +
                "Id=" + Id +
                ", patient_name='" + patientName + '\'' +
                ", doctor_name='" + doctorName + '\'' +
                ", date=" + date +
                ", time='" + time + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public Appointment(Long id, String patient_name, String doctor_name, Date date, String time, String status) {
        Id = id;
        this.patientName = patient_name;
        this.doctorName = doctor_name;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    public Appointment() {
        this.status = "Pending";
    }
}
