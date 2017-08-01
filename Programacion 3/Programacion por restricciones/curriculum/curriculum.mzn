% ............................................Description............................................
% Create a curriculum according to the prerequisites and number of credist of each subject 

% ...............................................Input...............................................
int: N;
int: MaxCredit;
int: MinCredit;
int: S;
int: K;
array[1..N] of string: subject;
array [1..N] of int: credit;
array [1..N,1..K] of int: req;
array [1..N] of int: simultaneous;

% ............................................Variables..............................................
var 1..10: MaxSubjects;        % maximum amount of subjects in a semester
array [1..N] of var 1..10: semester;
array [1..S, 1..N] of var 0..1: semesterSubject;
array [1..S] of var 0..10: contSubjects;
  
% ............................................Constraints............................................
% 1. constraint of prerequisites
constraint forall(i in 1..N, j in 1..2)((req[i,j]!=0) -> (semester[i] > semester[req[i,j]]));
% 2. constraint of simultaneous
constraint forall(i in 1..N)((simultaneous[i] != 0) -> (semester[i] == semester[simultaneous[i]]));
% 3. The sum of the credits of each semester must be within the limits
constraint forall(x in 1..S, i in 1..N)(semester[i] != x  -> semesterSubject[x,i]= 0);
constraint forall(x in 1..S, i in 1..N)(semester[i] == x  -> semesterSubject[x,i]= 1);
constraint forall(x in 1..S)((sum(i in 1..N)(semesterSubject[x,i]*credit[i]) >= MinCredit) /\ (sum(i in 1..N)(semesterSubject[x,i]*credit[i]) <= MaxCredit));
constraint forall(x in 1..S)(contSubjects[x] == sum(i in 1..N)(semesterSubject[x,i]));
constraint MaxSubjects = max(contSubjects);

solve minimize(MaxSubjects);
  output["Number of subjects: \(N)\n"] ++
  ["\(subject[i]):  \(semester[i])\n" | i in 1..N] ++
  ["Maximum of semester subjects: \(MaxSubjects)\n"];
  