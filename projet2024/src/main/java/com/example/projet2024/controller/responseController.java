package com.example.projet2024.controller;


import com.example.projet2024.entite.Response;
import com.example.projet2024.entite.Test;
import com.example.projet2024.interfaceService.responseInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/response")
@CrossOrigin("*")
public class responseController {

    @Autowired
    private responseInterface responseInterface;

    @GetMapping
    public ResponseEntity<List<Response>> getAllResponses() {
        List<Response> responses = responseInterface.getAllResponses();
        return new ResponseEntity<>(responses, HttpStatus.OK);
    }

    @GetMapping("/getQuestion/{questionId}")
    public ResponseEntity<List<Response>> getAnswersByQuestionId(@PathVariable Long questionId) {
        List<Response> answers = responseInterface.getResponsesByQuestionId(questionId);
        return new ResponseEntity<>(answers, HttpStatus.OK);
    }

    @GetMapping("/{answerId}")
    public ResponseEntity<Response> getAnswerById(@PathVariable Long answerId) {
        Response answer = responseInterface.getResponseById(answerId);
        return new ResponseEntity<>(answer, HttpStatus.OK);
    }

    @PostMapping("/{questionId}")
    public ResponseEntity<Response> createAnswer(@PathVariable Long questionId, @RequestBody Response answer) {
        Response createdAnswer = responseInterface.createResponse(questionId, answer);
        return new ResponseEntity<>(createdAnswer, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Response> updateResponse(@PathVariable Long id, @RequestBody Response updatedResponse) {
        Response result = responseInterface.updateResponse(id, updatedResponse);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteResponse(@PathVariable Long id) {
        responseInterface.deleteResponse(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

}
