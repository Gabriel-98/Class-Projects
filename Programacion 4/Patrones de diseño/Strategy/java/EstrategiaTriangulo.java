public abstract class EstrategiaTriangulo{
	protected int tam;
	protected String[] triangulo;

	public EstrategiaTriangulo(int tam){
		this.tam = tam;
		triangulo = new String[tam];
		for(int i=0; i<tam; i++){
			triangulo[i] = "*";
			for(int j=1; j<=i; j++){
				triangulo[i] += " *";
			}
		}
	}

	public abstract void dibujar();
}