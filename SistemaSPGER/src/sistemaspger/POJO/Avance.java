package sistemaspger.POJO;

public class Avance {
    private int idAvance;
    private int numAvance;
    private String descripcion;
    private String fechaCreacion; 
    private String fechaInicio;
    private String fechaCierre;
    private int idAnteproyecto;
    private String nombreAnteproyecto;

    public Avance(){}
    
    public Avance(int idAvance, int numAvance, String descripcion, String fechaCreacion, String fechaInicio, String fechaCierre, int idAnteproyecto, String nombreAnteproyecto) {
        this.idAvance = idAvance;
        this.numAvance = numAvance;
        this.descripcion = descripcion;
        this.fechaCreacion = fechaCreacion;
        this.fechaInicio = fechaInicio;
        this.fechaCierre = fechaCierre;
        this.idAnteproyecto = idAnteproyecto;
        this.nombreAnteproyecto = nombreAnteproyecto;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(String fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public int getIdAnteproyecto() {
        return idAnteproyecto;
    }

    public void setIdAnteproyecto(int idAnteproyecto) {
        this.idAnteproyecto = idAnteproyecto;
    }

    public String getNombreAnteproyecto() {
        return nombreAnteproyecto;
    }

    public void setNombreAnteproyecto(String nombreAnteproyecto) {
        this.nombreAnteproyecto = nombreAnteproyecto;
    }
    
    @Override
    public String toString(){
        return this.descripcion;
    }
}
