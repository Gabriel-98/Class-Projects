package sudoku;

public class Sudoku {
	private int[][] tablero;
	private int numBox;
	
	public Sudoku(int[][] tablero){
		this.tablero = new int[9][9];
		numBox = 0;
		for(int i=0; i<9; i++){
			for(int j=0; j<9; j++){
				this.tablero[i][j] = tablero[i][j];
				if(!isEmptyBox(i,j))
				numBox++;
			}
		}
	}
	
	public Sudoku(Sudoku sudoku){
		this.tablero = new int[9][9];
		numBox = 0;
		for(int i=0; i<9; i++){
			for(int j=0; j<9; j++){
				this.tablero[i][j] = sudoku.getBox(i, j);
				if(!isEmptyBox(i,j))
				numBox++;
			}
		}
	}
	
	public void print(){
		for(int i=0; i<9; i++){
			for(int j=0; j<9; j++){
				System.out.print(tablero[i][j] + " ");
			}
			System.out.println();
		}
		System.out.println();
	}
	
/*	public void updateCandidates(){
		for(int i=0; i<9; i++){
			for(int j=0; j<9; j++){
				deleteCandidate(i, j);
			}
		}
	}
	
	public void deleteCandidate(int row, int column){
		
	}*/
	
	public boolean isEmptyBox(int i, int j){
		return(tablero[i][j] == 0);
	}
	
	public boolean isCorrect(){
		if(numBox!=81)
		return(false);
		// rows and columns
		for(int i=0; i<9; i++){
			int[] row = new int[10];
			int[] column = new int[10];
			for(int j=0; j<9; j++){
				row[tablero[i][j]] = 1;
				column[tablero[j][i]] = 1;
			}
			for(int j=1; j<=9; j++){
				if(row[j]==0 || column[j]==0)
				return(false);
			}
		}
		// blocks
		for(int y=0; y<3; y++){
			for(int x=0; x<3; x++){
				int[] block = new int[10];
				for(int i=0; i<3; i++){
					for(int j=0; j<3; j++){
						block[tablero[(y*3)+i][(x*3)+j]] = 1;
					}
				}
				for(int i=1; i<=9; i++){
					if(block[i]==0)
					return(false);
				}
			}
		}
		return(true);
	}
	
	public void insertBox(int i, int j, int val){
		if(tablero[i][j]==0)
		numBox++;
		tablero[i][j]= val;
		
	}
	
	public int getBox(int i, int j){
		return(tablero[i][j]);
	}
	
	public boolean isPossibleValue(int y, int x, int val){
		int Y,X,i,j;
		if(val<=0 || val>=10)
		return(false);
		for(j=0; j<9; j++){
			if(x!=j && val==tablero[y][j])
			return(false);
		}
		for(i=0; i<9; i++){
			if(y!=i && val==tablero[i][x])
			return(false);
		}
		Y = y/3;
		X = x/3;
		for(i=0; i<3; i++){
			for(j=0; j<3; j++){
				if(( (X*3)+j!=x || (Y*3)+i!=y ) && val==tablero[(Y*3)+i][(X*3)+j])
				return(false);
			}
		}
		return(true);
	}
}
