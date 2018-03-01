load contrast_response.mat

%% Problem 1 A
samplingrate = 2000;

A=spikeTimes{1,9};
x=1:1:40000;
y=zeros(1,40000);
for i=1:40000
    if any(A==x(i))
        y(i) = 1;
    end
end
figure;
plot(x/samplingrate,y)
ylim([0,2])

xlabel('time (s)');
ylabel('spikes');
%% Problem 1 B
figure;
firing_rate = hist(A,200)*10; %*10 to make seconds
xvals = .1:.1:20;
plot(xvals, firing_rate);
title('Time-Dependent Firing Rate');
xlabel('time (s)');
ylabel('spikes');

%% Problem 1 C
x=1:1:40000;
y=zeros(1,40000);
for i= 1:40000
    if any(A==x(i))
        mu = i;
        y = y+normpdf(x,mu,70); %adding up gaussian functions 
    end
end
figure;
plot(x,y)
title('Estimated Firing Rate');
xlabel('time');
ylabel('spike');
%%  Problem 1 D

A=spikeTimes{1,9};
firing_rate_A = hist(A,200)*10;
Aavg= mean(firing_rate_A); %averaging firing rate. Same for A-I


B=spikeTimes{1,8};
firing_rate_B = hist(B,200)*10;
Bavg= mean(firing_rate_B);



C=spikeTimes{1,7};
firing_rate_C = hist(C,200)*10;
Cavg= mean(firing_rate_C); 

D=spikeTimes{1,6};
firing_rate_D = hist(D,200)*10;
Davg= mean(firing_rate_D); 

E=spikeTimes{1,5};
firing_rate_E = hist(E,200)*10;
Eavg= mean(firing_rate_E);

F=spikeTimes{1,4};
firing_rate_F = hist(F,200)*10;
Favg= mean(firing_rate_F);

G=spikeTimes{1,3};
firing_rate_G = hist(G,200)*10;
Gavg= mean(firing_rate_G);

H=spikeTimes{1,2};
firing_rate_H = hist(H,200)*10;
Havg= mean(firing_rate_H);

I=spikeTimes{1,1};
firing_rate_I = hist(I,200)*10;
Iavg= mean(firing_rate_I);

firing_avg=[Aavg;Bavg;Cavg;Davg;Eavg;Favg;Gavg;Havg;Iavg];
figure;
plot(contrasts,firing_avg)
xlabel('Contrasts');
ylabel('Firing Average');
title('Average Firing Rate as a Function of Contrast');


%% Problem 1 E
x=1:1:400;
y=zeros(1,400); %number of stimuli averaged before spike. (same for A-I)
for i=1:max(A)
    if any(A==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(A);
normalization=sum(y.*y); 
STA_A=y/normalization;
figure;
plot(x,STA_A);
title('A');
xlabel('Tau');
ylabel('Spike Triggered Average');


x=1:1:400;
y=zeros(1,400);
for i=427:max(B)
    if any(B==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(B);
normalization=sum(y.*y);
STA_B=y/normalization;
figure;
plot(x,STA_B);
title('B');
xlabel('Tau');
ylabel('Spike Triggered Average');

x=1:1:400;
y=zeros(1,400);
for i=1:max(C)
    if any(C==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(C);
normalization=sum(y.*y);
STA_C=y/normalization;
figure;
plot(x,STA_C);
title('C');
xlabel('Tau');
ylabel('Spike Triggered Average');

x=1:1:400;
y=zeros(1,400);
for i=427:max(D)
    if any(D==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(D);
normalization=sum(y.*y);
STA_D=y/normalization;
figure;
plot(x,STA_D);
title('D')
xlabel('Tau');
ylabel('Spike Triggered Average');

x=1:1:400;
y=zeros(1,400);
for i=1:max(E)
    if any(E==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(E);
normalization=sum(y.*y);
STA_E=y/normalization;
figure;
plot(x,STA_E);
title('E');
xlabel('Tau');
ylabel('Spike Triggered Average');

x=1:1:400;
y=zeros(1,400);
for i=1:max(F)
    if any(F==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(F);
normalization=sum(y.*y);
STA_F=y/normalization;
figure;
plot(x,STA_F);
title('F');
xlabel('Tau');
ylabel('Spike Triggered Average');

x=1:1:400;
y=zeros(1,400);
for i=1:max(G)
    if any(G==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(G);
normalization=sum(y.*y);
STA_G=y/normalization;
figure;
plot(x,STA_G);
title('G');
xlabel('Tau');
ylabel('Spike Triggered Average');

x=1:1:400;
y=zeros(1,400);
for i=1:max(H)
    if any(H==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(H);
normalization=sum(y.*y);
STA_H=y/normalization;
figure;
plot(x,STA_H);
title('H');
xlabel('Tau');
ylabel('Spike Triggered Average');

x=1:1:400;
y=zeros(1,400);
for i=69430:max(I)
    if any(I==i)
        y= y+(stimulus(i-400:i-1));
    end
end
y=y/length(I);
normalization=sum(y.*y);
STA_I=y/normalization;
figure;
plot(x,STA_I);
title('I');
xlabel('Tau');
ylabel('Spike Triggered Average');

%%


%% Problem 3 a
k=1;
sigmax=2;
sigmay=2;
sigma=2;
phi=0;

a=linspace(-5,5,1000);
b=linspace(-5,5,1000);
[x,y]=meshgrid(a,b);4

D_s=(1/(2*pi*sigmax*sigmay))*exp((-x.^2/(2*sigmax^2))-(y.^2/(2*sigmay^2)))*cos(k*x-phi);

figure;
imagesc(a,b,D_s)
title('Spatial Component of Receptive Field');

%% Problem 3 B
alpha=1/15 %ms

tau=linspace(1,300,1000);
D_t=alpha*exp(-alpha*tau).*((((alpha*tau).^5)/factorial(5))-((alpha*tau).^7)/factorial(7));
figure;
plot(tau,D_t);
xlabel('tau');
ylabel('D_t');
title('Temporal Component of Receptive Field');

%% Problem 3 C
tau=[255,210,165,120,75,30]; %ms
D_t=alpha*exp(-alpha*tau).*((((alpha*tau).^5)/factorial(5))-((alpha*tau).^7)/factorial(7));
for i=1:6
    D=D_s*D_t(i);
    figure;
    imagesc(a,b,D)
end

%% Problem 3 D
x_space=linspace(0,10,1000);
y_space=linspace(0,10,1000);
K_space=linspace(0,3,3);
Theta_space=linspace(0,2*pi,3);

[x,y]=meshgrid(x_space,y_space);
S(x,y,t)= A*cos(K*x*cos(theta)+K*y*sin(theta-phi))*cos(omega*t)
