package com.appfutbol.appfutbol.controller;

import com.appfutbol.appfutbol.model.Liga;
import com.appfutbol.appfutbol.service.LigaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController //esta clase responde peticiones HTTP con JSON
@RequestMapping("/api/ligas") //todas las rutas de este controller empiezan por esta ruta
public class LigaController {
    @Autowired
    private LigaService ligaService;

    @GetMapping
    public List<Liga> obtenerTodas() {
        return ligaService.obtenerTodas();
    }

    @GetMapping("/{id}")// responte a peticiones GET
    public Optional<Liga> obtenerPorId(@PathVariable int id) {
        return ligaService.obtenerPorId(id);
    }

    @PostMapping// responde a peticiones POST
    public Liga guardar(@RequestBody Liga liga) {// convierte el JSON que llega en un objeto Liga
        return ligaService.guardar(liga);
    }

    @DeleteMapping("/{id}")// responde a peticiones DELETE
    public void eliminar(@PathVariable int id) {
        ligaService.eliminar(id);
    }
}//end class