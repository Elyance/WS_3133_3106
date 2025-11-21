package com.example.ws.dto;

import java.util.List;

public class SemestreNotesDto {
    private String semestreLibelle;
    private String anneeLibelle;
    private List<NoteDto> notes;

    public SemestreNotesDto(String semestreLibelle, String anneeLibelle, List<NoteDto> notes) {
        this.semestreLibelle = semestreLibelle;
        this.anneeLibelle = anneeLibelle;
        this.notes = notes;
    }

    // Getters and Setters
    public String getSemestreLibelle() {
        return semestreLibelle;
    }

    public void setSemestreLibelle(String semestreLibelle) {
        this.semestreLibelle = semestreLibelle;
    }

    public String getAnneeLibelle() {
        return anneeLibelle;
    }

    public void setAnneeLibelle(String anneeLibelle) {
        this.anneeLibelle = anneeLibelle;
    }

    public List<NoteDto> getNotes() {
        return notes;
    }

    public void setNotes(List<NoteDto> notes) {
        this.notes = notes;
    }
}