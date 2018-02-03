public class Main{
	
	public static void main(String[] args){
		Personaje personaje = new Personaje();
		System.out.println("La resistencia inicial es: " + personaje.getResistencia());
		personaje.recibeAtaque();
	    personaje.recibeAtaque();
	    personaje.activarEscudo();
	    personaje.recibeAtaque();
	    personaje.desactivarEscudo();
	    personaje.recibeAtaque();
	}
}