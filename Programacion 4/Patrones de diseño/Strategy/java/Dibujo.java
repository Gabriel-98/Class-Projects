public class Dibujo{
	private EstrategiaTriangulo estrategiaTriangulo;

	public Dibujo(){
		estrategiaTriangulo = new EstrategiaTrianguloCentro(3);
	}

	public void setEstrategiaTriangulo(EstrategiaTriangulo estrategiaTriangulo){
		this.estrategiaTriangulo = estrategiaTriangulo;
	}

	public void dibujarTriangulo(){
		estrategiaTriangulo.dibujar();
	}
}