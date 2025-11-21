package com.example.ws.repository;

import com.example.ws.entity.NoteEtudiant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteEtudiantRepository extends JpaRepository<NoteEtudiant, Long> {
}