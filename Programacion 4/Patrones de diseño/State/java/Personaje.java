public class Personaje{
	private int resistencia;
	private EstadoEscudo estadoEscudo;

	public Personaje(){
		resistencia = 20;
		estadoEscudo = new EscudoInactivo();
	}

	public int getResistencia(){
		return resistencia;
	}

	public void activarEscudo(){
		estadoEscudo = new EscudoActivo();
	}

	public void desactivarEscudo(){
		estadoEscudo = new EscudoInactivo();
	}

	public void recibeAtaque(){
		resistencia = estadoEscudo.actualizarResistencia(resistencia);
		System.out.println("La resistencia actual es: " + resistencia);
	}
}