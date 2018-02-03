public class Escaleno extends Triangulo{

	public Escaleno(double ladoA, double ladoB, double ladoC){
		super(ladoA, ladoB, ladoC);
	}
	
	public void descripcion(){
		System.out.println("Triangulo Escaleno");
		System.out.println("lado A: " + ladoA);
		System.out.println("lado B: " + ladoB);
		System.out.println("lado C: " + ladoC);
	}
}