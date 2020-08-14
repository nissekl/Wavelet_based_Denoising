%DSP HW10
load('hw10.mat');


%% 3(b) Calculate SNRy
denomiatory = norm(y-x)^2;
numeratory = norm(x)^2;
snry = numeratory/denomiatory

%% 3(c) Compute DWT  
dwtmode('per')
[cx, l] = wavedec(x, log2(4096), 'db3');
[cy, l] = wavedec(y, log2(4096), 'db3');
%% 3(d) Threshold Measure DWT cy
thresh = @(c,lam) c.*(abs(c)>lam);
lam = 3.5*sig
c_hat = thresh(cy,lam);
[m,n]=size(c_hat)
%% 3(e) Signal Estimate
x_hat = waverec(c_hat, l, 'db3');

%% 3(f) Calculate SNRx
denomiatorx = norm(x_hat-x);
numeratorx = norm(x);
snrx = numeratorx/denomiatorx

%% 3(g) Draw all th eplots
ax1= [0.8 1e4 -6 25];
ls=l+0.45;

subplot(3,2,1)
plot([1:4096],x)
ylabel('Clean Signa') 

subplot(3,2,2)
stem(cx,'MarkerSize',eps); 
set(gca,'XScale','log')
axis(ax1);
hold on 
plot([ls.';ls.'],[ax1(3);ax1(4)],'--r')
hold off

subplot(3,2,3)
plot([1:4096],y)
ylabel('Noisy Signal') 

subplot(3,2,4)
stem(cy,'MarkerSize',1); 
set(gca,'XScale','log')
axis(ax1);
hold on 
plot([ls.';ls.'],[ax1(3);ax1(4)],'--r')
hold off


subplot(3,2,5)
plot([1:4096],x_hat)
hold on
plot([1:4096],x,'r')
ylabel('recovered Signal') 

subplot(3,2,6)
stem(c_hat,'MarkerSize',1); 
set(gca,'XScale','log')
axis(ax1);
hold on 
plot([ls.';ls.'],[ax1(3);ax1(4)],'--r')
hold off
