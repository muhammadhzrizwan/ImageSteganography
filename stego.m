function stego(varargin)

% mes,psw,key,im,no,h,w
% no='stg_img';
% im='img';
% mes='my^name(is-hamza*rizwan';
% psw = [3 6 1 4 5 2];
% h=1280;
% w=960;
% key = 3;

if nargin==7
mes=varargin{1};
psw=varargin{2};
key=varargin{3};
im=varargin{4};
no=varargin{5};
h=varargin{6};
w=varargin{7};

ni='org_img';
imi=['F:\FYP\Steganography MATLAB\' ni '.png'];
imo=['F:\FYP\Steganography MATLAB\' no '.png'];
img = imread(im);
ip=rgb2gray(img);
ip=imresize(ip, [h w]);
bits = mesage(mes,psw);
len = length(bits);
is=zeros(len,1);
js=zeros(len,1);
sz=(h*w)-20;
c=chaos(key,sz);
op = ip;
uo=len/6;
u=dec2bin(uo,20);

for t=0:19
    tmo=dec2bin(ip(h,w-t),8);
    tmo(8)=u(t+1);
    op(h,w-t)=bin2dec(tmo);
end
    
for n=1:len
    b=c(n);
    if(mod(b,w)==0)
        r=(b/w)-1;
    else
        r=(b/w)-(mod(b,w)/w);
    end
    i=round(b-(r*w));
    j=r+1;
    is(n)=i;
    js(n)=j;
    tm=dec2bin(ip(i,j),8);
    tm(8)=bits(n);
    op(i,j)=bin2dec(tm);
end

imwrite(ip,imi);
imwrite(op,imo);

elseif nargin==4
mes=varargin{1};
psw=varargin{2};
key=varargin{3};
im=varargin{4};

no='stg_img';
ni='org_img';
imi=['F:\FYP\Steganography MATLAB\' ni '.png'];
imo=['F:\FYP\Steganography MATLAB\' no '.png'];
img = imread(im);
ip=rgb2gray(img);
sz=size(ip);
h=sz(1);
w=sz(2);
bits = mesage(mes,psw);
len = length(bits);
is=zeros(len,1);
js=zeros(len,1);
sz=(h*w)-20;
c=chaos(key,sz);
op = ip;
uo=len/6;
u=dec2bin(uo,20);

for t=0:19
    tmo=dec2bin(ip(h,w-t),8);
    tmo(8)=u(t+1);
    op(h,w-t)=bin2dec(tmo);
end
    
for n=1:len
    b=c(n);
    if(mod(b,w)==0)
        r=(b/w)-1;
    else
        r=(b/w)-(mod(b,w)/w);
    end
    i=round(b-(r*w));
    j=r+1;
    is(n)=i;
    js(n)=j;
    tm=dec2bin(ip(i,j),8);
    tm(8)=bits(n);
    op(i,j)=bin2dec(tm);
end

imwrite(ip,imi);
imwrite(op,imo);
end
end