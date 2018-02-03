import java.util.Scanner;

public class Main{
	public static void main(String[] args){
		Server server = new Server();
		User user1 = new User("user1", server);
		User user2 = new User("user2", server);
		User user3 = new User("user3", server);
		User user4 = new User("user4", server);
		User user5 = new User("user5", server);
		server.addUser(user1);
		server.addUser(user2);
		server.addUser(user3);
		server.setContenido("primer contenido");
		server.deleteObserver(user2);
		server.addUser(user4);
		server.addUser(user5);
		server.setContenido("segundo contenido");
		server.deleteObserver(user3);
		server.deleteObserver(user5);
		server.setContenido("tercer contenido");
	}
}