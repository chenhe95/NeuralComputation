% Go in data and make a roc curve from the correct column (0 = error, 1 =
% correct) and compute area

% For x:
% 0 will be the main direction
% 1 will be the opposite direction 

% For y:
% It will be 0 if main direction and no error
% 1 if main direction and error
% 1 if opposite direction and no error
% 0 if opposite direction and error

roc_by_cell = @(cell) cell.ecodes.data