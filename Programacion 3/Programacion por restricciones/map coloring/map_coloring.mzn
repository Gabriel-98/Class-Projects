% ........................Description........................
% must determine the minimum number of colors needed to color
% a map so that no two adjacent regions have the same colour

% .....Constants.....
int: nc=3;
% .....Variables.....
var 1..nc: WA;
var 1..nc: NT;
var 1..nc: SA;
var 1..nc: Q;
var 1..nc: NW;
var 1..nc: V;
var 1..nc: T;
% .....Constraints.....
constraint WA != NT;
constraint WA != SA;
constraint NT != SA;
constraint NT != Q;
constraint SA != Q;
constraint SA != NW;
constraint SA != V;
constraint Q != NW;
constraint NW != V;

solve satisfy;