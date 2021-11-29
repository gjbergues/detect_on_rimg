function [BVVt,BHHt,IV,IH] = dmax(bvu, bhu, I)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% LINEA HORIZONTAL DE LA CRUZ%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    i = 0;
    acbh = 0;
     
    for j = 1:1624
        i = i+1;
        cv = squeeze(I(:,j));%cortes verticales       
 
        [M,Inh] = max(cv);%M= valor, I=�ndices.      
        
        bh(i) = Inh; %valor central detectado para cada corte             
    end
    
        BHHt = median(bh);  %posici�n l�nea horizontal 
        IH=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% LINEA VERTICAL DE LA CRUZ%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    acbv = 0;
    i = 0;
    for j = 1:1234
        i=i+1;
        ch = squeeze(I(j,:));%cortes horizontales
      
        [M,Inv] = max(ch);%M= valor, I=�ndices.
       
        bv(i) = Inv; %valor central detectado de la gaussiana para cada corte                
    end
     
    BVVt = median(bv);  %posici�n l�nea vertical
    IV=1;    


end

