package com.modelo;

/**
 *
 * @author sisv11
 */
public class Cliente {
    private int idCliente;
    private String nombre;
    private int edad;
    private int idCategoria;
    private String categoria;
    
    public Cliente(){
        
    }

    public Cliente(int idCliente, String nombre, int edad, int idCategoria, String categoria) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.edad = edad;
        this.idCategoria = idCategoria;
        this.categoria = categoria;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
    
}
