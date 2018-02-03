public abstract class Triangulo{
	protected double ladoA;
	protected double ladoB;
	protected double ladoC;

	public Triangulo(double ladoA, double ladoB, double ladoC){
		this.ladoA = ladoA;
		this.ladoB = ladoB;
		this.ladoC = ladoC;
	}

	public abstract void descripcion();

	public double calcularPerimetro(){
		double perimetro = ladoA + ladoB + ladoC;
		return perimetro;
	}

	public double calcularArea(){
		double s,area;
		s = (ladoA+ladoB+ladoC)/2;
		area = Math.sqrt(s*(s-ladoA)*(s-ladoB)*(s-ladoC));
		return area;
	}
}