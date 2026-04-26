package com.appfutbol.appfutbol.model;

import jakarta.persistence.*;

@Entity// esta clase represent una tabla de base de datos
@Table(name = "ligas") // indica el nombre exacto de la tabla
public class Liga {

    @Id // marca el campo como PK
    @GeneratedValue(strategy = GenerationType.IDENTITY) // el Id se genera automaticamente
    private int idLiga;

    private String nombre;
    private String pais;
    private String temporada;
    private String logoUrl;

    // Getters y Setters
    public int getIdLiga() {
        return idLiga;
    }

    public void setIdLiga(int idLiga) {
        this.idLiga = idLiga;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getTemporada() {
        return temporada;
    }

    public void setTemporada(String temporada) {
        this.temporada = temporada;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

}//end class
