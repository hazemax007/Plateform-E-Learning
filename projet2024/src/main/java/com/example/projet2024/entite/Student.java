package com.example.projet2024.entite;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "Student")
public class Student extends User {


    private  Long StudentId ;
    @Basic
    @Column(name = "Subject")
    private String Subject ;

}
