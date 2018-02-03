package estructuras;

public class Trie {
	private int totalSymbols;
	private Node root;
	private final int NIL = -1;
	private final int idRoot = -2;
	
	public Trie(int totalSymbols){
		this.totalSymbols = totalSymbols;
		root = new Node(idRoot);
	}
	
	public void insert(int n, int[][] matriz){
		Node p = root;
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				int x = matriz[i][j];
				if(p.subnodes[x].getSymbol() == NIL){
					p.subnodes[x] = new Node(x);					
				}
				p = p.subnodes[x];
			}
		}
	}
	
	public boolean search(int n, int[][] matriz){
		int i,j;
		Node p = root;
		for(i=0; i<n; i++){
			for(j=0; j<n; j++){
				int x = matriz[i][j];
				if(p.subnodes[x].getSymbol() != NIL)
				p = p.subnodes[x];
				else
				break;
			}
			if(j < n)
			break;
		}
		if(i==n)
		return(true);
		return(false);
	}
	
	private class Node {
		private int symbol;
		private Node[] subnodes;
		
		public Node(int symbol){
			this.symbol = symbol;
			subnodes = new Node[totalSymbols];
			for(int i=0; i<totalSymbols; i++){
				subnodes[i] = new Node();
			}
		}
		
		public Node(){
			symbol = NIL;
		}
		
		public int getSymbol(){
			return(symbol);
		}
	}
}
