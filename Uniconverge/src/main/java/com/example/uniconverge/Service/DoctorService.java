package com.example.uniconverge.Service;

import com.example.uniconverge.Model.Doctor;
import com.example.uniconverge.Repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorService {
    @Autowired
    private DoctorRepository doctorRepository;

    public List<Doctor> getAllDoctors(){ return doctorRepository.findAll();};
}
