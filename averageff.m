function statistic=averageff(A)
% Overview:averageff is used to calculate some statistic values like
% mean,median... and give them back to averagegra.
actualindex=A(:,2)~=-2;
actualscore=A(actualindex,2);
meanvalue=mean(actualscore);
medianvalue=median(actualscore);
stdvalue=std(actualscore);
varvalue=var(actualscore);
rangeofa=max(actualscore)-min(actualscore);
sizeofa=size(A);
if sizeofa(2)==7
    [~,I1]=min(abs(A(:,7)-25));
    q3=A(I1,2);
    [~,I2]=min(abs(A(:,7)-75));
    q1=A(I2,2);
statistic=[meanvalue q1 medianvalue q3 stdvalue varvalue rangeofa];
end
