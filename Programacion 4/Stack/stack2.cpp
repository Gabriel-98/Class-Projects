#include<iostream>
#include<stdlib.h>
#include "stack2.h"
using namespace std;

Stack *push(Stack *S, float val){
	Stack *p;
	p= (Stack*)malloc(sizeof(Stack));
	p->info= val;
	if(S==NULL){
		p->next= p;
		S= p;
	}
	else{
		p->next= S->next;
		S->next= p;
	}
	return(S);
}

float pop(Stack **S){
	if((*S)!=NULL){
		float x;
		Stack *p;
		if((*S)->next == (*S)){
			p= *S;
			x= p->info;
			(*S)=NULL;
		}
		else{
			p= (*S)->next;
			(*S)->next= (*S)->next->next;
			x= p->info;
			free(p);
		}
		return(x);
	}
}

void print(Stack *S){
	if(S==NULL)
	cout<<"La pila esta vacia"<<endl;
	else{
		Stack *p;
		p= S->next;
		cout<<"Stack = {";
		while(p!=S){
			cout<< p->info <<", ";
			p= p->next;
		}
		cout<< S->info <<"}"<<endl;
	}
}

void printMenu(){
	cout<<"1. Adicionar elemento"<<endl;
	cout<<"2. Eliminar elemento"<<endl;
	cout<<"3. Imprimir pila"<<endl;
}

int main(){
	int op;
	float x;
	Stack *S;
	S= (Stack*)malloc(sizeof(Stack));
	S= NULL;
	printMenu();
	while(cin>>op){
		if(op==1){
			cout<<"Ingrese un numero: ";
			cin>>x;
			S=push(S,x);
			cout<<"El elemento "<<x<<" ha sido insertado en la pila"<<endl;
		}
		else if(op==2){
			if(S==NULL)
			cout<<"La pila esta vacia"<<endl;
			else
			cout<<"El elemento "<<pop(&S)<<" ha sido eliminado de la pila"<<endl;
		}
		else if(op==3)
		print(S);
		else
		cout<<"No existe operacion"<<endl;
		printMenu();
	}
}
