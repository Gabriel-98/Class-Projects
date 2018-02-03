public class Main{
	
	public static void main(String[] args){
		FabricaTriangulo fabrica = new FabricaTriangulo();
		Triangulo triangulo = fabrica.crearTriangulo(3.0, 4.0, 5.0);
		triangulo.descripcion();
		System.out.println("Perimetro: " + triangulo.calcularPerimetro());
		System.out.println("Area: " + triangulo.calcularArea());
	}
}