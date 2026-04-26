package com.appfutbol.appfutbol.repository;

import com.appfutbol.appfutbol.model.Equipo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EquipoRepository extends JpaRepository<Equipo, Integer> {
    
}//end class