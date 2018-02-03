// Declaracion de una pila y funciones prototipo

typedef struct nodo {
	float info;
	struct nodo *next;
}Stack;

Stack *push(Stack *S, float val);
float pop(Stack *S);
void print(Stack *S);
