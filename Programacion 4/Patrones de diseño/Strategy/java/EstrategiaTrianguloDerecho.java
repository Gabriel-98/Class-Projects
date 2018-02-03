public class EstrategiaTrianguloDerecho extends EstrategiaTriangulo{
	
	public EstrategiaTrianguloDerecho(int tam){
		super(tam);
	}

	@Override
	public void dibujar(){
		for(int i=0; i<tam; i++){
			int x = 2*(tam - i - 1);
			for(int j=0; j<x; j++){
				System.out.print(" ");
			}
			System.out.println(triangulo[i]);
		}
	}
}