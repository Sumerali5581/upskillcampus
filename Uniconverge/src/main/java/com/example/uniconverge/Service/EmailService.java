package com.example.uniconverge.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.mail.javamail.JavaMailSender;
import java.io.IOException;
import java.util.List;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendEmail(List<String> toEmails, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("sumersmr7@gmail.com");
        message.setTo(toEmails.toArray(new String[0]));
        message.setText(body);
        message.setSubject(subject);

        javaMailSender.send(message);

        System.out.println("Mail Sent Successfully....");
    }

    public void sendEmailWithAttachments(List<String> toEmails, String subject, String body, List<MultipartFile> files) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom("akashbachhav2003@gmail.com");
            helper.setTo(toEmails.toArray(new String[0]));
            helper.setSubject(subject);
            helper.setText(body);

            for (MultipartFile file : files) {
                if (file != null && !file.isEmpty()) {
                    helper.addAttachment(file.getOriginalFilename(), new ByteArrayResource(file.getBytes()));
                }
            }

            javaMailSender.send(message);

            System.out.println("Mail Sent Successfully....");
        } catch (MessagingException | IOException e) {
            e.printStackTrace();
        }
    }
}