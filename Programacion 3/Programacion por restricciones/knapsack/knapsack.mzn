% ..............................Description..............................
% Given N items with a cost and a benefit, must choose some items such
% that items do not exceed the limit cost and maximize the benefit

% .................................Input.................................
int: N;                                                % Number of items
int: Wmax;                                             % Maximum cost
array [1..N] of int: W;                                % cost
array [1..N] of int: V;                                % Benefit
% ...............................Variables...............................
array [1..N] of var 0..1: X;                           % Choose item
var 0..100000: B;                                      % Benefit achieved
% ..............................Constraints..............................
constraint (sum(i in 1..N)(W[i]*X[i]) <= Wmax); 
constraint (B = sum(i in 1..N)(V[i]*X[i])); 

solve maximize(B);