% ........................Description........................
% Must be assigned a room to each of the sessions

% ...........................Input...........................
int: numSessions;
int: numLecturers;
int: numDays;
int: numSlotsPerDay;
int: availRooms;
array [1..numSessions] of int: duration;
array [1..numSessions] of int: period;
array [1..numSessions] of int: group;
array [1..numSessions] of int: teaching;
array [1..numSessions] of int: roomRequirement;
% ...........................Constants...........................
int: numSlots = numDays * numSlotsPerDay;
int: N = numSlots * availRooms;
% ...........................Variables...........................
var 1..availRooms: NumRooms;
array [1..numSessions] of var 1..N: S;
array [1..numSessions] of var 7..17: HoraInicio;
array [1..numSessions] of var 8..18: HoraFin;
array [1..numSessions] of var 1..5: Dia;
array [1..numSessions] of var 1..15: Rooms;
% ...........................Constraints...........................
% Each room can not be occupied by 2 or more sessions at the same time 
constraint forall(i in 1..numSessions, j in 1..numSessions, where i!=j)((S[i]+duration[i] <= S[j]) \/ (S[j]+duration[j] <= S[i]));
% Convert to room, day and hour
constraint forall(i in 1..numSessions)(Rooms[i] = ((S[i]-1) div numSlots)+1);
constraint forall(i in 1..numSessions)(Dia[i] = (((S[i]-((Rooms[i]-1)*numSlots))-1) div numSlotsPerDay)+1);
constraint forall(i in 1..numSessions)((S[i] mod numSlotsPerDay = 0) -> (HoraInicio[i] = 17));
constraint forall(i in 1..numSessions)((S[i] mod numSlotsPerDay != 0) -> (HoraInicio[i] = (S[i] mod numSlotsPerDay)+6));
constraint forall(i in 1..numSessions)(HoraFin[i] = HoraInicio[i]+duration[i]);
% Each group can not have more that one session per day
constraint forall(i in 1..numSessions, j in 1..numSessions, where i!=j)(group[i] = group[j] -> ((((S[i]-1) div numSlotsPerDay) mod numDays) != (((S[j]-1) div numSlotsPerDay) mod numDays)));
% Each teacher can not given more that one session at the same time
constraint forall(i in 1..numSessions, j in 1..numSessions, where i!=j)((teaching[i] == teaching[j]) -> (((((S[i]-1) mod numSlots) + duration[i]) <= ((S[j]-1) mod numSlots)) \/ ((((S[j]-1) mod numSlots) + duration[j]) <= ((S[i]-1) mod numSlots))));
% No sessions 1-2
constraint forall(i in 1..numSessions)((HoraFin[i] <= 13) \/ (HoraInicio[i] >= 14));
% Computer room requirement
constraint forall(i in 1..numSessions, j in 1..numSessions, where roomRequirement[i] != roomRequirement[j])(((S[i]-1) div numSlots)!=((S[j]-1) div numSlots));

constraint NumRooms = max(Rooms);

solve satisfy;