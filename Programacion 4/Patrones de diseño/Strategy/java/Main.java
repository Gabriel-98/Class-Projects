public class Main{
	
	public static void main(String[] args){
		Dibujo dibujo = new Dibujo();
		dibujo.dibujarTriangulo();
		dibujo.setEstrategiaTriangulo(new EstrategiaTrianguloDerecho(5));
		dibujo.dibujarTriangulo();
		dibujo.setEstrategiaTriangulo(new EstrategiaTrianguloIzquierdo(2));
		dibujo.dibujarTriangulo();
	}
}