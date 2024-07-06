package com.example.uniconverge.Model;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class EmailForm {
    private String email;
    private String subject;
    private String body;

    public List<MultipartFile> getFile() {
        return file;
    }

    public void setFile(List<MultipartFile> file) {
        this.file = file;
    }

    private List<MultipartFile> file;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
