function [col,ins] = convsig2c(freq)
%this function chooses the colours that display on the led in relation to
%the signals that generate it
cs = freq/(1000/255);%change the range to match the led image
ins=cs;

if cs <= 85 
    col= 3;
elseif ((85<cs) && (cs <= 170))
        col=2;
elseif cs > 170
    col = 1;
end
    

end

