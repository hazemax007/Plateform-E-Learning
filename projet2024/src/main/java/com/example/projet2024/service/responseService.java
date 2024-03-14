package com.example.projet2024.service;

import com.example.projet2024.entite.Question;
import com.example.projet2024.entite.Response;
import com.example.projet2024.entite.Test;
import com.example.projet2024.interfaceService.responseInterface;
import com.example.projet2024.repository.QuestionRepo;
import com.example.projet2024.repository.ResponseRepo;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class responseService implements responseInterface {

    @Autowired
    private ResponseRepo responseRepo;

    @Autowired
    private QuestionRepo questionRepo;

    @Override
    public List<Response> getAllResponses() {
        return responseRepo.findAll();
    }

    @Override
    public List<Response> getResponsesByQuestionId(Long questionId) {
        return responseRepo.findByQuestionId(questionId);
    }

    @Override
    public Response getResponseById(Long responseId) {
        return responseRepo.findById(responseId)
                .orElseThrow(() -> new EntityNotFoundException("Answer not found with id: " + responseId));
    }

    @Override
    public Response createResponse(Long questionId, Response response) {
        Question question = questionRepo.findById(questionId)
                .orElseThrow(() -> new EntityNotFoundException("Question not found with id: " + questionId));

        question.getResponses().add(response);
        response.setQuestion(question);
        return responseRepo.save(response);
    }

    @Override
    public Response updateResponse(Long id, Response updatedResponse) {
        Response response = responseRepo.findById(id).orElseThrow();
        response.setResponse(updatedResponse.getResponse());
        return responseRepo.save(response);
    }

    @Override
    public void deleteResponse(Long id) {
        responseRepo.deleteById(id);
    }
}
