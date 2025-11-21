package com.example.ws.exception;

public class DatabaseException extends ApiException {
    public DatabaseException(String message) {
        super(500, "Erreur de base de données: " + message);
    }
}