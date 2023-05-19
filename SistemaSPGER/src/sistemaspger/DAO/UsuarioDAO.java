package sistemaspger.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sistemaspger.POJO.Usuario;
import sistemaspger.connectionBD.OpenConnection;
import sistemaspger.connectionBD.ResultOperation;


public class UsuarioDAO {
    public static ResultOperation createUsuario(Usuario newUsuario) throws SQLException{
        ResultOperation response = new ResultOperation();
        response.setError(true);
        response.setNumberRowsAffected(-1);
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "INSERT INTO usuario ";
                PreparedStatement setUsuario = conexionBD.prepareStatement(sqlQuery);
                    //setUsuario.setString();
                    
                int affectedRows = setUsuario.executeUpdate();
                if(affectedRows > 0){
                    response.setError(false);
                    response.setMessage("Usuario agregado correctamente.");
                    response.setNumberRowsAffected(affectedRows);
                }else{
                    response.setMessage("No se pudo registrar la información del usuario.");
                }
            } catch (SQLException e) {
                response.setMessage(e.getMessage());
            } finally{
                conexionBD.close();
            }
        }else{
            response.setMessage("Por el momento no hay conexión con la base de datos...");
        }
        return response;
    }

    public static Usuario getUsuario(int idUsuario) throws SQLException{
        Usuario usuarioBD = null;
        ResultOperation response = new ResultOperation();
        response.setError(true);
        response.setNumberRowsAffected(-1);
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "";
                PreparedStatement getUsuario = conexionBD.prepareStatement(sqlQuery);
                ResultSet resultSet = getUsuario.executeQuery();
                getUsuario.setInt(1, idUsuario);
                //usuarioBD.setIdUsuario(1, idUsuario);   
            } catch (SQLException e) {
                e.printStackTrace();
            } finally{
                conexionBD.close();
            }
        }else{
            response.setMessage("Por el momento no hay conexión con la base de datos...");
        }
        return usuarioBD;
    }
    
    public static ArrayList<Usuario> getUsuarios() throws SQLException{
        ArrayList<Usuario> usuariosBD = null;
        ResultOperation response = new ResultOperation();
        response.setError(true);
        response.setNumberRowsAffected(-1);
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "";
                PreparedStatement getAllUsers = conexionBD.prepareStatement(sqlQuery);
                ResultSet resultSet = getAllUsers.executeQuery();
                usuariosBD = new ArrayList<>();
                while(resultSet.next()){
                    Usuario newUsuario = new Usuario();
                       //newUsuario.setIdUsuario(resultSet.getInt("idUsuario")); 
                    usuariosBD.add(newUsuario);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally{
                conexionBD.close();
            }
        }else{
            response.setMessage("Por el momento no hay conexión con la base de datos...");
        }
        return usuariosBD;
    }
    
    public static ResultOperation editUsuario(Usuario editUsuario) throws SQLException{
        ResultOperation response = new ResultOperation();
        response.setError(true);
        response.setNumberRowsAffected(-1);
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "";
                PreparedStatement setUsuario = conexionBD.prepareStatement(sqlQuery);
                    //setUsuario.setString(1, editUsuario.getIdUsuario());
                
                int rowsAffected = setUsuario.executeUpdate();
                if(rowsAffected > 0){
                    response.setError(false);
                    response.setMessage("Usuario editado correctamente.");
                    response.setNumberRowsAffected(rowsAffected);
                }else{
                    response.setMessage("No se pudo editar la información del usuario.");
                }
            } catch (SQLException e) {
                response.setMessage(e.getMessage());
            } catch(NullPointerException f) {
                response.setMessage(f.getMessage());
            }finally{
                conexionBD.close();
            }
        }else{
            response.setMessage("Por el momento no hay conexión con la base de datos...");
        }
        return response;
    }
    
    public static ResultOperation deleteUsuario(int idUsuario) throws SQLException{
        ResultOperation response = new ResultOperation();
        response.setError(true);
        response.setNumberRowsAffected(-1);
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "DELETE FROM usuario WHERE idUsuario = ?";                
                PreparedStatement delUsuario = conexionBD.prepareStatement(sqlQuery);
                    delUsuario.setInt(1, idUsuario);
                
                int rowsAffected = delUsuario.executeUpdate();
                if(rowsAffected > 0){
                    response.setError(false);
                    response.setMessage("Usuario eliminado correctamente.");
                    response.setNumberRowsAffected(rowsAffected);
                }else{
                    response.setMessage("No se pudo eliminar la información del proveedor.");
                }
            } catch (SQLException e) {
                response.setMessage(e.getMessage());
            } finally{
                conexionBD.close();
            }
        }else{
            response.setMessage("Por el momento no hay conexión con la base de datos...");
        }
        return response;
    }
    
    public static Usuario verifyUsuario(String usuario, String password) throws SQLException{
        Usuario sesion = null;
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "";
                PreparedStatement consultLogin = conexionBD.prepareStatement(sqlQuery);
                    //consultLogin.setString(1, usuario);
                    //consultLogin.setString(1, password);
                ResultSet getUsuario = consultLogin.executeQuery();
                sesion = new Usuario();
                if(getUsuario.next()){
                    sesion.setIdUsuario( getUsuario.getInt("") );
                    sesion.setNombre(getUsuario.getString(""));
                    sesion.setApellidoPaterno(getUsuario.getString(""));
                    sesion.setApellidoMaterno(getUsuario.getString(""));
                }else{
                    sesion.setIdUsuario(-1);
                }
            } catch (SQLException s) {
                s.printStackTrace();
            } finally{
                conexionBD.close();
            }
        }
        return sesion;
    }
}
