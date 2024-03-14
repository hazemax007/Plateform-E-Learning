package com.example.projet2024.entite;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "Teacher")
public class Teacher extends User {



    private Long TeacherId ;
    @Basic
    @Column(name = "Subject")
    private String Subject ;
    @Temporal(TemporalType.DATE)
    @Column(name = "recruitmentdate")
    private Date recruitmentdate ;
    @Enumerated(EnumType.STRING)
    private Availabillity availabillity ;
}

