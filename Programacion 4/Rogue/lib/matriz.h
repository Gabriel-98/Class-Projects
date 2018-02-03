#include<bits/stdc++.h>
#include "site.h"
using namespace std;

#ifndef matriz_h
#define matriz_h 

class Matriz{
	public:
		Matriz();
		Matriz(int n, int m);
		void insert(Site v, char val);
		char getElement(Site v);
		int sizeFil();
		int sizeCol();
		void read();
		void read(int n, int m);
		void copy(Matriz matriz);
		void print();
	private:
		int fil,col;
		char **matriz;
};

Matriz::Matriz(){
	fil=0;
	col=0;
}

Matriz::Matriz(int n, int m){
	fil=n;
	col=m;
	matriz = new char*[fil];
	for(int i=0; i<fil; i++){
		matriz[i]= new char[col];
	}
}

void Matriz::insert(Site v, char val){
	matriz[v.i()][v.j()]= val;
}

char Matriz::getElement(Site v){
	return(matriz[v.i()][v.j()]);
}

void Matriz::read(){
	string row;
	cin>>fil>>col;
	matriz = new char*[fil];
	for(int i=0; i<fil; i++){
		matriz[i]= new char[col];
	}
	fflush(stdin);
	for(int i=0; i<fil; i++){
		getline(cin, row);
		for(int j=0; j<col; j++){
			matriz[i][j]= row[j*2];
		}
	}
}

int Matriz::sizeFil(){
	return(fil);
}

int Matriz::sizeCol(){
	return(col);
}

void Matriz::read(int n, int m){
	string row;
	fil=n;
	col=m;
	matriz = new char*[fil];
	for(int i=0; i<fil; i++){
		matriz[i]= new char[col];
	}
	fflush(stdin);
	for(int i=0; i<fil; i++){
		getline(cin, row);
		for(int j=0; j<col; j++){
			matriz[i][j]= row[j*2];
		}
	}
}

void Matriz::copy(Matriz matriz){
	fil = matriz.sizeFil();
	col = matriz.sizeCol();
	this->matriz = new char*[fil];
	for(int i=0; i<fil; i++){
		this->matriz[i]= new char[col];
	}
	for(int i=0; i<fil; i++){
		for(int j=0; j<col; j++){
			Site v(i,j);
			this->insert(v, matriz.getElement(v));
		}
	}
}

void Matriz::print(){
	for(int i=0; i<fil; i++){
		for(int j=0; j<col; j++){
			cout<<matriz[i][j]<<" ";
		}
		cout<<endl;
	}
}

#endif
