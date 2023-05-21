package sistemaspger.POJO;

public class ExperienciaEducativa {
    private int idExperienciaEducativa;
    private int NRC;
    private String nombre;
    private int creditos;

    public ExperienciaEducativa() {}

    public ExperienciaEducativa(int idExperienciaEducativa, int NRC, String nombre, int creditos) {
        this.idExperienciaEducativa = idExperienciaEducativa;
        this.NRC = NRC;
        this.nombre = nombre;
        this.creditos = creditos;
    }

    public int getIdExperienciaEducativa() {
        return idExperienciaEducativa;
    }

    public void setIdExperienciaEducativa(int idExperienciaEducativa) {
        this.idExperienciaEducativa = idExperienciaEducativa;
    }

    public int getNRC() {
        return NRC;
    }

    public void setNRC(int NRC) {
        this.NRC = NRC;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }
}
