public class Tree<T extends Comparable<T>>{
	private Nodo<T> raiz;

	public Tree(){
		raiz = null;
	}

	public void insert(T x){
		Nodo<T> nodo = new Nodo<T>(x, null, null, null);
		if(raiz == null){
			raiz = nodo;
		}
		else{
			Nodo<T> q = raiz;
			Nodo<T> r = raiz;
			while(r != null){
				q = r;
				if(nodo.compareTo(r) < 0)
				r = r.getNodoIzq();
				else
				r = r.getNodoDer();
			}
			nodo.setNodoPadre(q);
			if(nodo.compareTo(q) < 0)
			q.setNodoIzq(nodo);
			else
			q.setNodoDer(nodo);
		}
	}

	public void erase(T x){
		Nodo<T> nodo = new Nodo<T>(x, null, null, null);
		Nodo<T> q = raiz;
		while(q != null){
			if(nodo.compareTo(q) == 0)
			break;
			else{
				if(nodo.compareTo(q) < 0)
				q = q.getNodoIzq();
				else
				q = q.getNodoDer();
			}
		}
		if(q != null){
			Nodo<T> r,z;
			r = q.getNodoPadre();
			if(q.getNodoIzq()==null && q.getNodoDer()==null){
				if(q != raiz){
					if(q == r.getNodoIzq())
					r.setNodoIzq(null);
					else
					r.setNodoDer(null);
				}
				else
				raiz = null;
			}
			else if(q.getNodoIzq()!=null && q.getNodoDer()!=null){
				z = q.getNodoDer();
				while(z.getNodoIzq() != null){
					z = z.getNodoIzq();
				}
				if(q.getNodoDer() != z){
					Nodo<T> z1 = z.getNodoPadre();
					Nodo<T> z2 = z.getNodoDer();
					if(z1.getNodoIzq() == z)
					z1.setNodoIzq(z2);
					else
					z1.setNodoDer(z2);
					if(z2 != null)
					z2.setNodoPadre(z1);
				}

				Nodo<T> k = q.getNodoIzq();
				z.setNodoIzq(k);
				k.setNodoPadre(z);

				k = q.getNodoDer();
				if(k != z){
					z.setNodoDer(k);
					k.setNodoPadre(z);
				}

				z.setNodoPadre(r);
				if(r != null){
					if(q == r.getNodoIzq())
					r.setNodoIzq(z);
					else
					r.setNodoDer(z);
				}
				else
				raiz = z;
			}
			else{
				if(q.getNodoIzq()!=null)
				z = q.getNodoIzq();
				else
				z = q.getNodoDer();
				z.setNodoPadre(r);
				if(q != raiz){
					if(r.getNodoIzq()==q)
					r.setNodoIzq(z);
					else
					r.setNodoDer(z);
				}
				else
				raiz = z;
			}
		}
	}

	public void inorder(Nodo<T> nodo){
		if(nodo != null){
			inorder(nodo.getNodoIzq());
			System.out.print(nodo.getInfo() + " ");
			inorder(nodo.getNodoDer());
		}
	}

	public void print(){
		inorder(raiz);
		System.out.println();
	}

	public boolean find(T x){
		Nodo<T> nodo = new Nodo<T>(x, null, null, null);
		Nodo<T> q = raiz;
		while(q != null){
			if(nodo.compareTo(q) == 0)
			return true;
			else{
				if(nodo.compareTo(q) < 0)
				q = q.getNodoIzq();
				else
				q = q.getNodoDer();
			}
		}
		return false;
	}
}