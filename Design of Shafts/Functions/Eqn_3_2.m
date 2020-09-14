function z = Eqn_3_2(T,G, varargin)
%  EQN_3_2 Equation 3.2 of the design data hand book.
% 
% So for option 1
% 
% Enter the arguments in the following order : Torque, Rigidity, Length,  Diameter.
% 
% For Option 2
% 
% Enter the arguments in the following order : Torque, Rigidity, Length, Theta
numvarargs = length(varargin);
if nargin > 4
            disp('All the values are known not required to use this function.')
end
disp('Select the following:')
disp('1.The angular Deformation') 
disp('2.The diameter ')
n = input('Enter a number: ');
switch n
    case 1
        [optargs{1:numvarargs}] = varargin{:};
        [L, d] = optargs{:};
        theta = ((584*T*L)/(G*d));
        z = theta;
    case 2
        [optargs{1:numvarargs}] = varargin{:};
        [L, theta] = optargs{:};
        d = ((584*T*L)/(G*theta))^(1/3);
        z = d;
    otherwise
        disp('Not a valid number')
end
end