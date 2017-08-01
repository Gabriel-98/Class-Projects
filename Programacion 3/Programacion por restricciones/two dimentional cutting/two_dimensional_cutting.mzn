% .........................Description.........................
% Is the problem of cutting standard-sized pieces of material,
% such as paper rolls or sheet metal, into pieces of specified
% sizes while minimizing material wasted

% ............................Input............................
int: N;
int: Width;
int: Height;
int: LimArea = Width * Height;
array [1..N] of int: W;
array [1..N] of int: H;

% ..........................Variables..........................
array [1..N] of var 0..Width-1: X;
array [1..N] of var 0..Height-1: Y;
array [1..N] of var 0..Width: XW;
array [1..N] of var 0..Height: YH;
var 0..Width: Wmax;
var 0..Height: Hmax;
var 0..LimArea: UsedArea;
var 0..LimArea: TotalArea;
var 0..LimArea: AreaD;

% ..........................Constraints..........................
% Rectangles inside the area
constraint forall(i in 1..N)(W[i]+X[i] <= Width);
constraint forall(i in 1..N)(H[i]+Y[i] <= Height);
% No overlap
constraint forall(i in 1..N, j in 1..N)(i!=j -> (X[j]+W[j]<=X[i] \/ X[i]+W[i]<=X[j] \/ Y[j]+H[j]<=Y[i] \/ Y[i]+H[i]<=Y[j]));
% Last vertex
constraint forall(i in 1..N)(XW[i] = X[i]+W[i]);
constraint forall(i in 1..N)(YH[i] = Y[i]+H[i]);
% maximum widthand height used
constraint Wmax = max(XW);
constraint Hmax = max(YH);
% Areas
constraint UsedArea = sum(i in 1..N)(W[i]*H[i]);            % Sum of the areas (Constant)
constraint TotalArea = min(Wmax * Height, Hmax * Width);    % Minimum subarea containing all rectangles (Variable)
constraint AreaD = TotalArea - UsedArea;                    % Wasted area

solve minimize(AreaD);

output  ["Wmax= \(Wmax) \n"] ++
        ["Hmax= \(Hmax) \n"] ++
        ["UsedArea= \(UsedArea) \n"] ++
        ["TotalArea= \(TotalArea) \n"] ++
        ["AreaD= \(AreaD) \n"] ++
        ["Coordenadas: \n"] ++
        ["Rectangulo \(i): \t (\(X[i]) \(Y[i])) \t (\(W[i]) \(H[i])) \n" | i in 1..N] ++
        ["width=\(Width) \n"] ++
        ["Height=\(Height) \n"] ++
        ["solution= ["] ++
        ["(\(X[i]),\(Y[i]),\(W[i]),\(H[i])), " | i in 1..N-1] ++
        ["(\(X[N]),\(Y[N]),\(W[N]),\(H[N]))]\n"];