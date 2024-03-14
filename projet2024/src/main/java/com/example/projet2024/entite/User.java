package com.example.projet2024.entite;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "User")
public class User {


    @Id
    @Column(name = "UserId")
    @GeneratedValue(strategy =GenerationType.IDENTITY)

    private Long UserId ;
    @Basic
    @Column(name = "Name")
    private String Name ;
    @Basic
    @Column(name = "Mail")
    private String Mail ;
    @Basic
    @Column(name = "Password")
    private String Password ;
    @Basic
    @Column(name = "Phone")
    private long Phone ;
    @Temporal (TemporalType.DATE)
    @Column(name = "Dateofbirth")
    private Date Dateofbirth ;
    @Basic
    @Column(name = "Avatar")
    private String Avatar ;
   @Enumerated(EnumType.STRING)
    private Role role ;
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Contract> contracts;
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Company> companys;
    @OneToMany(cascade = CascadeType.ALL, mappedBy="user")
    private Set<Evaluation> Evaluations;
    @ManyToOne
    Chat chat;
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<TrainingCenter> trainingcenters;
    @OneToMany(cascade = CascadeType.ALL, mappedBy="user")
    private Set<Participation> Participations;
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Claim> claims;
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Article> articles;

}
