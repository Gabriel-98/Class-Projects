public class EscudoInactivo implements EstadoEscudo{
	public int actualizarResistencia(int resistencia){
		return resistencia - 1;
	}
}