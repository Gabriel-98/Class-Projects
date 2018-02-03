public class Server extends Observable{
	private String contenido;

	public Server(){
		contenido = "";
	}

	public void addUser(User user){
		addObserver(user);
		notifyObserver(user);
	}

	public String getContenido(){
		return contenido;
	}

	public void setContenido(String contenido){
		this.contenido = contenido;
		notifyObserver();
		System.out.println();
	}
}