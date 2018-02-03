package sudoku;

public class SolverSudoku {
	private Sudoku solution;
	private boolean existSolution;
	private boolean onlySolution;
	
	public SolverSudoku(Sudoku sudo){
		existSolution = false;
		onlySolution = false;
		backtracking(sudo);
	}
	
	private void backtracking(Sudoku sudo){
		if(sudo.isCorrect()){
			solution = sudo;
			if(existSolution)
			onlySolution= false;
			else{
				existSolution = true;
				onlySolution = true;
			}
		}
		else{
			int y=0, x=0, i, j, val;
			for(i=0; i<9; i++){
				for(j=0; j<9; j++){
					if(sudo.isEmptyBox(i, j)){
						y = i;
						x = j;
						break;
					}
				}
				if(j<9)
				break;
			}
			if(y!=9 && x!=9){
				Sudoku sudo2 = new Sudoku(sudo);
				for(val=1; val<=9; val++){
					if(sudo.isPossibleValue(y, x, val)){
						sudo2.insertBox(y,  x, val);
						backtracking(sudo2);
					}
				}
			}
		}
	}
	
	private void printSolution(){
		solution.print();
	}
	
	public void printAnswer(){
		if(existSolution && onlySolution)
		printSolution();
		else{
			if(!existSolution)
			System.out.println("El sudoku no tiene solucion.");
			else
			System.out.println("El sudoku no tiene solucion unica.");
		}
	}
}
