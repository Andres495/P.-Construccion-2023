package sistemaspger.connectionBD;

import sistemaspger.POJO.Usuario;

public class UsuarioResponse {
    private int connectionResponse;
    private Usuario userResponse;
    
    public UsuarioResponse(Usuario userResponse) {
        this.userResponse = userResponse;
    }

    public UsuarioResponse(int connectionResponse, Usuario userResponse) {
        this.connectionResponse = connectionResponse;
        this.userResponse = userResponse;
    }
    
    public UsuarioResponse() {
    }

    public void setConnectionResponse(int connectionResponse) {
        this.connectionResponse = connectionResponse;
    }

    public void setUserResponse(Usuario userResponse) {
        this.userResponse = userResponse;
    }

    public int getConnectionResponse() {
        return this.connectionResponse;
    }

    public Usuario getUserResponse() {
        return this.userResponse;
    }
}
