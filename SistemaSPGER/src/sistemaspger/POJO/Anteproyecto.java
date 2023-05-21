package sistemaspger.POJO;

public class Anteproyecto {
    private int idAnteproyecto;
    private String nombre;
    private String estado;
    private String descripcion;
    private int idLGAC;
    private int numeroLGAC;
    private String nombreLGAC;
    private int idDirector;
    private int idCoDirector;
    private String nombreDirector;
    private String nombreCoDirector;
    
    public Anteproyecto(){}

    public Anteproyecto(int idAnteproyecto, String nombre, String estado, String descripcion, int idLGAC, int numeroLGAC, String nombreLGAC, int idDirector, int idCoDirector, String nombreDirector, String nombreCoDirector) {
        this.idAnteproyecto = idAnteproyecto;
        this.nombre = nombre;
        this.estado = estado;
        this.descripcion = descripcion;
        this.idLGAC = idLGAC;
        this.numeroLGAC = numeroLGAC;
        this.nombreLGAC = nombreLGAC;
        this.idDirector = idDirector;
        this.idCoDirector = idCoDirector;
        this.nombreDirector = nombreDirector;
        this.nombreCoDirector = nombreCoDirector;
    }

    public int getIdAnteproyecto() {
        return idAnteproyecto;
    }

    public void setIdAnteproyecto(int idAnteproyecto) {
        this.idAnteproyecto = idAnteproyecto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdLGAC() {
        return idLGAC;
    }

    public void setIdLGAC(int idLGAC) {
        this.idLGAC = idLGAC;
    }

    public int getNumeroLGAC() {
        return numeroLGAC;
    }

    public void setNumeroLGAC(int numeroLGAC) {
        this.numeroLGAC = numeroLGAC;
    }

    public String getNombreLGAC() {
        return nombreLGAC;
    }

    public void setNombreLGAC(String nombreLGAC) {
        this.nombreLGAC = nombreLGAC;
    }

    public int getIdDirector() {
        return idDirector;
    }

    public void setIdDirector(int idDirector) {
        this.idDirector = idDirector;
    }

    public int getIdCoDirector() {
        return idCoDirector;
    }

    public void setIdCoDirector(int idCoDirector) {
        this.idCoDirector = idCoDirector;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public String getNombreCoDirector() {
        return nombreCoDirector;
    }

    public void setNombreCoDirector(String nombreCoDirector) {
        this.nombreCoDirector = nombreCoDirector;
    }
    
    
}
