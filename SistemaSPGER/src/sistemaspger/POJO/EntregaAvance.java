package sistemaspger.POJO;

public class EntregaAvance {
    private int idEntregaAvance;
    private String descripcion;
    private String fechaEntrega;
    private int idAvance;
    private int numAvance;
    private String descripAvance;
    private int idEstudiante;
    private String nombreEstudiante;
    
    public EntregaAvance(){}

    public EntregaAvance(int idEntregaAvance, String descripcion, String fechaEntrega, int idAvance, int numAvance, String descripAvance, int idEstudiante, String nombreEstudiante) {
        this.idEntregaAvance = idEntregaAvance;
        this.descripcion = descripcion;
        this.fechaEntrega = fechaEntrega;
        this.idAvance = idAvance;
        this.numAvance = numAvance;
        this.descripAvance = descripAvance;
        this.idEstudiante = idEstudiante;
        this.nombreEstudiante = nombreEstudiante;
    }

    public int getIdEntregaAvance() {
        return idEntregaAvance;
    }

    public void setIdEntregaAvance(int idEntregaAvance) {
        this.idEntregaAvance = idEntregaAvance;
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

    public int getIdAvance() {
        return idAvance;
    }

    public void setIdAvance(int idAvance) {
        this.idAvance = idAvance;
    }

    public int getNumAvance() {
        return numAvance;
    }

    public void setNumAvance(int numAvance) {
        this.numAvance = numAvance;
    }

    public String getDescripAvance() {
        return descripAvance;
    }

    public void setDescripAvance(String descripAvance) {
        this.descripAvance = descripAvance;
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
