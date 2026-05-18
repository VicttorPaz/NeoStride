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

    // --- MÉTODOS GET Y SET (Mantén los que ya tienes) ---
    public int getEstadoCivil() { return estadoCivil; }
    public String getCedula() { return cedula; }
    public String getNombre() { return nombre; }
    public String getCorreo() { return correo; }
    public String getClave() { return Clave; }

    /**
     * ESTE ES EL MÉTODO QUE LE FALTA A TU CLASE
     * Es el que invoca el archivo respuesta.jsp
     */
    public String ingresarCliente() {
        String result = "";
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        
        // Ajusta los nombres de las columnas según tu base de datos en pgAdmin
        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            if (con.getConexion() == null) {
                return "Error: No hay conexión a la base de datos";
            }
            
            pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, 2); // Perfil por defecto (Cliente)
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

    // --- Otros métodos (verificarUsuario, registrarUsuario, etc.) ---
    // Puedes mantenerlos, pero asegúrate de que usen la clase Conexion correcta.
}