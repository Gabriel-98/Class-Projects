#include<iostream>
#include "stack.h"
using namespace std;

void push(Stack *S, float val){
	if(S->top < 20){
		S->V[S->top]= val;
		(S->top)++;
	}
}

float pop(Stack *S){
	(S->top)--;
	return(S->V[S->top]);
}

void init(Stack *S){
	S->top= 0;
}

int full(Stack *S){
	if(S->top == 20)
	return(1);
	else
	return(0);
}

void print(Stack *S){
	if(S->top == 0)
	cout<<"La pila esta vacia"<<endl;
	else{
		cout<<"Stack = {";
		for(int i=(S->top)-1; i>=0; i--){
			cout<< S->V[i];
			if(i!=0)
			cout<<", ";
		}
		cout<<"}"<<endl;
	}
}

void printMenu(){
	cout<<"1. Adicionar elemento"<<endl;
	cout<<"2. Eliminar elemento"<<endl;
	cout<<"3. Pila llena?"<<endl;
	cout<<"4. Imprimir pila"<<endl;
}

int main(){
	int op;
	float x;
	Stack S;
	init(&S);
	printMenu();
	while(cin>>op){
		if(op==1){
			if(S.top < 20){
				cout<<"Ingrese un numero: ";
				cin>>x;
				push(&S,x);
				cout<<"El elemento "<<x<<" ha sido insertado en la pila"<<endl;
			} 
			else
			cout<<"No se pueden insertar mas elementos"<<endl;
		}
		else if(op==2){
			if((S.top) == 0)
			cout<<"La pila esta vacia"<<endl;
			else
			cout<<"El elemento "<<pop(&S)<<" ha sido eliminado de la pila"<<endl;
		}
		else if(op==3){
			cout<<"La pila ";
			if(!full(&S))
			cout<<"NO ";
			cout<<"esta llena"<<endl;
		}
		else if(op==4)
		print(&S);
		else
		cout<<"No existe operacion"<<endl;
		
		printMenu();
	}
}
