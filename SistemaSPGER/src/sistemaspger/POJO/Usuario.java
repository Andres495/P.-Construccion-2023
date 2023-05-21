package sistemaspger.POJO;

public class Usuario {
    private int idUsuario;
    private String matricula;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String username;
    private String password;
    private int idRolSistema;
    private String rolSistema;
    private int idRolAcademico;
    private String rolAcademico;
    private int idAnteproyecto;
    private String anteproyecto;
    
    public Usuario(){}

    public Usuario(int idUsuario, String matricula, String nombre, String apellidoPaterno, String apellidoMaterno, String username, String password, int idRolSistema, String rolSistema, int idRolAcademico, String rolAcademico, int idAnteproyecto, String anteproyecto) {
        this.idUsuario = idUsuario;
        this.matricula = matricula;
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.username = username;
        this.password = password;
        this.idRolSistema = idRolSistema;
        this.rolSistema = rolSistema;
        this.idRolAcademico = idRolAcademico;
        this.rolAcademico = rolAcademico;
        this.idAnteproyecto = idAnteproyecto;
        this.anteproyecto = anteproyecto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdRolSistema() {
        return idRolSistema;
    }

    public void setIdRolSistema(int idRolSistema) {
        this.idRolSistema = idRolSistema;
    }

    public String getRolSistema() {
        return rolSistema;
    }

    public void setRolSistema(String rolSistema) {
        this.rolSistema = rolSistema;
    }

    public int getIdRolAcademico() {
        return idRolAcademico;
    }

    public void setIdRolAcademico(int idRolAcademico) {
        this.idRolAcademico = idRolAcademico;
    }

    public String getRolAcademico() {
        return rolAcademico;
    }

    public void setRolAcademico(String rolAcademico) {
        this.rolAcademico = rolAcademico;
    }

    public int getIdAnteproyecto() {
        return idAnteproyecto;
    }

    public void setIdAnteproyecto(int idAnteproyecto) {
        this.idAnteproyecto = idAnteproyecto;
    }

    public String getAnteproyecto() {
        return anteproyecto;
    }

    public void setAnteproyecto(String anteproyecto) {
        this.anteproyecto = anteproyecto;
    }
    
    @Override
    public String toString(){
        return this.nombre+" "+this.apellidoPaterno;
    }
}