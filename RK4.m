function y=RK4(h,f)
% RK4
% Selley Fanni

m=floor(24/h);
y=zeros(1,m+1);
y(1)=1;


for j=1:m
        Y1=y(j);
        Y2=y(j)+1/2*h*f(1+(j-1)*h,Y1);
        Y3=y(j)+1/2*h*f(1+(j-1/2)*h,Y2);
        Y4=y(j)+h*f(1+(j-1/2)*h,Y3);
        y(j+1)=y(j)+h/6*(f(1+(j-1)*h,Y1)+2*f(1+(j-1/2)*h,Y2)+2*f(1+(j-1/2)*h,Y3)+f(1+j*h,Y4));
end

end
