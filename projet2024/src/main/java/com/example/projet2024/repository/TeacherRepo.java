package com.example.projet2024.repository;

import com.example.projet2024.entite.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TeacherRepo extends JpaRepository<Teacher,Long> {
}
