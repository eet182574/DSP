% Program to synthesis instrumental speech signals using Karplus algorithms

clc, clear all, close('all');

% Set variables
Alpha = 0.9;
M = 100;
Delay = zeros(1,M);
n = linspace(0,100,101);

% Generate Sine Wave
x = sin((2*pi/100) * n);
figure, plot(n,x); title('Sinusoid Input Signal x[n]');

% Generate Sine Wave
y = (1/50) * n -1;
figure, plot(n,y); title('Ramp Input Signal y[n]');

% Generate Random Waveform
z = -2 * rand(101) + 1;
figure, plot(n,z); title('Random Input Signal z[n]');


% Generate Signals
temp = z;
flag = 0; 
while(1)
%     flag = mod(flag + 1,2);
%     if flag == 0
%         M = 100;
%     else 
%         M = 200;
%     end
    Delay = zeros(1,M);
Result = zeros(1,10^3+1);
for index = 1:length(Result)
    if index <= length(temp)
        Result(index) = temp(index) + Alpha * Delay(1);
        Delay(1:end-1) = Delay(2:end);
        Delay(end) = Result(index);
    else
        Result(index) = Alpha * Delay(1);
        Delay(1:end-1) = Delay(2:end);
        Delay(end) = Result(index);
    end
end
soundsc(Result,44000);
end
figure, plot(Result),title('Generated Signal');

% Play sound at fs = 44 kHz


