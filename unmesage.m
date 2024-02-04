function t = unmesage(b,p)
n=length(b)/6;
h=dec2bin(zeros(n,1),6);
m=zeros(1,n);
for v=1:6
    i=p(v);
    r=((i-1)*n)+1;
    q=i*n;
    h(:,v)=b(r:q);
end
for j=1:n
    m(j)=bin2dec(h(j,:));
end
for g=1:n
u(g)=iathashza(m(g));
end
t=u;
end

