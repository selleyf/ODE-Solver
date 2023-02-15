function y=RK2(h,f)
% Explicit kozepponti modszer
% Selley Fanni

m=floor(24/h);
y=zeros(1,m+1);
y(1)=1;


for j=1:m
        Y1=y(j);
        Y2=y(j)+1/2*h*f(1+(j-1)*h,Y1);
        y(j+1)=y(j)+h*f(1+(j-1/2)*h,Y2);
end

end
