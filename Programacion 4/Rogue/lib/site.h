#include<bits/stdc++.h>
#ifndef site_h
#define site_h 
using namespace std;

class Site {
	public:
		Site();
		Site(int i, int j);                   // instantiate a new Site for location (i, j)
		int i();                              // get i coordinate
		int j();                              // get j coordinate
		bool equals(Site w);               	  // is invoking site equal to w?
		double distanciaEuclidiana(Site w);
		int manhattan(Site w);
		int distanceToCorridor(Site w);
		void restartIterador();
		bool hasNext();
		Site next();
	private:
		int pos;
		int posI,posJ;
};

Site::Site(){
	posI=0;
	posJ=0;
}

Site::Site(int i, int j){
	pos=0;
	posI=i;
	posJ=j;
}

Site::i(){
	return(posI);
}

Site::j(){
	return(posJ);
}

bool Site::equals(Site w){
	if(posI==w.i() && posJ==w.j())
	return(true);
	return(false);
}

double Site::distanciaEuclidiana(Site w){
	double ans,x,y;
	y= posI - w.i();
	x= posJ - w.j();
	ans= sqrt((x*x)+(y*y));
	return(ans);
}

int Site::manhattan(Site w){
	return(abs(posI-w.i()) + abs(posJ-w.j()));
}

int Site::distanceToCorridor(Site w){
	int ans= manhattan(w) - min(abs(posI-w.i()), abs(posJ-w.j()));
	return(ans);
}

void Site::restartIterador(){
	pos=0;
}

bool Site::hasNext(){
	if(pos>=9)
	return(false);
	return(true);
}

Site Site::next(){
	int i,j;
	if(pos==4)
	pos++;
	i=(pos/3)-1;
	j=(pos%3)-1;
	pos++;
	return(Site(posI+i,posJ+j));
}

#endif
