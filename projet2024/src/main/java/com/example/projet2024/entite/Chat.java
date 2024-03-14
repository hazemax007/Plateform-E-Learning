package com.example.projet2024.entite;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "Chat")
public class Chat {
    @Id
    @Column(name = "ChatID")
    @GeneratedValue(strategy =GenerationType.IDENTITY)

    private Long ChatID ;
    @OneToMany(cascade = CascadeType.ALL, mappedBy="chat")
    private Set<User> Users;
}
