

function [BVVt,BHHt,IV,IH]= dhough(bvu, bhu, I)
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% LINEA HORIZONTAL DE LA CRUZ%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 	y = 1:200;
	x = 1:200;
    
    xminh = bvu - 230;
    yminh = bhu - 100;
    
    Jh = imcrop(I,[xminh yminh 199 199]);%[xmin ymin width height]% 
    [BWcruzH,thr1] = edge(Jh,'canny');
    %[BWcruzH,thr1] = edge(Jh,'sobel');
    %figure; imshow(BWcruzH)  
    

    [Hch,thetach,rhoch] = hough(BWcruzH,'RhoResolution',0.1,'Theta',-90:0.5:89.5);
    [Hfilch, Hcolch]= find(Hch >= (0.5*max(max(Hch))));
    %[Hfilch, Hcolch]= find(Hch >= (0.6*max(max(Hch))));

     x3 = thetach(Hcolch(:,1));
     y3 = rhoch(Hfilch(:,1));
     
     maxh= max(y3);
     minh= min(y3);
     pch = abs(((maxh + minh)/2));
    
     BHHt = pch + yminh;

     IH=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% LINEA VERTICAL DE LA CRUZ%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

    xmin = bvu - 100;
    ymin = bhu + 30;
    
    Jv = imcrop(I,[xmin ymin 199 199]);%[xmin ymin width heigh]
    [BWcruzV,thr] = edge(Jv,'sobel');
    %figure; imshow(BWcruzV)
    
    [Hcv,thetacv,rhocv] = hough(BWcruzV,'RhoResolution',0.1,'Theta',-90:0.5:89.5);
    [Hfilcv, Hcolcv]= find(Hcv >= (0.5*max(max(Hcv))));
    

    x4 = thetacv(Hcolcv(:,1));
    y4 = rhocv(Hfilcv(:,1));
    
    maxv= max(y4);
    minv= min(y4);
    pcv = abs(((maxv + minv)/2));
    
    BVVt = pcv + xmin;
    
    IV=1;
   
end

