package com.appfutbol.appfutbol.controller;

import com.appfutbol.appfutbol.model.Equipo;
import com.appfutbol.appfutbol.service.EquipoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/equipos")
public class EquipoController {

    @Autowired
    private EquipoService equipoService;

    @GetMapping
    public List<Equipo> obtenerTodos() {
        return equipoService.obtenerTodos();
    }

    @GetMapping("/{id}")
    public Optional<Equipo> obtenerPorId(@PathVariable int id) {
        return equipoService.obtenerPorId(id);
    }

    @PostMapping
    public Equipo guardar(@RequestBody Equipo equipo) {
        return equipoService.guardar(equipo);
    }

    @DeleteMapping("/{id}")
    public void eliminar(@PathVariable int id) {
        equipoService.eliminar(id);
    }
}//end class
