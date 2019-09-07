clear mypi;
clear raspi;
clear mysh;
clear sensehat;
clear humidity;
mypi = raspi('169.254.100.100', 'pi','Raspberry');
mysh = sensehat(mypi);
clearLEDMatrix(mysh);

imageUINT8   = zeros(8,8,3, 'uint8'); %building an empty array that will later be used for 
dsf = 20000; %sample rate
 ts = 1/dsf;
t = 0:ts:(dsf*ts); %the time period
t1=0.5;
bw=0.5; %bandwidth for 





for i = 1:0.1:100
  humidity= readHumidity(mysh); 
  press =readPressure(mysh);
  magField = readMagneticField(mysh);
  av = readAngularVelocity(mysh);
  Acc = readAcceleration(mysh);
  
  
  fsm1= (magField(1)*1000) +200;
  fsm2= (magField(2)*1000) +200;
  fsm3= (magField(3)*1000) +200;
  fsp= press/1000 *3;
  fsh = humidity*10;
  av1 = av(1)*5000;
  av2 =  av(2)*5000;
  av3 =  av(3)*5000;
  Acc1 = sqrt(abs(Acc(1)))*500;
   Acc2 = sqrt(abs(Acc(2)))*500;
    Acc3 = sqrt(abs(Acc(3)))*500;
  
  [colfsp,insfsp] = convsig2c(fsp);
  [colfsh,insfsh] = convsig2c(fsh);
  [colfsm1,insfsm1] = convsig2c(fsm1);
  [colfsm2,insfsm2] = convsig2c(fsh);
  [colfsm3,insfsm3] = convsig2c(fsh);
  [colav1av2,insav1av2] = convsig2c((av1+av2)/2);
  [colav3Acc1,insav3Acc1] = convsig2c((av3+Acc1)/2);
  [colAcc2Acc3,insAcc2Acc3] = convsig2c((Acc2+Acc3)/2);
  
   
 imageUINT8(:,1,colfsp) = insfsp;
 imageUINT8(:,2,colfsh) = insfsh;
 imageUINT8(:,3,colfsm1) = insfsm1;
 imageUINT8(:,4,colfsm2) = insfsm2;
 imageUINT8(:,5,colfsm3) = insfsm3;
 imageUINT8(:,6,colav1av2) = insav1av2;
 imageUINT8(:,7,colav3Acc1) = insav3Acc1;
 imageUINT8(:,8,colAcc2Acc3) = insAcc2Acc3;
 
 

noteh = sin(2*pi*fsh*t);%sine wave
notep = sin(2*pi*fsp*t);
notem1= sawtooth(2*pi*fsm1*t);
notem2= sawtooth(2*pi*fsm1*t); %swtooth wave
notem3= sawtooth(2*pi*fsm1*t);
nav1 = chirp(t,av1,t1,av2,'quadratic'); 
nav2 = chirp(t,av2,t1,av3,'quadratic');
nAcc1 = gauspuls(t,Acc1,bw);
nAcc3 = gauspuls(t,Acc2,bw);
nAcc2 = gauspuls(t,Acc3,bw);

ledorien= randsample([0 90 180 270],1); %this 


Note(mysh) 

soundsc([notep,noteh,notem1, notem1, notem3,nav1,nav2,nAcc1,nAcc2,nAcc3],dsf)
displayImage (mysh,imageUINT8,ledorien)

clearLEDMatrix(mysh);
end
