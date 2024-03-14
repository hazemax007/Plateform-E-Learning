package com.example.projet2024.service;

import com.example.projet2024.entite.Question;
import com.example.projet2024.entite.Test;
import com.example.projet2024.interfaceService.questionInterface;
import com.example.projet2024.repository.QuestionRepo;
import com.example.projet2024.repository.TestRepo;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class questionService implements questionInterface {

    @Autowired
    private QuestionRepo questionRepo;

    @Autowired
    private TestRepo testRepo;

    @Override
    public List<Question> getAllQuestions() {
        return questionRepo.findAll();
    }

    @Override
    public List<Question> getQuestionsByTestId(Long testId) {
        return questionRepo.findByTestId(testId);
    }

    @Override
    public Question getQuestionById(Long questionId) {
        return questionRepo.findById(questionId)
                .orElseThrow(() -> new EntityNotFoundException("Question not found with id: " + questionId));
    }

    @Override
    public Question createQuestion(Long testId, Question question) {
        Test test = testRepo.findById(testId)
                .orElseThrow(() -> new EntityNotFoundException("Test not found with id: " + testId));

        test.getQuestions().add(question);
        question.setTest(test);
        return questionRepo.save(question);
    }

    @Override
    public Question updateQuestion(Long id, Question updatedQuestion) {
        Question question = questionRepo.findById(id).orElseThrow();
        question.setQuestion(updatedQuestion.getQuestion());
        return questionRepo.save(question);
    }

    @Override
    public void deleteQuestion(Long id) {
        questionRepo.deleteById(id);
    }
}
