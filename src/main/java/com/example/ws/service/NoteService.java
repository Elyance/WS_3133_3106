package com.example.ws.service;

import com.example.ws.dto.AnneeNotesDto;
import com.example.ws.dto.NoteDto;
import com.example.ws.dto.SemestreNotesDto;
import com.example.ws.entity.*;
import com.example.ws.exception.DatabaseException;
import com.example.ws.exception.StudentNotFoundException;
import com.example.ws.exception.UnexpectedException;
import com.example.ws.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class NoteService {

    @Autowired
    private NoteEtudiantRepository noteEtudiantRepository;

    @Autowired
    private EtudiantRepository etudiantRepository;

    @Autowired
    private SemestreRepository semestreRepository;

    @Autowired
    private AnneeRepository anneeRepository;

    @Autowired
    private MatiereSemestreRepository matiereSemestreRepository;

    public SemestreNotesDto getNotesSemestre(String semestreLibelle, Long idEtudiant) {
        try {
            // Trouver l'étudiant
            Optional<Etudiant> etudiantOpt = etudiantRepository.findById(idEtudiant);
            if (etudiantOpt.isEmpty()) {
                throw new StudentNotFoundException();
            }
            Etudiant etudiant = etudiantOpt.get();

            // Trouver le semestre
            Optional<Semestre> semestreOpt = semestreRepository.findAll().stream()
                    .filter(s -> semestreLibelle.equals(s.getLibelle()))
                    .findFirst();
            if (semestreOpt.isEmpty()) {
                throw new UnexpectedException("Semestre non trouvé");
            }
            Semestre semestre = semestreOpt.get();

            // Récupérer les matières du semestre
            List<MatiereSemestre> matiereSemestres = matiereSemestreRepository.findAll().stream()
                    .filter(ms -> ms.getSemestre().getId().equals(semestre.getId()))
                    .toList();

            List<NoteDto> notes = new ArrayList<>();
            for (MatiereSemestre ms : matiereSemestres) {
                Optional<NoteEtudiant> noteOpt = noteEtudiantRepository.findAll().stream()
                        .filter(ne -> ne.getEtudiant().getId().equals(etudiant.getId()) &&
                                      ne.getMatiereSemestre().getId().equals(ms.getId()))
                        .findFirst();
                if (noteOpt.isPresent()) {
                    NoteEtudiant ne = noteOpt.get();
                    Matiere matiere = ms.getMatiere();
                    notes.add(new NoteDto(matiere.getLibelle(), matiere.getUe(), ne.getNote(), ms.getCredit(), ms.getIsOptional()));
                }
            }

            return new SemestreNotesDto(semestreLibelle, semestre.getAnnee().getLibelle(), notes);
        } catch (DataAccessException e) {
            throw new DatabaseException(e.getMessage());
        } catch (StudentNotFoundException | UnexpectedException e) {
            throw e;
        } catch (Exception e) {
            throw new UnexpectedException(e.getMessage());
        }
    }

    public AnneeNotesDto getNotesAnnee(String anneeLibelle, Long idEtudiant) {
        try {
            // Trouver l'étudiant
            Optional<Etudiant> etudiantOpt = etudiantRepository.findById(idEtudiant);
            if (etudiantOpt.isEmpty()) {
                throw new StudentNotFoundException();
            }
            Etudiant etudiant = etudiantOpt.get();

            // Trouver l'année
            Optional<Annee> anneeOpt = anneeRepository.findAll().stream()
                    .filter(a -> anneeLibelle.equals(a.getLibelle()))
                    .findFirst();
            if (anneeOpt.isEmpty()) {
                throw new UnexpectedException("Année non trouvée");
            }
            Annee annee = anneeOpt.get();

            // Récupérer les semestres de l'année
            List<Semestre> semestres = semestreRepository.findAll().stream()
                    .filter(s -> s.getAnnee().getId().equals(annee.getId()))
                    .toList();

            List<SemestreNotesDto> semestreNotes = new ArrayList<>();
            for (Semestre semestre : semestres) {
                // Récupérer les matières du semestre
                List<MatiereSemestre> matiereSemestres = matiereSemestreRepository.findAll().stream()
                        .filter(ms -> ms.getSemestre().getId().equals(semestre.getId()))
                        .toList();

                List<NoteDto> notes = new ArrayList<>();
                for (MatiereSemestre ms : matiereSemestres) {
                    Optional<NoteEtudiant> noteOpt = noteEtudiantRepository.findAll().stream()
                            .filter(ne -> ne.getEtudiant().getId().equals(etudiant.getId()) &&
                                          ne.getMatiereSemestre().getId().equals(ms.getId()))
                            .findFirst();
                    if (noteOpt.isPresent()) {
                        NoteEtudiant ne = noteOpt.get();
                        Matiere matiere = ms.getMatiere();
                        notes.add(new NoteDto(matiere.getLibelle(), matiere.getUe(), ne.getNote(), ms.getCredit(), ms.getIsOptional()));
                    }
                }

                semestreNotes.add(new SemestreNotesDto(semestre.getLibelle(), anneeLibelle, notes));
            }

            return new AnneeNotesDto(anneeLibelle, semestreNotes);
        } catch (DataAccessException e) {
            throw new DatabaseException(e.getMessage());
        } catch (StudentNotFoundException | UnexpectedException e) {
            throw e;
        } catch (Exception e) {
            throw new UnexpectedException(e.getMessage());
        }
    }
}