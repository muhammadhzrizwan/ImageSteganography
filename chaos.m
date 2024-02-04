function c = chaos(r,p)
x=zeros(1,p);
y=zeros(1,p);
z=zeros(1,p);
x(1) = 0.3;
for n=2:p
    x(n) = r*x(n-1)*(1-x(n-1));
end
for i=1:p
    if x(i)>=0&&x(i)<0.3333
        y(i)=1;
    elseif x(i)>0.3333&&x(i)<=0.6666
        y(i)=2;
    elseif x(i)>0.6666&&x(i)<1
        y(i)=3;
    end
end
z(1)=y(1);
j=2;
while z(j-1)<=p
    z(j)=y(j)+z(j-1);
    j=j+1;
end
m=j-1;
u=z(1:m-1);
v=zeros(1,p-j+1);
l=1;
o=1;
for k=1:p
    if l<=m-1&&k==u(l)
        l=l+1;
    else
        v(o)=k;
        o=o+1;
    end
end
c=[u v];
end

