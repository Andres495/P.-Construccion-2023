package sistemaspger.POJO;

public class CuerpoAcademico {
    private int IdCuerpoAcad;
    private String clave;
    private String gradoConsolid;
    private String descripcion;
    private String fechaRegistro;
    
    public CuerpoAcademico(){}

    public CuerpoAcademico(int IdCuerpoAcad, String clave, String gradoConsolid, String descripcion, String fechaRegistro) {
        this.IdCuerpoAcad = IdCuerpoAcad;
        this.clave = clave;
        this.gradoConsolid = gradoConsolid;
        this.descripcion = descripcion;
        this.fechaRegistro = fechaRegistro;
    }

    public int getIdCuerpoAcad() {
        return IdCuerpoAcad;
    }

    public void setIdCuerpoAcad(int IdCuerpoAcad) {
        this.IdCuerpoAcad = IdCuerpoAcad;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getGradoConsolid() {
        return gradoConsolid;
    }

    public void setGradoConsolid(String gradoConsolid) {
        this.gradoConsolid = gradoConsolid;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
    
    @Override
    public String toString(){
        return this.clave;
    }
}
