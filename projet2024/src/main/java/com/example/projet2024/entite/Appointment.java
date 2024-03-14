package com.example.projet2024.entite;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@Entity
@Table(name = "Appointment")
public class Appointment {
    @Id
    @Column(name = "AppointmentID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long AppointmentID ;
    @Temporal(TemporalType.DATE)
    @Column(name = "date")
    private Date date ;
    @Temporal (TemporalType.DATE)
    @Column(name = "Time")
    private Date Time ;
    @OneToOne
    private Post post;

}
