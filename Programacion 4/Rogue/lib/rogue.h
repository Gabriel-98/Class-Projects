#include "game.h"
#include "site.h"

#ifndef rogue_h 
#define rogue_h

class Rogue{
	public:
		Rogue();
		Rogue(Game *g);      // create a new rogue who is playing a game g
		void move();        // the adjacent site to which you are moving
	public:
		Game *game;
};

Rogue::Rogue(){
	game= NULL;
}

Rogue::Rogue(Game *g){
	game= g;
}

void Rogue::move(){
	Site monsterSite,rogueSite,nextRogueSite,w;
	monsterSite= (*game).getMonsterSite();
	rogueSite= (*game).getRogueSite();
	rogueSite.restartIterador();
	if(!(*game).getDungeon().sameRoom(monsterSite, rogueSite)){
		int distMaxima=-1,dist;
		while(rogueSite.hasNext()){
			w= rogueSite.next();
			if((*game).getDungeon().isLegalMove(rogueSite,w)){
				dist= (*game).getDungeon().BFS(w, monsterSite);
				if(dist>distMaxima){
					distMaxima= dist;
					nextRogueSite= w;
				}
			}
		}
		(*game).moveRogue(nextRogueSite);
	}
	else{
		int difMaxima=-1,distMaxima=-1,dif,dist;
		while(rogueSite.hasNext()){
			w= rogueSite.next();
			if((*game).getDungeon().isLegalMove(rogueSite,w)){
				dif= (*game).getDungeon().differenceToCorridor(w, monsterSite);
				dist= (*game).getDungeon().BFS(w, monsterSite);
				if(dif>difMaxima || (dif==difMaxima && dist>distMaxima)){
					difMaxima= dif;
					distMaxima= dist;
					nextRogueSite= w;
				}
			}
		}
		(*game).moveRogue(nextRogueSite);
	}
}

#endif
