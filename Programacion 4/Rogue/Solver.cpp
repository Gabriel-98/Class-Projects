#include<bits/stdc++.h>
#include "lib/game.h"
#include "lib/monster.h"
#include "lib/rogue.h"
using namespace std;

class Solver{
	public:
		Solver();
		void printGame();
		void start();
	private:
		int turno;
		int tiempoInicio, tiempoActual;
		Game game;
		Monster monster;
		Rogue rogue;
};

Solver::Solver(){	
	int n;
	cin>>n;
	Matriz matriz;
	matriz.read(n,n);
	Dungeon d(n, matriz);
	game= Game(d);
	monster= Monster(&game);
	rogue= Rogue(&game);
	turno=0;
}

void Solver::printGame(){
	game.getDungeon().print();
	cout<<"MonsterSite = "<< game.getMonsterSite().i() << " " << game.getMonsterSite().j() <<endl;
	cout<<"RogueSite = "<< game.getRogueSite().i() << " " << game.getRogueSite().j() << endl;
}

void Solver::start(){
	system("cls");
	printGame();
	tiempoInicio = clock();
	while(game.active()){
		tiempoActual = clock();
		if(tiempoActual >= tiempoInicio+1500){
			system("cls");
			if(turno==0)
			monster.move();
			else
			rogue.move();
			turno= (turno+1)%2;
			printGame();
			tiempoInicio= tiempoActual;
		}
	}
}

int main(){
	Solver solver;
	solver.start();
}
