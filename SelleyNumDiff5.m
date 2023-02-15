function SelleyNumDiff5(h,modszer,l,w,c)
% y'(t)=-5ty(t)^2+5/t-1/t^2; y(1)=1 numerikus megoldasa az [1 25]
% intervallumon, h lepeskozzel: EE,EEK,RK4
% b verzio: y'(t)=l*(y-sin(w*t))+w*cos(w*t); y(0)=c megoldasa [0 2]
% intervallumon, h lepeskozzel: Adams-Bashforth4
% hivas:
% SelleyNumDiff5(1/50,@RK1) - Explicit Euler modszer
% SelleyNumDiff5(1/50,@RK2) - Explicit kozepponti modszer
% SelleyNumDiff5(1/50,@RK4) - RK4 
% SelleyNumDiff5(1/50,@AdamsBash4,-4,2,1) - Adams-Bashforth 4-ed rendu modszer 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%format long 

% lepeskoz = h

m=floor(2/h);
%m=floor(24/h);
x=linspace(0,2,m+1); 
%x=linspace(1,25,m+1); 

pontos=zeros(1,m+1);  

for j=1:(m+1)
        pontos(j)=pl1((j-1)*h,l,w,c);
        %pontos(j)=pl1((j-1)*h);
end

% tic
y=modszer(h,@f,l,w,c); 
%y=modszer(h,@f); 
% toc
    
hibavect=pontos-y;

hiba=max(abs(hibavect)) %hiba maximum normaja

% lepeskoz = 2*h

m2=floor(2/(2*h));
%m2=floor(24/(2*h));
x2=linspace(0,2,m2+1); 
%x2=linspace(1,25,m2+1); 


pontos2=zeros(1,m2+1); 


for j=1:(m2+1)
        pontos2(j)=pl1((j-1)*2*h,l,w,c);
        %pontos2(j)=pl1((j-1)*2*h);
end


y2=modszer(2*h,@f,l,w,c); 
%y2=modszer(2*h,@f); 
    
hibavect2=pontos2-y2;

% ráta

eh=hibavect(length(hibavect));
eh2=hibavect2(length(hibavect2));
%rata=log2(abs(eh2/eh));

% abrazolas:
sz = [300 1000]; 
screensize = get(0,'ScreenSize');
xpos = ceil((screensize(3)-sz(2))/2); 
ypos = ceil((screensize(4)-sz(1))/2); 
hFig = figure(1);
set(hFig, 'Position', [xpos ypos sz(2) sz(1)])

subplot(1,3,1)
plot(x,y)
title(['Numerikus megoldas - ',func2str(modszer)])
xlim([0 x(length(x))]);
    
subplot(1,3,2)
plot(x,pontos,'g')
title('Pontos megoldas')
xlim([0 x(length(x))]);
    
subplot(1,3,3)
plot(x,hibavect,'r')
title('Hiba')
xlim([0 x(length(x))]);

end

%----------------------------------------------------------------------
% a (pontos) megoldas:
function ered=pl1(t,l,w,c)

%ered=1/t;
ered=sin(w*t)+c*exp(l*t);

end

%----------------------------------------------------------------------
% f, vagyis az y'(t)=f(t,y(t)) egyenlet jobboldala 
function ered=f(t,y,l,w,c)

%ered=-5*t*y^2+5/t-1/t^2;
ered=l*(y-sin(w*t))+w*cos(w*t);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%