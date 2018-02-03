public class User implements Observer{
	private String nombre;
	private String contenido;
	private Server server;

	public User(String nombre, Server server){
		this.nombre = nombre;
		this.server = server;
		contenido = "";
	}

	@Override
	public void update(){
		this.contenido = server.getContenido();
		System.out.println(nombre + " ya fue notificado");
	}
}