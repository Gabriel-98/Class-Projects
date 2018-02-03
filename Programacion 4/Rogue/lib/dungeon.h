#include "matriz.h"
#include "site.h"

#ifndef dungeon_h 
#define dungeon_h

class Dungeon {
	public:
		Dungeon();
		Dungeon(int n, Matriz matriz);
		bool inMatriz(Site v);
		bool isLegalMove(Site v, Site w);  	// is moving from site v to w legal?
		bool isCorridor(Site v);           	// is site v a corridor site?
		bool isRoom(Site v);               	// is site v a room site?
		bool isMonster(Site v);				// is site v occupied by a Monster 
		bool isRogue(Site v);				// is site v occupiede by a Rogue
		int size();                        	// return N = dimension of dungeon
		void moveMonster(Site v, Site w);
		void moveRogue(Site v, Site w);
		bool validateDungeon();
		int BFS(Site v, Site w);
		int differenceToCorridor(Site v, Site w);
		bool sameRoom(Site v, Site w);
		void print();
	private:
		char monsterSymbol;
		char rogueSymbol;
		int n;
		Matriz mapa;
		Matriz tablero;
};

Dungeon::Dungeon(){
	n=0;
	tablero = Matriz();
	mapa = Matriz();
}

Dungeon::Dungeon(int n, Matriz matriz){
	this->n = n;
	tablero= matriz;
	mapa= Matriz();
	mapa.copy(matriz);
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			Site v(i,j);
			if(isMonster(v)){
				monsterSymbol= mapa.getElement(v);
				mapa.insert(v,'.');
			}
			else if(isRogue(v)){
				rogueSymbol= mapa.getElement(v);
				mapa.insert(v,'.');
			}			
		}
	}
}
	
bool Dungeon::inMatriz(Site v){
	if(v.i()>=0 && v.j()>=0 && v.i()<n && v.j()<n)
	return(true);
	return(false);
}

bool Dungeon::isLegalMove(Site v, Site w){
	if(!v.equals(w) && inMatriz(v) && inMatriz(w)){
		if(isRoom(v) && isRoom(w)){
			if(abs(v.i()-w.i())==1 || abs(v.j()-w.j())==1)
			return(true);
		}
		else if(isRoom(v) && isCorridor(w)){
			if(abs(v.i()-w.i()) + abs(v.j()-w.j()) == 1)
			return(true);
		}
		else if(isCorridor(v) && (isRoom(w) || isCorridor(w))){
			if(abs(v.i()-w.i()) + abs(v.j()-w.j()) == 1)
			return(true);
		}
	}
	return(false);
}

bool Dungeon::isCorridor(Site v){
	if(inMatriz(v) && mapa.getElement(v)=='+')
	return(true);
	return(false);
}

bool Dungeon::isRoom(Site v){
	if(inMatriz(v) && mapa.getElement(v)=='.')
	return(true);
	return(false);
}

bool Dungeon::isMonster(Site v){
	if(tablero.getElement(v)>='A' && tablero.getElement(v)<='Z')
	return(true);
	return(false);
}

bool Dungeon::isRogue(Site v){
	if(tablero.getElement(v)=='@')
	return(true);
	return(false);
}

void Dungeon::moveMonster(Site v, Site w){
	tablero.insert(v, mapa.getElement(v));
	tablero.insert(w, monsterSymbol);
}

void Dungeon::moveRogue(Site v, Site w){
	tablero.insert(v, mapa.getElement(v));
	tablero.insert(w, rogueSymbol);
}

int Dungeon::size(){
	return(n);
}

void Dungeon::print(){
	tablero.print();
}

bool Dungeon::validateDungeon(){
	int numMonster=0,numRogue=0;
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			Site v(i,j);
			if(isMonster(v))
			numMonster++;
			else if(isRogue(v))
			numRogue++;
		}
	}
	if(numMonster==1 && numRogue==1)
	return(true);
	return(false);
}

int Dungeon::BFS(Site v, Site w){
	int M[n][n];
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			M[i][j]=-1;
		}
	}
	M[v.i()][v.j()]= 0;
	queue<Site> Q;
	Q.push(v);
	while(!Q.empty()){
		Site v = Q.front();
		Q.pop();
		for(int i=-1; i<=1; i++){
			for(int j=-1; j<=1; j++){
				Site w(v.i()+i, v.j()+j);
				if(isLegalMove(v,w) && M[w.i()][w.j()]==-1){
					M[w.i()][w.j()]= M[v.i()][v.j()]+1;
					Q.push(w);
				}
			}
		}
	}
	return(M[w.i()][w.j()]);
}

bool Dungeon::sameRoom(Site v, Site w){
	if(isRoom(v) && isRoom(w)){
		int M[n][n];
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++){
				M[i][j]=0;
			}
		}
		M[v.i()][v.j()]= 1;
		queue<Site> Q;
		Q.push(v);
		while(!Q.empty()){
			Site v = Q.front();
			Q.pop();
			for(int i=-1; i<=1; i++){
				for(int j=-1; j<=1; j++){
					Site w(v.i()+i, v.j()+j);
					if(isRoom(v) && isRoom(w) && isLegalMove(v,w) && M[w.i()][w.j()]==0){
						M[w.i()][w.j()]= 1;
						Q.push(w);
					}
				}
			}
		}
		return(M[w.i()][w.j()]==1);
	}
	return(false);
}

int Dungeon::differenceToCorridor(Site v, Site w){
	int M[n][n];
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			M[i][j]=0;
		}
	}
	M[v.i()][v.j()]= 1;
	queue<Site> Q;
	Q.push(v);
	while(!Q.empty()){
		Site x = Q.front();
		Q.pop();
		for(int i=-1; i<=1; i++){
			for(int j=-1; j<=1; j++){
				Site y(x.i()+i, x.j()+j);
				if(isRoom(x) && isRoom(y) && isLegalMove(x,y) && M[y.i()][y.j()]==0){
					M[y.i()][y.j()]= 1;
					Q.push(y);
				}
			}
		}
	}
	int dist1,dist2,difMayor=-1,dif;
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			Site z(i,j);
			if(isCorridor(z)){
				Site a(z.i()-1,z.j()), b(z.i()+1,z.j()), c(z.i(),z.j()-1), d(z.i(),z.j()+1);
				int cond=0;
				if(inMatriz(a) && M[a.i()][a.j()]==1)
				cond=1;
				if(inMatriz(b) && M[b.i()][b.j()]==1)
				cond=1;
				if(inMatriz(c) && M[c.i()][c.j()]==1)
				cond=1;
				if(inMatriz(d) && M[d.i()][d.j()]==1)
				cond=1;
				if(cond==1){
					dist1= BFS(v,z);
					dist2= BFS(w,z);
					dif= dist2-dist1;
					difMayor= max(difMayor,dif);
				}
			}
		}
	}
	return(difMayor);
}

#endif
