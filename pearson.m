function [r] = pearson(x,y)
%correlaciona la posición de los centros reales
%con los centros detectados

r = (100*x*y' - sum(x)*sum(y))/(sqrt(100*x*x'-(sum(x)*sum(x)))*sqrt(100*y*y'-(sum(y)*sum(y))));
end