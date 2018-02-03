public class EstrategiaTrianguloIzquierdo extends EstrategiaTriangulo{

	public EstrategiaTrianguloIzquierdo(int tam){
		super(tam);
	}

	@Override
	public void dibujar(){
		for(int i=0; i<tam; i++){
			System.out.println(triangulo[i]);
		}
	}
}