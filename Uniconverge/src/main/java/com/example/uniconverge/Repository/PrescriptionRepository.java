package com.example.uniconverge.Repository;

import com.example.uniconverge.Model.Prescription;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface PrescriptionRepository extends JpaRepository<Prescription, Long> {
    List<Prescription> findPrescriptionByPatientName(String patientName);
    boolean existsByAppointment(Long appointment);
    //List<Prescription> findPrescriptionByPatientName(String patient_name);
}
