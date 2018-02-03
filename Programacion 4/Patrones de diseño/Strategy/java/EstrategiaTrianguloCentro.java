public class EstrategiaTrianguloCentro extends EstrategiaTriangulo{
	
	public EstrategiaTrianguloCentro(int tam){
		super(tam);
	}

	@Override
	public void dibujar(){
		for(int i=0; i<tam; i++){
			int x = tam - i - 1;
			for(int j=0; j<x; j++){
				System.out.print(" ");
			}
			System.out.println(triangulo[i]);
		}
	}
}