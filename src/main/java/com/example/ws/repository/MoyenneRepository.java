package com.example.ws.repository;

import com.example.ws.entity.Moyenne;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MoyenneRepository extends JpaRepository<Moyenne, Long> {
}