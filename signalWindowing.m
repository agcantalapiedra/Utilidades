function signalWindowed = signalWindowing(signalIn,displ,windowLength,enventanar)

if nargin == 3 
    enventanar = 1;
end

inicios = 1 : displ : length(signalIn) - windowLength + 1;


signalWindowed = zeros(windowLength,length(inicios));

for k = 1 : length(inicios)
    signalWindowed(:,k) = signalIn(inicios(k):inicios(k)+windowLength-1);
%     signalWindowed(:,k) = signalWindowed(:,k) .* hanning(windowLength);
end

if enventanar
    hanning_vect = hanning(windowLength);
    hanning_mat = repmat(hanning_vect,1,size(signalWindowed,2));
    
    signalWindowed = signalWindowed.*hanning_mat;
end

