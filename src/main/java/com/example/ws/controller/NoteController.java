package com.example.ws.controller;

import com.example.ws.dto.ApiResponse;
import com.example.ws.dto.AnneeNotesDto;
import com.example.ws.dto.SemestreNotesDto;
import com.example.ws.exception.ApiException;
import com.example.ws.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/notes")
public class NoteController {

    @Autowired
    private NoteService noteService;

    @GetMapping("/semestre/{semestreLibelle}/{idEtudiant}")
    public ApiResponse<SemestreNotesDto> getNotesSemestre(@PathVariable String semestreLibelle, @PathVariable Long idEtudiant) {
        try {
            SemestreNotesDto data = noteService.getNotesSemestre(semestreLibelle, idEtudiant);
            return new ApiResponse<>("success", data, null, 200);
        } catch (ApiException e) {
            return new ApiResponse<>("error", null, e.getMessage(), e.getCode());
        } catch (Exception e) {
            return new ApiResponse<>("error", null, "Erreur interne: " + e.getMessage(), 500);
        }
    }

    @GetMapping("/annee/{anneeLibelle}/{idEtudiant}")
    public ApiResponse<AnneeNotesDto> getNotesAnnee(@PathVariable String anneeLibelle, @PathVariable Long idEtudiant) {
        try {
            AnneeNotesDto data = noteService.getNotesAnnee(anneeLibelle, idEtudiant);
            return new ApiResponse<>("success", data, null, 200);
        } catch (ApiException e) {
            return new ApiResponse<>("error", null, e.getMessage(), e.getCode());
        } catch (Exception e) {
            return new ApiResponse<>("error", null, "Erreur interne: " + e.getMessage(), 500);
        }
    }
}