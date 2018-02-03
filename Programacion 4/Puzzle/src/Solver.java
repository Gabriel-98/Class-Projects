import java.util.*;
import estructuras.*;

public class Solver {
	private Board solution;
	private boolean isSolution;
	
	public Solver(Board initial){
		if(!isSolvableBoard(initial.size(), initial.matriz()))
		isSolution = false;
		else{
			isSolution = true;
			int x,y,n,hamming,manhattan,posX,posY,moves,i,j,l;
			int[][] matriz,matriz2;
	        Board predecessor;
	        Trie boards = new Trie(initial.size() * initial.size());
			PriQueue<Board> PQ = new PriQueue<Board>(Board.class,200000);
			PQ.push(initial);
			while(!PQ.empty()){
				Board B = PQ.front();
				PQ.pop();
				boards.insert(B.size(), B.matriz());
				if(B.isFinalBoard()){
					solution = new Board(B.size(), B.matriz(), B.predecessor, B.hamming(), B.manhattan(), B.posX(), B.posY(), B.moves(), B.dirX(), B.dirY());
					break;
				}
				for(l=0; l<4; l++){
					if(l==0){
						i=-1; j=0;
					}
					else if(l==1){
						i=0; j=1;
					}
					else if(l==2){
						i=1; j=0;
					}
					else{
						i=0; j=-1;
					}
					n = B.size();
					matriz = B.matriz();
	                predecessor = B;
					hamming = B.hamming();
					manhattan = B.manhattan();
					posX = B.posX();
					posY = B.posY();
					moves = B.moves();
					if(posY+i>=0 && posY+i<n && posX+j>=0 && posX+j<n){
						if(matriz[posY+i][posX+j] != 0 && matriz[posY+i][posX+j] != ((posY+i)*n)+(posX+j)+1)
						hamming--;
						
						if(matriz[posY+i][posX+j] != 0){
							y = (matriz[posY+i][posX+j]-1) / n;
							x = (matriz[posY+i][posX+j]-1) % n;
							manhattan -= Math.abs(y-(posY+i)) + Math.abs(x-(posX+j));
						}
						matriz2 = copyMatriz(n, matriz);
						matriz2 = swap(matriz2, posY, posX, posY+i, posX+j);
		
						if(matriz2[posY][posX] != 0 && matriz2[posY][posX] != ((posY)*n)+(posX)+1)
						hamming++;	
						if(matriz2[posY][posX] != 0){
							y = (matriz2[posY][posX]-1) / n;
							x = (matriz2[posY][posX]-1) % n;
							manhattan += Math.abs(y-posY) + Math.abs(x-posX);
						}
					
	                    Board a = new Board(n, matriz2, predecessor, hamming, manhattan, posX+j, posY+i, moves+1, j, i);
	                    if(moves==0 || moves==1 || boards.search(3, a.matriz())==false)
	                    PQ.push(a);
					}
				}
			}
		}
	}
	
	public boolean isSolvableBoard(int n, int[][] matriz2){
		int [][] matriz  = copyMatriz(n, matriz2);
		int temp,x,y,val,lim,cont,i,j,l;
		lim = n*n;
		int[] X,Y;
		X = new int[lim];
		Y = new int[lim];
		for(i=0; i<n; i++){
			for(j=0; j<n; j++){
				val = matriz[i][j];
				X[val] = j;
				Y[val] = i;
			}
		}
		cont = 0;
		for(l=1; l<lim; l++){
			y = (l-1)/n;
			x = (l-1)%n;
			if(x < X[l]){
				for(j=X[l]-1,i=Y[l]; j>=x; j--){
					if(matriz[i][j] != 0)
					cont++;
					temp = matriz[i][j];
					matriz[i][j] = matriz[i][j+1];
					matriz[i][j+1] = temp;
					X[l] = j;
					X[matriz[i][j+1]] = j+1;
				}
			}
			else if(x > X[l]){
				for(j=X[l]+1,i=Y[l]; j<=x; j++){
					if(matriz[i][j] != 0)
					cont++;
					temp = matriz[i][j];
					matriz[i][j] = matriz[i][j-1];
					matriz[i][j-1] = temp;
					X[l] = j;
					X[matriz[i][j-1]] = j-1;
				}
			}
			if(y < Y[l]){
				for(i=Y[l]-1,j=X[l]; i>=y; i--){
					if(matriz[i][j] != 0)
					cont++;
					temp = matriz[i][j];
					matriz[i][j] = matriz[i+1][j];
					matriz[i+1][j] = temp;
					Y[l] = i;
					Y[matriz[i+1][j]] = i+1;
				}
			}
		}
		if(cont%2 == 0)
		return(true);
		return(false);
	}
	
	private int[][] copyMatriz(int n, int[][] matriz){
		int[][] matriz2 = new int[n][n];
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				matriz2[i][j] = matriz[i][j];
			}
		}
		return(matriz2);
	}
	
	private int[][] swap(int[][] matriz, int y1, int x1, int y2, int x2){
		int temp;
		temp = matriz[y1][x1];
		matriz[y1][x1] = matriz[y2][x2];
		matriz[y2][x2] = temp;
		return(matriz);
	}
	
	public boolean isSolvable(){
		if(isSolution)
		return(true);
		return(false);
	}
	
	public int moves(){
		return(solution.moves());
	}
	
	public void showSolution(){
		if(isSolvable()){
			System.out.println("Number of moves = " + " " + moves());
            printSequence(solution);          
		}
		else
		System.out.println("No solution possible");
	}
	
	private void printSequence(Board B){
		if(B.moves() > 0){
			printSequence(B.predecessor);
			B.print();
		}
		else
		B.print();
	}
	
	public static boolean validateBoard(int n, int[][] matriz){
		int lim,i,j;
		lim= n*n;
		int B[] = new int[lim];
		for(i=0; i<n; i++){
			for(j=0; j<n; j++){
				if(matriz[i][j] < lim)
				B[matriz[i][j]] = 1;
			}
		}
		for(i=0; i<lim; i++){
			if(B[i]==0)
			return(false);
		}
		return(true);
	}
	
	public static int[][] read(int n){
		Scanner scanner = new Scanner(System.in);
		int matriz[][] = new int[n][n];
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				matriz[i][j]= scanner.nextInt();
			}
		}
		scanner.close();
		return(matriz);
	}
}