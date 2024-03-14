package com.example.projet2024.repository;

import com.example.projet2024.entite.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentRepo extends JpaRepository<Appointment,Long> {
}
/*
package com.example.projet2024.repository;

import com.example.projet2024.entite.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepo  extends JpaRepository<Admin,Long> {
}
 */