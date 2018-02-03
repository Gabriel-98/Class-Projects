// Declaracion de una pila y funciones prototipo

typedef struct {
	float V[20];
	int top;
}Stack;

void push(Stack *S, float val);
float pop(Stack *S);
void init(Stack *S);
int full(Stack *S);
void print(Stack *S);
