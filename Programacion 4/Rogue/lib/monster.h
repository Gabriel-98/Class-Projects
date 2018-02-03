#include "game.h"
#include "site.h"

#ifndef monster_h 
#define monster_h

class Monster{
	public:
		Monster();
		Monster(Game *g);   	// create a new monster who is playing a game g
		void move();        	// the adjacent site to which you are moving
	public:
		Game *game;
};

Monster::Monster(){
	game= NULL;
}

Monster::Monster(Game *g){
	game= g;
}

void Monster::move(){
	Site monsterSite,rogueSite,nextMonsterSite,w;
	monsterSite= (*game).getMonsterSite();
	rogueSite= (*game).getRogueSite();
	monsterSite.restartIterador();
	if(!(*game).getDungeon().sameRoom(monsterSite, rogueSite)){
		int distMinima=-1,dist;
		while(monsterSite.hasNext()){
			w= monsterSite.next();
			if((*game).getDungeon().isLegalMove(monsterSite,w)){
				dist= (*game).getDungeon().BFS(w, rogueSite);
				if(distMinima==-1 || dist<distMinima){
					distMinima= dist;
					nextMonsterSite= w;
				}
			}
		}
		(*game).moveMonster(nextMonsterSite);
	}
	else{
		int distMinima=-1,dist;
		double distMinima2=-1,dist2;
		while(monsterSite.hasNext()){
			w= monsterSite.next();
			if((*game).getDungeon().isLegalMove(monsterSite,w)){
				dist= (*game).getDungeon().BFS(w, rogueSite);
				dist2= w.distanciaEuclidiana(rogueSite);
				
				if(distMinima==-1 || dist<distMinima || (dist==distMinima && dist2<distMinima2)){
					distMinima= dist;
					distMinima2= dist2;
					nextMonsterSite= w;
				}
			}
		}
		(*game).moveMonster(nextMonsterSite);
	}
}

#endif
