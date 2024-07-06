package com.example.uniconverge.Repository;

import com.example.uniconverge.Model.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AppointmentRepository extends JpaRepository<Appointment,Long> {
    boolean existsByPatientName(String patient_name);
    boolean existsByPatientNameAndDoctorName(String patient_name, String doctor_name);

    //boolean isAppointmentConfirmed(Appointment appointment);
    List<Appointment> findAppointmentByPatientName(String patient_name);


    List<Appointment> findByDoctorName(String doctor_name);
    List<Appointment> findByDoctorNameAndStatus(String doctorName, String status);
}
