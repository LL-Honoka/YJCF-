clc,clear
yt = load('fadian.txt');
n = length(yt),alpha = 0.3;st1(1) = yt(1);st2(1) = yt(1);
for i = 2:n
    st1(i) = alpha*yt(i)+(1-alpha)*st1(i-1);
    st2(i) = alpha*st1(i)+(1-alpha)*st2(i-1);
end
xlswrite('fadian.xls',[st1',st2'])
at = 2*st1-st2;
bt = alpha/(1-alpha)*(st1-st2);
yhat = at+bt;
xlswrite('fadian.xls',yhat','Sheet1','C2')
str = ['C',int2str(n+2)];
xlswrite('fadian.xls',at(n)+2*bt(n),'Sheet1',str)