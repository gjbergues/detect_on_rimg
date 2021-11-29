%horario=0;
%antihorio=1;
%ELEGIR detector
%   Hough = 1
%   Probabilístico = 2
%   Gaussiano = 3
%   Máximo = 4

function  [BVVt,BHHt,IV,IH]=analisis_cruz_for_automatic(k,h,d)

    NI = 20;%Numero de imagenes a ser 	promediadas.Etiquetadas consecutivamente
	sum_I = 0;
	SumaTotal = 0;
   
	
    da = 51-k; %Para cuando es el sentido horario, empiezo del directorio 50
    
	for i=1:NI
 
       
        if h==1
            %f=['I:\datos_paper_pattern2\Exp 2\ahorario\p' num2str(k-1) '\ima' num2str(i) '.bmp'];
            f=['I:\EXP4\horario\p' num2str(k-1) '\ima' num2str(i) '.bmp'];
            %f=['J:\DATOS\TECNOLOGICA\datos_paper_pattern\Exp 2\ahorario\p' num2str(k-1) '\ima' num2str(i) '.bmp'];
        end
        
        if h==0
            %f=['I:\datos_paper_pattern\Exp 2\horario\p' num2str(da) '\ima' num2str(i) '.bmp'];
            f=['I:\EXP4\horario\p' num2str(da) '\ima' num2str(i) '.bmp'];
            %f=['J:\DATOS\TECNOLOGICA\datos_paper_pattern\Exp 2\horario\p' num2str(d) '\ima' num2str(i) '.bmp'];
        end
        
        
        rgb_img = imread(f);
 
    	I = .2989*rgb_img(:,:,1)+.5870*rgb_img(:,:,2) +.1140*rgb_img(:,:,3);
 
        sum_I = sum_I+(double(I)+1);
 
	end
 
	Ip = sum_I/(NI);% Imagen promediada
	Ipneg = 1-(Ip./255);% imagen negada
    
    [bvu, bhu, Isf] = centercruz_function(Ipneg);%obtengo el centro por cada imagen
    
    if d==1
        [BVVt,BHHt,IV,IH] = dhough(bvu, bhu, Isf);
    end
    
    if d==2
         [BVVt,BHHt,IV,IH] = dprob(bvu, bhu, Isf);
    end
        
    if d==3
         [BVVt,BHHt,IV,IH] = dgauss(bvu, bhu, Isf);
    end
    
    if d==4
         [BVVt,BHHt,IV,IH] = dmax(bvu, bhu, Isf);
    end
    
end