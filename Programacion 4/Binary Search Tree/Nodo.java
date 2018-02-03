public class Nodo<T extends Comparable<T>> implements Comparable<Nodo<T>>{
	private T info;
	private Nodo<T> padre;
	private Nodo<T> izq;
	private Nodo<T> der;

	public Nodo(T info, Nodo<T> padre, Nodo<T> izq, Nodo<T> der){
		this.info = info;
		this.padre = padre;
		this.izq = izq;
		this.der = der;
	}

	public T getInfo(){
		return info;
	}

	public Nodo<T> getNodoPadre(){
		return padre;
	}

	public Nodo<T> getNodoIzq(){
		return izq;
	}

	public Nodo<T> getNodoDer(){
		return der;
	}

	public void setNodoPadre(Nodo<T> padre){
		this.padre = padre;
	}

	public void setNodoIzq(Nodo<T> izq){
		this.izq = izq;
	}

	public void setNodoDer(Nodo<T> der){
		this.der = der;
	}

	@Override
	public int compareTo(Nodo<T> nodo2){
		return info.compareTo(nodo2.getInfo());
	}
}