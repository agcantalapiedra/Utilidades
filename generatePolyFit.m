function vq = generatePolyFit(x,v,xq,orden)



coeficientes =  polyfit(x,v,orden);
coeficientes = fliplr(coeficientes);
vq = zeros(size(xq));
for ind_gr = 0 : orden
    vq = vq + coeficientes(ind_gr+1)*xq.^ind_gr;
end