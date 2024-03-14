package com.example.projet2024.entite;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "Job")
public class Job extends Post{


    private  Long JobID ;

}
