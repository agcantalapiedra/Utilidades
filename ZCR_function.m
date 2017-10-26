function ZCR = ZCR_function (signal)

% ZCR = sum (abs(diff(trama>0)))/length(trama);

% signal_d = diff(signal);
zero_cross = abs(diff((signal)>0));
ZCR = find(zero_cross == 1)+1;% hay que sumarle uno para que el indice coincida con la muestra en la que ha cambiado
