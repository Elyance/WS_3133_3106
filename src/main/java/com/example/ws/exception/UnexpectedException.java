package com.example.ws.exception;

public class UnexpectedException extends ApiException {
    public UnexpectedException(String message) {
        super(500, "Erreur interne: " + message);
    }
}