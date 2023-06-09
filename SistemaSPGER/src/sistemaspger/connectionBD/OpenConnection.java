package sistemaspger.connectionBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OpenConnection {
    private static String driver = "com.mysql.jdbc.Driver";
    private static String bd = "sistemaSPGER";
    private static String ip = "localhost";
    private static String puerto = "3306";
    private static String urlConexion =
            "jdbc:mysql://"+ip+":"+puerto+"/"+bd+
            "?allowPublicKeyRetrieval=true&useSSL=false"; 
    private static String usuario = "<user>";
    private static String password = "<password>";
    
    public static Connection openConnectionBD(){
        Connection conexionBD = null;
        try {
            Class.forName(driver);
            conexionBD = DriverManager.getConnection(urlConexion, usuario, password);
        } catch (ClassNotFoundException ex ) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("//////////////"+conexionBD);
        return conexionBD;
    }
}
