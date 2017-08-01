#include<iostream>
#include<vector>
#include<stack>
using namespace std;

struct nodo{
	int Sudoku[9][9];
};

int cont;
struct nodo SudokuSolucion;

vector<int> X(82);
vector<int> Y(82);
stack<struct nodo> R;

int valido(int Sudoku[][9], int y, int x){
	int i,j,num,x1,y1,x2,y2;
	num= Sudoku[y][x];
	for(j=0; j<9; j++){
		if(j!=x && Sudoku[y][j]==num)
		return(0);
	}
	for(i=0; i<9; i++){
		if(i!=y && Sudoku[i][x]==num)
		return(0);
	}
	x1= (x/3)*3;
	y1= (y/3)*3;
	x2= x1+2;
	y2= y1+2;
	for(i=y1; i<=y2; i++){
		for(j=x1; j<=x2; j++){
			if((i!=y || j!=x) && Sudoku[i][j]==num)
			return(0);
		}
	}
	return(1);
}

int Backtracking(int n, int etapa){
	if(etapa>n)
	return(0);
	else{
		struct nodo S;
		S= R.top();
		int exito;
		exito= 0;
		S.Sudoku[Y[etapa]][X[etapa]]=  0;
		while(S.Sudoku[Y[etapa]][X[etapa]] != 9 && cont<2){
			S.Sudoku[Y[etapa]][X[etapa]]++;
			if(valido(S.Sudoku,Y[etapa],X[etapa]) == 1){
				if(etapa!=n){
					R.push(S);
					exito= Backtracking(n,etapa+1);
				}
				else{
					cont++;
					SudokuSolucion= S;
					exito= 1;
				}
			}
		}
		return(exito);	
	}
}

void PrintSudoku(int Sudoku[][9]){
	cout<<endl<<endl<<" ...Solucion del Sudoku..."<<endl;
	int i,j;
	for(i=0; i<10; i++){
		if(i%3==0){
			cout<<" ";
			for(j=0; j<=24; j++){
				if(j%8==0 && i!=0)
				cout<<"|";
				else
				cout<<"_";
			}
			cout<<endl;
			if(i!=9){
				for(j=0; j<=25; j++){
					if((j-1)%8==0)
					cout<<"|";
					else
					cout<<" ";
				}
				cout<<endl;
			}
		}
		if(i<9){
			for(j=0; j<9; j++){
				if(j%3==0)
				cout<<" | "<<Sudoku[i][j];
				else
				cout<<" "<<Sudoku[i][j];
				if(j==8)
				cout<<" |";
			}
			cout<<endl;
		}
	}
}

int ValidarInicio(int Sudoku[][9]){
	for(int i=0; i<9; i++){
		for(int j=0; j<9; j++){
			if(Sudoku[i][j]!=0 && valido(Sudoku,i,j)==0)
			return(0);
		}
	}
	return(1);
}

int Solucion(int Sudoku[][9]){
	for(int i=0; i<9; i++){
		for(int j=0; j<9; j++){
			if(Sudoku[i][j]==0)
			return(0);
		}
	}
	return(1);
}

int main(){
	int i,j,empty_box,menor;
	struct nodo S;
	char box;
	empty_box= 1;
	cout<<"................................Sudoku..............................."<<endl<<endl;
	cout<<"[x] Las casillas vacias se representan con un guion (-)"<<endl;
	cout<<"[x] Ingrese 9 filas cada una con 9 valores separados por un espacio:"<<endl<<endl;
	for(i=0; i<9; i++){
		for(j=0; j<9; j++){
			cin>>box;
			if(box=='-'){
				S.Sudoku[i][j]= 0;
				Y[empty_box]= i;
				X[empty_box]= j; 
				empty_box++;
			}
			else
			S.Sudoku[i][j]= box-'0';
		}
	}
	if((81+1-empty_box) >= 17){
		if(ValidarInicio(S.Sudoku)==1){
			cont= 0;
			R.push(S);
			Backtracking(empty_box,1);
			S= R.top();
			if(cont==1 && Solucion(SudokuSolucion.Sudoku)==1)
			PrintSudoku(SudokuSolucion.Sudoku);
			else if(cont>1)
			cout<<endl<<endl<<"Multiples soluciones"<<endl;
			else
			cout<<endl<<endl<<"No tiene solucion"<<endl;
		}
		else
		cout<<endl<<endl<<"No tiene solucion"<<endl;
	}
	else
	cout<<endl<<endl<<"Tiene menos de 17 casillas conocidas"<<endl;
}
