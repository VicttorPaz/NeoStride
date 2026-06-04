package com.productos.seguridad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.productos.datos.Conexion;

public class Usuario {
    private int id;
    private int perfil;
    private int estadoCivil;
    private String cedula;
    private String nombre;
    private String correo;
    private String Clave;

    public Usuario() {}

    public Usuario(int nperfiles, String nnombre, String ncedula, int nestado, String ncorreo, String nclave) {
        this.nombre = nnombre;
        this.cedula = ncedula;
        this.estadoCivil = nestado;
        this.correo = ncorreo;
        this.Clave = nclave;
        this.perfil = nperfiles;
    }

    // --- MÉTODOS GET ---
    public int getId() { return id; }
    public int getPerfil() { return perfil; }
    public int getEstadoCivil() { return estadoCivil; }
    public String getCedula() { return cedula; }
    public String getNombre() { return nombre; }
    public String getCorreo() { return correo; }
    public String getClave() { return Clave; }

    // --- MÉTODOS SET (Añadidos para solucionar el Error 500) ---
    public void setId(int id) { this.id = id; }
    public void setPerfil(int perfil) { this.perfil = perfil; }
    public void setEstadoCivil(int estadoCivil) { this.estadoCivil = estadoCivil; }
    public void setCedula(String cedula) { this.cedula = cedula; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public void setCorreo(String correo) { this.correo = correo; }
    public void setClave(String clave) { this.Clave = clave; }


    public String ingresarCliente() {
        String result = "";
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        
        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            if (con.getConexion() == null) {
                return "Error: No hay conexión a la base de datos";
            }
            
            pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, 2); 
            pr.setInt(2, this.estadoCivil);
            pr.setString(3, this.nombre);
            pr.setString(4, this.cedula);
            pr.setString(5, this.correo);
            pr.setString(6, this.Clave);

            if (pr.executeUpdate() == 1) {
                result = "Inserción correcta";
            } else {
                result = "Error en inserción";
            }
        } catch (Exception ex) {
            result = "Error: " + ex.getMessage();
            System.out.println("Error en ingresarCliente: " + result);
        } finally {
            try {
                if (pr != null) pr.close();
                if (con.getConexion() != null) con.getConexion().close();
            } catch (Exception ex) {
                System.out.print("Error al cerrar: " + ex.getMessage());
            }
        }
        return result;
    }
    
    public String verifyuser(String cedula, String correo, String nombre) {
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        ResultSet rs = null;
        String sql = "SELECT cedula_us, correo_us, nombre_us FROM tb_usuario WHERE cedula_us = ? OR correo_us = ? OR nombre_us = ?";
        
        try {
            if (con.getConexion() == null) return "Error de conexión";
            
            pr = con.getConexion().prepareStatement(sql);
            pr.setString(1, cedula.trim());
            pr.setString(2, correo.trim());
            pr.setString(3, nombre.trim());
            
            rs = pr.executeQuery();
            
            if (rs.next()) {
                if (cedula.trim().equals(rs.getString("cedula_us"))) {
                    return "La cédula ya se encuentra registrada.";
                }
                if (correo.trim().equals(rs.getString("correo_us"))) {
                    return "El correo electrónico ya está en uso.";
                }
                if (nombre.trim().equals(rs.getString("nombre_us"))) {
                    return "El nombre de usuario ya está tomado.";
                }
            }
        } catch (Exception ex) {
            return "Error al validar duplicados: " + ex.getMessage();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pr != null) pr.close();
                if (con.getConexion() != null) con.getConexion().close();
            } catch (Exception e) {}
        }
        return "OK";
    }
}