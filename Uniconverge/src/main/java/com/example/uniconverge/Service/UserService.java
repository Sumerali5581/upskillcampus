package com.example.uniconverge.Service;

import com.example.uniconverge.Model.User;
import com.example.uniconverge.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean checkEmail(String email)
    {
        return userRepository.existsByEmail(email);
    }

    public void updateDoctor(Long Id) {
        if (Id != null) {
            Optional<User> existing = userRepository.findById(Id);

            if (existing.isPresent()) {
                User existingAppointment = existing.get();
                existingAppointment.setRole("doctor");
                userRepository.save(existingAppointment);
            }
        }
    }

}

