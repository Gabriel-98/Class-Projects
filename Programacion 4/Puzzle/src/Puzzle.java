import java.util.*;
import estructuras.*;

public class Puzzle {
	public static void main(String[] args){
		int n;
		Scanner scanner = new Scanner(System.in);
		System.out.print("Ingrese el tamaño de la matriz: ");
		n = scanner.nextInt();
		int matriz[][] = new int[n][n];
		System.out.println("Ingrese la matriz: ");
		matriz = Solver.read(n);
		if(Solver.validateBoard(n, matriz)){
			Board initial = new Board(n, matriz);
			Solver ans = new Solver(initial);
			ans.showSolution();
		}
		else{
			System.out.print("El puzzle no contine todos los numeros de 0 a n-1");
		}
		scanner.close();
	}
}