package com.dao;

import com.conexion.Conexion;
import com.modelo.Categoria;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sisv11
 */
public class CategoriaDAO extends Conexion{
    public ArrayList<Categoria> mostrarCategorias(){
        ArrayList<Categoria> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM categoria";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria((rs.getInt(1)));
                c.setCategoria(rs.getString(1));
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar:" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
