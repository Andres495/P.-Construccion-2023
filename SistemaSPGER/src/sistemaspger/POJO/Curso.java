package sistemaspger.POJO;

public class Curso {
    private int idCurso;
    private String nombre;
    private String periodo;
    private String fechaInicio;
    private String fechaFin;
    
    public Curso(){}

    public Curso(int idCurso, String nombre, String periodo, String fechaInicio, String fechaFin) {
        this.idCurso = idCurso;
        this.nombre = nombre;
        this.periodo = periodo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    @Override
    public String toString() {
        return this.nombre+" "+this.periodo;
    }
}
