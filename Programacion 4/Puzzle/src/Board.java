import estructuras.*;

public class Board implements Comparable<Board> {
	private int[][] matriz;
    public Board predecessor;
	private int n;
	private int hamming;
	private int manhattan;
	private int posX;
	private int posY;
	private int moves;
	private int dirX;
	private int dirY;
	
	public Board(int n, int[][] matriz) {
		this.n = n;
		this.matriz = new int[n][n];
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				this.matriz[i][j] = matriz[i][j];
			}
		}
		getHamming();
		getManhattan();
		getPosXY();
		moves = 0;
		dirX = 0;
		dirY = 0;
	}
	
	public Board(int n, int[][] matriz, Board predecesor, int hamming, int manhattan, int posX, int posY, int moves, int dirX, int dirY) {
		this.n = n;
		this.matriz = new int[n][n];
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				this.matriz[i][j] = matriz[i][j];
			}
		}
        this.predecessor = predecesor;
		this.hamming = hamming;
		this.manhattan = manhattan;
		this.posX = posX;
		this.posY = posY;
		this.moves = moves;
		this.dirX = dirX;
		this.dirY = dirY;
	}
	
	public int compareTo(Board matriz2){
		int a,b;
		a = manhattan + moves;
		b = matriz2.manhattan() + matriz2.moves();
		return(a - b);
	}
	
	public boolean isFinalBoard(){
		return(hamming + manhattan == 0);
	}
	
	private void getHamming(){
		hamming=0;
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				if(matriz[i][j] != 0 && matriz[i][j] != (i*n)+j+1)
				hamming++;
			}
		}
	}
	
	private void getManhattan(){
		int x,y;
		manhattan = 0;
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				if(matriz[i][j] != 0){
					y = (matriz[i][j]-1) / n;
					x = (matriz[i][j]-1) % n;
					manhattan += Math.abs(y-i) + Math.abs(x-j);
				}
			}
		}
	}
	
	private void getPosXY(){
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				if(matriz[i][j] == 0){
					posX = j;
					posY = i;
				}
			}
		}
	}
	
	public void print(){
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				System.out.print(matriz[i][j] + " ");
			}
			System.out.println();
		}
		System.out.println();
	}
	
	public int size() {
		return(n);
	}
	
	public int[][] matriz(){
		return(matriz);
	}
	
	public int hamming(){
		return(hamming);
	}
	
	public int manhattan(){
		return(manhattan);
	}
	
	public int posX(){
		return(posX);
	}
	
	public int posY(){
		return(posY);
	}
	
	public int moves(){
		return(moves);
	}
	
	public int dirX(){
		return(dirX);
	}
	
	public int dirY(){
		return(dirY);
	}
}

