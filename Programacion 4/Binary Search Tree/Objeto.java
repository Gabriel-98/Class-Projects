public class Objeto implements Comparable<Objeto>{
	private int x;
	
	public Objeto(int x){
		this.x = x
	}

	public int getValor(){
		return x;
	}

	public int compareTo(Objeto objeto){
		return x.compareTo(objeto.getValor());
	}
}