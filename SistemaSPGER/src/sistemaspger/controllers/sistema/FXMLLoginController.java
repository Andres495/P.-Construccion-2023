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
import sistemaspger.connectionBD.ConstantsConnection;
import sistemaspger.connectionBD.UsuarioResponse;
import sistemaspger.DAO.UsuarioDAO;
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
    private UsuarioResponse userResponse;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void clicBtnIniciarSesion(ActionEvent event) {
        String username = tfMatricula.getText();
        String password = tfPassword.getText();
        boolean valido = true;
        lbErrormatricula.setText("");
        lbErrorPassword.setText("");
        if(username.isEmpty()){
            valido = false;
            lbErrormatricula.setText("Campo No. de personal es requerido");
        }
        if(password.isEmpty()){
            valido = false;
            lbErrorPassword.setText("Campo contraseña es requerido");
        }
        if(valido == true){
            verifyAccessUser(username, password);
        }
    }
    
    private void verifyAccessUser(String username, String password){
        try {
            userResponse = UsuarioDAO.verifyUsuario(username, password);
            if(userResponse.getConnectionResponse() == ConstantsConnection.CODIGO_OPERACION_CORRECTA){
                System.out.println(
                        "------------------Usuario consultado: "+
                        userResponse.getUserResponse().getNombre()+"------------------"
                );
                ShowMessage.showAlertSimple(
                    "Bienvenido(a)", 
                    "Credenciales correctas.\nBienvenido(a) "+userResponse.getUserResponse().getNombre()+" al sistema.", 
                    Alert.AlertType.INFORMATION);
                openMainWindow();
            }else{
                ShowMessage.showAlertSimple(
                        "Credenciales incorrectas", 
                        "El número de personal y/o contraseña son incorrectos.\nFavor de verificarlos.", 
                        Alert.AlertType.WARNING);
            }
        } catch (SQLException | NullPointerException e) {
            ShowMessage.showAlertSimple(
                    "Error de conexión", 
                    "Hubo un error en el proceso de comunicación.\nInténtelo más tarde...", 
                    Alert.AlertType.ERROR);
        } 
    } 
    
    private void openMainWindow(){
        try {
            System.out.println("------------------Nivel de acceso BD: "+
                    userResponse.getUserResponse()+"------------------"
            );
            String ventana = null;
            String nivelAcceso = userResponse.getUserResponse().getRolSistema().trim();
            switch(nivelAcceso){
                case "q":
                    ventana = "";   
                    break;
                case "w":
                    ventana = "";
                    break;
                case "e":
                    ventana = "";
                    break;
                default:
                    ShowMessage.showAlertSimple(
                            "Conflicto de nivel de acceso", 
                            "Al parecer no existe el nivel de acceso que posee\n\nFATAL_ERROR_BD",
                            Alert.AlertType.ERROR);
                    break;
            }
            Parent vista = FXMLLoader.load(getClass().getResource(ventana));
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