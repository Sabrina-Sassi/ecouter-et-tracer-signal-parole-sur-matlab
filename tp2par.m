% 1 lecture d'un fichier audio %%%%%%
clear all , clc

[S1,fs1,nbits1]=wavread('c:\TP2\File1','native');
[S2,fs2,nbits2]=wavread('c:\TP2\File2','native');
[S3,fs3,nbits3]=wavread('c:\TP2\File3','native');
[S4,fs,nbits4]=wavread('c:\TP2\File4','native');

x=double(S1);
y=double(S2);
z=double(S3);
w=double(S4);

x=double(S1);
y=double(S2);
z=double(S3);
w=double(S4);
l1=length(x);
l2=length(y);
l3=length(z);
l4=length(w);
soundsc(x,16000); 

subplot(2,2,1);plot(x);axis([0 l1 -50000 +50000]); title('file1')
subplot(2,2,2);plot(y);axis([0 l2 -50000 +50000]); title('file2')
subplot(2,2,3);plot(z);axis([0 l3 -50000 +50000]); title('file3')
subplot(2,2,4);plot(w);axis([0 l4 -50000 +50000]); title('file4')


%%tpz du signal 1
tpz=0
for i=1:l1-1
    if x(i)*x(i+1)<0 ;
        tpz=tpz+1;
    end 
end
tpz1=tpz/l1
%%%% tpz du signal 2 
tpz=0
for i=1:l2-1
    if y(i)*y(i+1)<0 ;
        tpz=tpz+1;
    end 
end
tpz2=tpz/l2
%%%tpz du signal 3 
tpz=0
for i=1:l3-1
    if z(i)*z(i+1)<0 ;
        tpz=tpz+1;
    end 
end
tpz3=tpz/l3
%%%tpz du signal 4
tpz=0
for i=1:l4-1
    if w(i)*w(i+1)<0 ;
        tpz=tpz+1;
    end 
end
tpz4=tpz/l1

%8/ Calcul de la puissance moyenne:
%%%%% pour file1

p1=0;
for i=1:l1-1;
    p1=p1+x(i)^2;
end
p1=p1/l1
E1=10*log10(p1)
%%%%%p2
p2=0;
for i=1:l2-1;
    p2=p2+y(i)^2;
end
p2=p2/l2
E2=10*log10(p2)
%%%%%%p3
p3=0;
for i=1:l3-1;
    p3=p3+z(i)^2;
end
p3=p3/l3
E3=10*log10(p3)
%%%%%%p4
p4=0;
for i=1:l4-1;
    p4=p4+w(i)^2;
end
p4=p4/l4
E4=10*log10(p4)
d=[z;w;y;x]
soundsc(d,16000)
figure(5);
plot(d);
title('son apres collage ') ;

%%%%%14) préaccentuation
for i=2:l1
    k(i)=x(i)-0.9*x(i-1);
end
A=k*2;
soundsc(A,16000)

%%%15 filtrage
[r1,r2]=ellip(4,0.1,35,1000/16000, 'low');
A2=filter(r1,r2,A);
figure
plot(A2)

%%16
%16 le tracée des 1000 premier echantillions des 3 signaux (s1,A et B)


figure(8);

plot(x,'black') ;
axis([0 length(x) -50000 50000])
hold on
plot(A+10000,'r')
axis([0 length(x) -40000 40000])

plot(A2+25000,'b')
axis([0 length(x)  -30000 30000])
hold on

%17/ spectogramme 

figure(9)

subplot(2,1,1);
plot(x,'b')
title(' signal original');
axis([0 length(x) -50000 50000])
subplot(2,1,2);
specgram(x,512,512/2,512); 






