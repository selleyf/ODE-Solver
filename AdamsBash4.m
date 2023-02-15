function y=AdamsBash4(h,f,l,w,c)
% Adams-Bashforth4
% Selley Fanni

m=floor(2/h);
y=zeros(1,m+1);
y(1)=c;


for j=1:3
        Y1=y(j);
        Y2=y(j)+1/2*h*f((j-1)*h,Y1,l,w,c);
        Y3=y(j)+1/2*h*f((j-1/2)*h,Y2,l,w,c);
        Y4=y(j)+h*f((j-1/2)*h,Y3,l,w,c);
        y(j+1)=y(j)+h/6*(f((j-1)*h,Y1,l,w,c)+2*f((j-1/2)*h,Y2,l,w,c)+2*f((j-1/2)*h,Y3,l,w,c)+f(j*h,Y4,l,w,c));
end

for j=1:(m-3)
        y(j+4)=y(j+3)+h*(55/24*f((j+2)*h,y(j+3),l,w,c)-59/24*f((j+1)*h,y(j+2),l,w,c)+37/24*f(j*h,y(j+1),l,w,c)...
        -3/8*f((j-1)*h,y(j),l,w,c));
end

end


