function  Note(mysh)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

joystickPress = readJoystick(mysh);
switch joystickPress
    case 1
        fs = 130;
    case 2
        fs = 155;
    case 3
              fs = 170;
        case 4     
        fs = 185;
        case 5
        fs = 200;
    otherwise
        fs=0;
end

    



dsf = 15000;
ti = 1/dsf;
t = 0:ti:(dsf*ti);
notes = 4*sin(2*pi*fs*t);


    sound(notes,dsf);   
  clear  joystickPress 
end   
  


   






