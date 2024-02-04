function x = mesage(t,p)
i=length(t);
k=zeros(1,i);
for q=1:i
    k(q)=athashza(t(q));
end
d=dec2bin(k,6);
b=d;
for s=1:6;
    b(:,s)=d(:,p(s));
end
b=b(:);
x=b;
end

