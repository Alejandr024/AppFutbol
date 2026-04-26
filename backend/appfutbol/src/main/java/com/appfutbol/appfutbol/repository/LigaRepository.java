package com.appfutbol.appfutbol.repository;

import com.appfutbol.appfutbol.model.Liga;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository// se encarga exclusivamente de hablar con la base de datos
public interface LigaRepository extends JpaRepository<Liga, Integer>{ //Este repositorio maneja objetos Liga y su Id es un Integer
    
}//end class