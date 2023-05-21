package sistemaspger.POJO;

public class EntregaActividad {
    private int idEntregaAct;
    private String descripcion;
    private String fechaEntrega;
    private int idAct;
    private String nombreAct;
    private String descripAct;
    private int idEstudiante;
    private String nombreEstudiante;
    
    public EntregaActividad(){}

    public EntregaActividad(int idEntregaAct, String descripcion, String fechaEntrega, int idAct, String nombreAct, String descripAct, int idEstudiante, String nombreEstudiante) {
        this.idEntregaAct = idEntregaAct;
        this.descripcion = descripcion;
        this.fechaEntrega = fechaEntrega;
        this.idAct = idAct;
        this.nombreAct = nombreAct;
        this.descripAct = descripAct;
        this.idEstudiante = idEstudiante;
        this.nombreEstudiante = nombreEstudiante;
    }

    public int getIdEntregaAct() {
        return idEntregaAct;
    }

    public void setIdEntregaAct(int idEntregaAct) {
        this.idEntregaAct = idEntregaAct;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public int getIdAct() {
        return idAct;
    }

    public void setIdAct(int idAct) {
        this.idAct = idAct;
    }

    public String getNombreAct() {
        return nombreAct;
    }

    public void setNombreAct(String nombreAct) {
        this.nombreAct = nombreAct;
    }

    public String getDescripAct() {
        return descripAct;
    }

    public void setDescripAct(String descripAct) {
        this.descripAct = descripAct;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getNombreEstudiante() {
        return nombreEstudiante;
    }

    public void setNombreEstudiante(String nombreEstudiante) {
        this.nombreEstudiante = nombreEstudiante;
    }
}
