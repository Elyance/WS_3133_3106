package com.example.ws.dto;

import java.math.BigDecimal;

public class NoteDto {
    private String matiereLibelle;
    private String ue;
    private BigDecimal note;
    private BigDecimal credit;
    private Boolean isOptional;

    public NoteDto(String matiereLibelle, String ue, BigDecimal note, BigDecimal credit, Boolean isOptional) {
        this.matiereLibelle = matiereLibelle;
        this.ue = ue;
        this.note = note;
        this.credit = credit;
        this.isOptional = isOptional;
    }

    // Getters and Setters
    public String getMatiereLibelle() {
        return matiereLibelle;
    }

    public void setMatiereLibelle(String matiereLibelle) {
        this.matiereLibelle = matiereLibelle;
    }

    public String getUe() {
        return ue;
    }

    public void setUe(String ue) {
        this.ue = ue;
    }

    public BigDecimal getNote() {
        return note;
    }

    public void setNote(BigDecimal note) {
        this.note = note;
    }

    public BigDecimal getCredit() {
        return credit;
    }

    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    public Boolean getIsOptional() {
        return isOptional;
    }

    public void setIsOptional(Boolean isOptional) {
        this.isOptional = isOptional;
    }
}