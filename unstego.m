function M=unstego(I,P,K)

I=[I '.png'];
simg = imread(I);
U=size(simg);
H=U(1);
W=U(2);
S=H*W;
C=chaos(K,S);
l=dec2bin(0,20);

for T=0:19
    E=simg(H,W-T);
    E=dec2bin(E,8);
    l(T+1)=E(8);
end

L=bin2dec(l)*6;
Is=zeros(L,1);
Js=zeros(L,1);
B=dec2bin(zeros(L,1));

for N=1:L
    Z=C(N);
    if(mod(Z,W)==0)
        R=(Z/W)-1;
    else
        R=(Z/W)-(mod(Z,W)/W);
    end
    I=round(Z-(R*W));
    J=R+1;
    Is(N)=I;
    Js(N)=J;
    X=dec2bin(simg(I,J),8);
    B(N)=X(8);
end

M=unmesage(B,P);

end