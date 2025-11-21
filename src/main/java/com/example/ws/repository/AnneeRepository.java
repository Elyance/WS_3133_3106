package com.example.ws.repository;

import com.example.ws.entity.Annee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnneeRepository extends JpaRepository<Annee, Long> {
}