function [pre1,pre2,pre3]=greymodel(total)

% Overview: use greymodel to give prediction for given data

% Since the greymodel requires a increasing trend to be accuarte, here we
% use accumulation to achieve this.
if total(1,3)/1000>2 && total(1,3)/1000<3
    y=total(1:6,2)'/100;
    y(1)=y(1)-0.9;y(2)=y(2)-0.9;y(3)=y(3)-0.9;y(4)=y(4)-0.9;
    for i=2:6
        y(i)=y(i)+y(i-1);
    end
end

if total(1,3)/1000>3 
    y=total(1:7,2)'/100;
    for j=2:7
        y(j)=y(j)+y(j-1);
    end
end

% prediction part:
n=length(y);
new=ones(n,1);
new(1)=y(1);
for i=2:n
    new(i)=new(i-1)+y(i);
end
B=ones(n-1,2);
for i=1:(n-1)
    B(i,1)=-(new(i)+new(i+1))/2;
    B(i,2)=1;
end
BT=B';
YN=zeros(n-1,1)';
for j=1:n-1
    YN(j)=y(j+1);
end
YN=YN';
A=(BT*B)\BT*YN;
a=A(1);u=A(2);t=u/a;
i=1:n+2;
news(i+1)=(y(1)-t).*exp(-a.*i)+t;
news(1)=y(1);
for j=n+3:-1:2
    ys(j)=news(j)-news(j-1);
end

pre1=(ys(n+1)-ys(n))*100;
pre2=(ys(n+2)-ys(n+1))*100;
pre3=(ys(n+3)-ys(n+2))*100;

end


