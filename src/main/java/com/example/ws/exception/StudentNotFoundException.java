package com.example.ws.exception;

public class StudentNotFoundException extends ApiException {
    public StudentNotFoundException() {
        super(404, "Étudiant non trouvé");
    }
}