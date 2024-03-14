package com.example.projet2024.entite;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "Response")
public class Response {
    @Id
    //@Column(name = "responseId")
    @GeneratedValue(strategy =GenerationType.IDENTITY)
    private Long responseId ;
    @Basic
    @Column(name = "Response")
    private String Response ;
    @ManyToOne
    @JoinColumn(name = "question_id", referencedColumnName = "id")
    @JsonBackReference
    private Question question;
    @OneToOne(mappedBy="response")
    private Claim claim;
}
