package sistemaspger.POJO;

public class Archivo {
    private int idArchivo;
    private String nombre;
    private byte archivo;
    private int idEntregaAvance;
    private int idEntregaAct;
    private int idAnteproyecto;
    
    public Archivo(){}

    public Archivo(int idArchivo, String nombre, byte archivo, int idEntregaAvance, int idEntregaAct, int idAnteproyecto) {
        this.idArchivo = idArchivo;
        this.nombre = nombre;
        this.archivo = archivo;
        this.idEntregaAvance = idEntregaAvance;
        this.idEntregaAct = idEntregaAct;
        this.idAnteproyecto = idAnteproyecto;
    }

    public int getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(int idArchivo) {
        this.idArchivo = idArchivo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public byte getArchivo() {
        return archivo;
    }

    public void setArchivo(byte archivo) {
        this.archivo = archivo;
    }

    public int getIdEntregaAvance() {
        return idEntregaAvance;
    }

    public void setIdEntregaAvance(int idEntregaAvance) {
        this.idEntregaAvance = idEntregaAvance;
    }

    public int getIdEntregaAct() {
        return idEntregaAct;
    }

    public void setIdEntregaAct(int idEntregaAct) {
        this.idEntregaAct = idEntregaAct;
    }

    public int getIdAnteproyecto() {
        return idAnteproyecto;
    }

    public void setIdAnteproyecto(int idAnteproyecto) {
        this.idAnteproyecto = idAnteproyecto;
    }
    
    @Override
    public String toString(){
        return this.nombre;
    }
}
