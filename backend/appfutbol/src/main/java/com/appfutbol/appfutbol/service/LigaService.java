package com.appfutbol.appfutbol.service;

import com.appfutbol.appfutbol.model.Liga;
import com.appfutbol.appfutbol.repository.LigaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;//Representa un valor que puede existir o no

@Service// capa de logica de negocio
public class LigaService {

    @Autowired// Spring conecta automaticamente el repositorio, sin necesidad de hacer new LigaRepository()
    private LigaRepository ligaRepository;

    public List<Liga> obtenerTodas() {
        return ligaRepository.findAll();
    }

    public Optional<Liga> obtenerPorId(int id) {
        return ligaRepository.findById(id);
    }

    public Liga guardar(Liga liga) {
        return ligaRepository.save(liga);
    }

    public void eliminar(int id) {
        ligaRepository.deleteById(id);
    }
}//end class
