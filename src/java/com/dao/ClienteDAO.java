package com.dao;


import com.conexion.Conexion;
import com.modelo.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sisv11
 */
public class ClienteDAO extends Conexion{
    public int insertarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO cliente(nombre, edad, idCategoria) VALUES (?, ?, ?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setInt(2, c.getEdad());
            ps.setInt(3, c.getIdCategoria());
            
            res = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
    
    public ArrayList<Cliente> mostrarClientes(){
        ArrayList<Cliente> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM cliente AS cl INNER JOIN categoria as ca ON (cl.idCategoria = ca.idCategoria)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setIdCliente(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setEdad(rs.getInt(3));
                c.setIdCategoria(rs.getInt(4));
                c.setCategoria(rs.getString(5));

                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE cliente SET nombre = ?, edad = ?, idCategoria = ? WHERE idCliente = ?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setInt(2, c.getEdad());
            ps.setInt(3, c.getIdCategoria());
            ps.setInt(4, c.getIdCliente());
            
            res = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al modificar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
    
    public int eliminarCliente(Cliente c){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM cliente WHERE idCliente = ?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, c.getIdCliente());
            
            res = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
    
}
