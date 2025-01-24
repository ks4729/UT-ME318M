load('cardata-1.mat');
%{
a = zeros([1 length(t)]);
a(1) = (v(2) - v(1))/(t(2)-t(1)); %forward approximation on the initial acceleration
for i=2:length(t)-1
    a(i) = (v(i+1) - v(i-1))/(t(i+1) - t(i-1)); %central approximation for middle accelerations
end    
a(length(t)) = (v(length(t)) - v(length(t)-1))/(t(length(t))-t(length(t)-1)); %forward approximation on the initial acceleration

plot(t,a, 'o')
title('Car Acceleration');
xlabel('t (s)');
ylabel('a (m/s^{2})');

disp(a(find(t==24)));
%}

%{

x = zeros([1 length(t)]);
for i = 1:length(t)-1
    for j = 1:i
        x(i+1) = x(i+1) + (1/2)*(t(j+1) - t(j))*(v(j) + v(j+1));
    end
end

plot(t,x, 'o')
title('Car Position');
xlabel('t (s)');
ylabel('x (m)');

disp(x(find(t==24)));
%}


compositeSimpsons = (24-0)*(v(1) + 4*(v(2)+v(4)+v(6)) + 2*(v(3)+v(5)) + v(7))/(3*7);
%using the formula. Technically, v naught is v(1) here, so when we multiply
%odd indeces by 4, we move up by one in v(i) to get even indeces multiplied
%by 4
disp(compositeSimpsons);
disp(abs((compositeSimpsons-764.6773)/764.6773))