function signalOut = shannonEnergy (SignalIn,impulse_length)
%% función para obtener la energía de Shannon de una señal entrante
% inputs: 
%   -SignalIn: Señal de entrada de la que se ovtendrá su energía
%   -impulse_length: Longitud (en muestras) para obtener la envolvente
% outputs:
%   -signalOut: Energía de la señal entrante
% Autor: Adrián García Cantalapiedra, 2/12/2016
%%

% eliminamos posibles ceros que harían crashear la función
SignalIn(SignalIn==0) = 0.00000001;

ShannonEnergy_d = -SignalIn.^2 .* log10(SignalIn.^2);

% convolución con señal rectaungular, forward and reverse:
% impulse_length = 50;
rectangular_impulse = ones(1,impulse_length);
ShannonEnergy_d_conv = conv(ShannonEnergy_d,rectangular_impulse);
% ShannonEnergy_d_conv_r = smooth(ShannonEnergy_d,impulse_length);

%% eliminado por coste computacional!!!
% ShannonEnergy_d_conv_r = conv(fliplr(ShannonEnergy_d_conv_f),rectangular_impulse);
% ShannonEnergy_d_conv = fliplr(ShannonEnergy_d_conv_r);
%%



% ajustamos la convoución para tener el mismo tamaño que la señal
% original
signalOut = ShannonEnergy_d_conv(impulse_length:end-impulse_length+1);

% normalizada
signalOut = signalOut./max(abs(signalOut));