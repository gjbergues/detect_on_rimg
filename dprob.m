function [BVVt,BHHt,IV,IH] = dprob(bvu, bhu, I)

    ND = 5;
    Nx = 1:1624; %Column
    Ny = 1:1234; %rows
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% LINEA HORIZONTAL DE LA CRUZ%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    acbh = 0;
    j = 0;
    for j = 100:(bvu-100)        
        cv = squeeze(I(:,j));%cortes verticales
        y(j) = (Ny*cv)/sum(cv);
                
        %acbh = acbh + y;%acumulador de valores centrales para cada corte de la imagen       
    end
    
    BHHt = median(y);  %valor central único para cada imagen
    IH = 1;
    y=0;  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% LINEA VERTICAL DE LA CRUZ%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
    acbv = 0;
    j = 0;
    for j = 250:(bhu-100)       
        ch = squeeze(I(j,:));%cortes horizontales
        y(j) = (Nx*ch')/sum(ch);

        %acbv = acbv + y2;
    end
    
    BVVt = median(y);  %valor central único para cada imagen 
    IV = 0;
end
