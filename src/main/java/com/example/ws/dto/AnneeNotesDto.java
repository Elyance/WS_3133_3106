package com.example.ws.dto;

import java.util.List;

public class AnneeNotesDto {
    private String anneeLibelle;
    private List<SemestreNotesDto> semestres;

    public AnneeNotesDto(String anneeLibelle, List<SemestreNotesDto> semestres) {
        this.anneeLibelle = anneeLibelle;
        this.semestres = semestres;
    }

    // Getters and Setters
    public String getAnneeLibelle() {
        return anneeLibelle;
    }

    public void setAnneeLibelle(String anneeLibelle) {
        this.anneeLibelle = anneeLibelle;
    }

    public List<SemestreNotesDto> getSemestres() {
        return semestres;
    }

    public void setSemestres(List<SemestreNotesDto> semestres) {
        this.semestres = semestres;
    }
}