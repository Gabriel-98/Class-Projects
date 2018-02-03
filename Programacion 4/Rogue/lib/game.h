#include "site.h"
#include "dungeon.h"

#ifndef game_h 
#define game_h

class Game{
	public:
		Game();
		Game(Dungeon dungeon);
		Site getMonsterSite();                // return the site occupied by the monster
		Site getRogueSite();                  // return the site occupied by the rogue
		Dungeon getDungeon();                 // return the dungeon
		void moveMonster(Site v);
		void moveRogue(Site v);
		bool active();
	private:
		Site monsterSite;
		Site rogueSite;
		Dungeon dungeon;
};

Game::Game(){
	dungeon = Dungeon();
}

Game::Game(Dungeon dungeon){
	this->dungeon = dungeon;
	for(int i=0; i<dungeon.size(); i++){
		for(int j=0; j<dungeon.size(); j++){
			Site v(i,j);
			if(dungeon.isMonster(v))
			monsterSite = v;
			else if(dungeon.isRogue(v))
			rogueSite = v;
		}
	}
}

Site Game::getMonsterSite(){
	return(monsterSite);
}

Site Game::getRogueSite(){
	return(rogueSite);
}

Dungeon Game::getDungeon(){
	return(dungeon);
}

void Game::moveMonster(Site v){
	if(dungeon.isLegalMove(monsterSite,v)){
		dungeon.moveMonster(monsterSite, v);
		monsterSite= v;
	}
}

void Game::moveRogue(Site v){
	if(dungeon.isLegalMove(rogueSite, v)){
		dungeon.moveRogue(rogueSite, v);
		rogueSite= v;
	}
}

bool Game::active(){
	if(monsterSite.equals(rogueSite))
	return(false);
	return(true);
}

#endif
