package com.estudarFatec.rian.controller;

import com.estudarFatec.rian.model.Mensagem;
import com.estudarFatec.rian.repository.MensagemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/mensagens")
public class MensagemController {

    @Autowired
    private MensagemRepository repository;

    @GetMapping
    public List<Mensagem> listarTodas() {
        return repository.findAll();
    }
}