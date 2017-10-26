function signalOut = shannonEnergy (SignalIn,impulse_length)
%% funci�n para obtener la energ�a de Shannon de una se�al entrante
% inputs: 
%   -SignalIn: Se�al de entrada de la que se ovtendr� su energ�a
%   -impulse_length: Longitud (en muestras) para obtener la envolvente
% outputs:
%   -signalOut: Energ�a de la se�al entrante
% Autor: Adri�n Garc�a Cantalapiedra, 2/12/2016
%%

% eliminamos posibles ceros que har�an crashear la funci�n
SignalIn(SignalIn==0) = 0.00000001;

ShannonEnergy_d = -SignalIn.^2 .* log10(SignalIn.^2);

% convoluci�n con se�al rectaungular, forward and reverse:
% impulse_length = 50;
rectangular_impulse = ones(1,impulse_length);
ShannonEnergy_d_conv = conv(ShannonEnergy_d,rectangular_impulse);
% ShannonEnergy_d_conv_r = smooth(ShannonEnergy_d,impulse_length);

%% eliminado por coste computacional!!!
% ShannonEnergy_d_conv_r = conv(fliplr(ShannonEnergy_d_conv_f),rectangular_impulse);
% ShannonEnergy_d_conv = fliplr(ShannonEnergy_d_conv_r);
%%



% ajustamos la convouci�n para tener el mismo tama�o que la se�al
% original
signalOut = ShannonEnergy_d_conv(impulse_length:end-impulse_length+1);

% normalizada
signalOut = signalOut./max(abs(signalOut));