% ...............................................Description...............................................
% The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3
% subgrids that compose the grid contains all of the digits from 1 to 9.

include "globals.mzn";
% ..................................................Input..................................................
array [1..9,1..9] of int: Sudoku;
% ................................................Variables................................................
array [1..9,1..9] of var 1..9: Solution;
% ...............................................Constraints...............................................
constraint forall(i in 1..9, j in 1..9)((Sudoku[i,j]!=0) -> (Solution[i,j] = Sudoku[i,j]));
constraint forall(i in 1..9)(alldifferent([Solution[i,X] | X in 1..9]));
constraint forall(j in 1..9)(alldifferent([Solution[Y,j] | Y in 1..9]));
constraint forall(X in 0..2, Y in 0..2)(alldifferent([Solution[(X*3)+i,(Y*3)+j] | i in 1..3, j in 1..3]));

solve satisfy;
  output["   \t   Sudoku:\n"] ++
  [if (i mod 3 == 1  /\ j == 1) then "-------------------------------\n" else "" endif ++
  if (j == 1) then "|" else "" endif ++
  " \(Solution[i,j]) " ++
  if (j mod 3 == 0) then "|" else "" endif ++
  if (j == 9) then "\n" else "" endif 
  | i,j in 1..9] ++
  ["-------------------------------\n\n\n"];