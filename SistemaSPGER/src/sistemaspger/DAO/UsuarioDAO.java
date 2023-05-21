package sistemaspger.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sistemaspger.POJO.Usuario;
import sistemaspger.connectionBD.ConstantsConnection;
import sistemaspger.connectionBD.OpenConnection;
import sistemaspger.connectionBD.ResultOperation;
import sistemaspger.connectionBD.UsuarioResponse;


public class UsuarioDAO {
    public static ResultOperation createUsuario(Usuario newUsuario) throws SQLException{
        ResultOperation response = new ResultOperation();
        response.setError(true);
        response.setNumberRowsAffected(-1);
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "INSERT INTO Usuarios (matricula, nombre, apellidoPaterno, apellidoMaterno, " +
                                  "username, password, idRolSistema, idRolAcademico, idAnteproyecto) " +
                                  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement setUsuario = conexionBD.prepareStatement(sqlQuery);
                    setUsuario.setString(1, newUsuario.getMatricula());
                    setUsuario.setString(2, newUsuario.getNombre());
                    setUsuario.setString(3, newUsuario.getApellidoPaterno());
                    setUsuario.setString(4, newUsuario.getApellidoMaterno());
                    setUsuario.setString(5, newUsuario.getUsername());
                    setUsuario.setString(6, newUsuario.getPassword());
                    setUsuario.setInt(7, newUsuario.getIdRolSistema());
                    setUsuario.setInt(8, newUsuario.getIdRolAcademico());
                    setUsuario.setInt(9, newUsuario.getIdAnteproyecto());
                    
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
                String sqlQuery = "SELECT Usuarios.idUsuario, matricula, Usuarios.nombre AS 'nombreUsuario', " +
                                  "apellidoPaterno, apellidoMaterno, username, password, Usuarios.idRolSistema, " +
                                  "RolesSistema.rolSistema, Usuarios_RolesAcademicos.idRolAcademico, RolesAcademicos.rolAcademico, " +
                                  "Usuarios.idAnteproyecto, Anteproyectos.nombre as 'nombreAnteproyecto' " +
                                  "FROM Usuarios " +
                                  "LEFT JOIN Anteproyectos ON Usuarios.idAnteproyecto = Anteproyectos.idAnteproyecto " +
                                  "LEFT JOIN RolesSistema ON Usuarios.idRolSistema = RolesSistema.idRolSistema " +
                                  "LEFT JOIN Usuarios_RolesAcademicos ON Usuarios.idUsuario = Usuarios_RolesAcademicos.idUsuario " +
                                  "LEFT JOIN RolesAcademicos ON Usuarios.idRolAcademico = RolesAcademicos.idRolAcademico" +
                                  "WHERE idUsuario = ?";
                PreparedStatement getUsuario = conexionBD.prepareStatement(sqlQuery);
                ResultSet resultSet = getUsuario.executeQuery();
                getUsuario.setInt(1, idUsuario);
                    usuarioBD.setIdUsuario(resultSet.getInt("idUsuario"));
                    usuarioBD.setMatricula(resultSet.getString("matricula"));
                    usuarioBD.setNombre(resultSet.getString("nombreUsuario"));
                    usuarioBD.setApellidoPaterno(resultSet.getString("apellidoPaterno"));
                    usuarioBD.setApellidoMaterno(resultSet.getString("apellidoMaterno"));
                    usuarioBD.setUsername(resultSet.getString("username"));
                    usuarioBD.setPassword(resultSet.getString("password"));
                    usuarioBD.setIdRolSistema(resultSet.getInt("idRolSistema"));
                    usuarioBD.setRolSistema(resultSet.getString("RolSistema"));
                    usuarioBD.setIdRolAcademico(resultSet.getInt("idRolAcademico"));
                    usuarioBD.setRolAcademico(resultSet.getString("rolAcademico"));
                    usuarioBD.setIdAnteproyecto(resultSet.getInt("idAnteproyecto"));
                    usuarioBD.setAnteproyecto(resultSet.getString("nombreAnteproyecto"));
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
                String sqlQuery = "SELECT Usuarios.idUsuario, matricula, Usuarios.nombre AS 'nombreUsuario', " +
                                  "apellidoPaterno, apellidoMaterno, username, password, Usuarios.idRolSistema, " +
                                  "RolesSistema.rolSistema, Usuarios_RolesAcademicos.idRolAcademico, RolesAcademicos.rolAcademico, " +
                                  "Usuarios.idAnteproyecto, Anteproyectos.nombre as 'nombreAnteproyecto' " +
                                  "FROM Usuarios " +
                                  "LEFT JOIN Anteproyectos ON Usuarios.idAnteproyecto = Anteproyectos.idAnteproyecto " +
                                  "LEFT JOIN RolesSistema ON Usuarios.idRolSistema = RolesSistema.idRolSistema " +
                                  "LEFT JOIN Usuarios_RolesAcademicos ON Usuarios.idUsuario = Usuarios_RolesAcademicos.idUsuario " +
                                  "LEFT JOIN RolesAcademicos ON Usuarios.idRolAcademico = RolesAcademicos.idRolAcademico";
                PreparedStatement getAllUsers = conexionBD.prepareStatement(sqlQuery);
                ResultSet resultSet = getAllUsers.executeQuery();
                usuariosBD = new ArrayList<>();
                while(resultSet.next()){
                    Usuario newUsuario = new Usuario();
                        newUsuario.setIdUsuario(resultSet.getInt("idUsuario"));
                        newUsuario.setMatricula(resultSet.getString("matricula"));
                        newUsuario.setNombre(resultSet.getString("nombreUsuario"));
                        newUsuario.setApellidoPaterno(resultSet.getString("apellidoPaterno"));
                        newUsuario.setApellidoMaterno(resultSet.getString("apellidoMaterno"));
                        newUsuario.setUsername(resultSet.getString("username"));
                        newUsuario.setPassword(resultSet.getString("password"));
                        newUsuario.setIdRolSistema(resultSet.getInt("idRolSistema"));
                        newUsuario.setRolSistema(resultSet.getString("RolSistema"));
                        newUsuario.setIdRolAcademico(resultSet.getInt("idRolAcademico"));
                        newUsuario.setRolAcademico(resultSet.getString("rolAcademico"));
                        newUsuario.setIdAnteproyecto(resultSet.getInt("idAnteproyecto"));
                        newUsuario.setAnteproyecto(resultSet.getString("nombreAnteproyecto"));
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
                String sqlQuery = "UPDATE Usuarios SET matricula = ?, nombre = ?, apellidoPaterno = ?, apelldiMaterno = ?, " +
                                   "username = ?, password = ?, idRolSistema = ?, idRolAcademico = ?, idAnteproyecto = ?  " +
                                   "WHERE idUsuario = ?";
                PreparedStatement setUsuario = conexionBD.prepareStatement(sqlQuery);
                    setUsuario.setString(1, editUsuario.getMatricula());
                    setUsuario.setString(2, editUsuario.getNombre());
                    setUsuario.setString(3, editUsuario.getApellidoPaterno());
                    setUsuario.setString(4, editUsuario.getApellidoMaterno());
                    setUsuario.setString(5, editUsuario.getUsername());
                    setUsuario.setString(6, editUsuario.getPassword());
                    setUsuario.setInt(7, editUsuario.getIdRolSistema());
                    setUsuario.setInt(8, editUsuario.getIdRolAcademico());
                    setUsuario.setInt(9, editUsuario.getIdAnteproyecto());
                    setUsuario.setInt(10, editUsuario.getIdUsuario());
                
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
                String sqlQuery = "DELETE FROM Usuarios WHERE idUsuario = ?";
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
    
    public static UsuarioResponse verifyUsuario(String usuario, String password) throws SQLException{
        UsuarioResponse userResponse = new UsuarioResponse();
        userResponse.setConnectionResponse(ConstantsConnection.CODIGO_OPERACION_CORRECTA);
        Usuario session = null;
        Connection conexionBD = OpenConnection.openConnectionBD();
        
        if(conexionBD != null){
            try {
                String sqlQuery = "SELECT idUsuario, nombre, username, password, Usuarios.idRolSistema, " +
                                  "RolesSistema.rolSistema, Usuarios.idRolAcademico, RolesAcademicos.RolAcademico " +
                                  "FROM Usuarios " +
                                  "LEFT JOIN RolesSistema ON Usuarios.idRolSistema = RolesSistema.idRolSistema " +
                                  "LEFT JOIN RolesAcademicos ON Usuarios.idRolAcademico = RolesAcademicos.idRolAcademico " +
                                  "WHERE username = ? AND password = ?";
                PreparedStatement getLogin = conexionBD.prepareStatement(sqlQuery);
                getLogin.setString(1, usuario);
                getLogin.setString(2, password);
                ResultSet resultSet = getLogin.executeQuery();
                session = new Usuario();
                if(resultSet.next()){
                    session.setIdUsuario( resultSet.getInt("idUsuario") );
                    session.setNombre(resultSet.getString("nombre"));
                    session.setUsername(resultSet.getString("username"));
                    session.setPassword(resultSet.getString("password"));
                    session.setIdRolSistema(resultSet.getInt("idRolSistema"));
                    session.setRolSistema(resultSet.getString("rolSistema"));
                    session.setIdRolAcademico(resultSet.getInt("idRolAcademico"));
                    session.setRolAcademico(resultSet.getString("rolAcademico"));
                    userResponse.setUserResponse(session);
                }
                conexionBD.close();
            } catch (SQLException s) {
                userResponse.setConnectionResponse(ConstantsConnection.CODIGO_OPERACION_DML_FALLIDA);
            } finally{
                conexionBD.close();
            }
        }else{
            userResponse.setConnectionResponse(ConstantsConnection.CODIGO_ERROR_CONEXIONDB);
        }
        return userResponse;
    }
}
