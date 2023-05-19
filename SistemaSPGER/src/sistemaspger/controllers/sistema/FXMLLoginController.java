package sistemaspger.controllers.sistema;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import sistemaspger.DAO.UsuarioDAO;
import sistemaspger.POJO.Usuario;
import sistemaspger.util.ShowMessage;

public class FXMLLoginController implements Initializable {
    @FXML
    private TextField tfMatricula;
    @FXML
    private PasswordField tfPassword;
    @FXML
    private Label lbErrormatricula;
    @FXML
    private Label lbErrorPassword;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void clicBtnIniciarSesion(ActionEvent event) {
        String matricula = tfMatricula.getText();
        String password = tfPassword.getText();
        boolean valido = true;
        lbErrormatricula.setText("");
        lbErrorPassword.setText("");
        if(matricula.isEmpty()){
            valido = false;
            lbErrormatricula.setText("Campo No. de personal es requerido");
        }
        if(password.isEmpty()){
            valido = false;
            lbErrorPassword.setText("Campo contraseña es requerido");
        }
        if(valido){
            verifyAccessUser(matricula, password);
        }
    }
    
    private void verifyAccessUser(String matricula, String password){
        try {
            Usuario session = UsuarioDAO.verifyUsuario(matricula, password);
            if(session.getIdUsuario() > 0){
                irPantallaPrincipal(session.toString());
            }else{
                ShowMessage.showAlertSimple(
                        "Credenciales incorrectas", 
                        "El número de personal y/o contraseña es incorrecto, favor de verificarlos", 
                        Alert.AlertType.WARNING);
            }
        } catch (SQLException | NullPointerException e) {
            ShowMessage.showAlertSimple(
                    "Error de conexión", 
                    "Hubo un error en el proceso de comunicación, inténtelo más tarde...", 
                    Alert.AlertType.ERROR);
        } 
    } 
    
    private void irPantallaPrincipal(String nombre){
        try {
            ShowMessage.showAlertSimple(
                    "Bienvenido(a)", 
                    "Credenciales correctas, Bienvenido(a) "+nombre+" al sistema", 
                    Alert.AlertType.INFORMATION);
            Parent vista = FXMLLoader.load(getClass().getResource("FXMLPrincipal.fxml"));
            Scene escenaPrincipal = new Scene(vista);
            Stage escenarioBase = (Stage) tfMatricula.getScene().getWindow();
            escenarioBase.setScene(escenaPrincipal);
            escenarioBase.show();
        } catch (IOException ex) {
            ex.printStackTrace();
            ShowMessage.showAlertSimple(
                    "Error", 
                    "No se puede mostrar la pantalla principal", 
                    Alert.AlertType.ERROR);
        }
    }
}