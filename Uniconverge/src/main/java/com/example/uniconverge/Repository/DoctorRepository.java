package com.example.uniconverge.Repository;

import com.example.uniconverge.Model.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DoctorRepository extends JpaRepository<Doctor,Long> {
    Doctor findByName(String name);
}
