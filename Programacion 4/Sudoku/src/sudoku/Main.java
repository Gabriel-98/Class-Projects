package sudoku;

import java.util.Scanner;

public class Main {
	public static void main(String[] args){
		double startTime, endTime, totalTime;
		Scanner scan = new Scanner(System.in);
		int[][] sudo = new int[9][9];
		for(int i=0; i<9; i++){
			for(int j=0; j<9; j++){
				String c = scan.next();
				if(c.equals("-"))
				sudo[i][j]= 0;
				else
				sudo[i][j] = Integer.parseInt(c);
			}
		}
		Sudoku sudoku = new Sudoku(sudo);
		startTime = System.currentTimeMillis();
		SolverSudoku s = new SolverSudoku(sudoku);
		s.printAnswer();
		endTime = System.currentTimeMillis();
		totalTime = (endTime - startTime)/1000;
		
		System.out.println("tiempo de solucion: " + totalTime + "s");
		scan.close();
	}
}
