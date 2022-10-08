/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.conexion.Conexion;
import com.modelo.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author gabriel
 */
public class UsuarioDAO extends Conexion{
    public ArrayList<Usuario> iniciarSesion(String usuario, String password){
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT username, nivelAccess FROM usuario WHERE username=? AND contrasena=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, usuario);
            pre.setString(2, password);
            ResultSet rs;
            
            rs = pre.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setUsername(rs.getString(1));
                u.setNivelAcceso(rs.getString(2));
                lista.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error al extraer sesion "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
