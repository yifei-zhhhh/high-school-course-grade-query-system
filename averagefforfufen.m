function statistic=averagefforfufen(A)
% Overview: averagefforfufen is similar to averageff but takes original
% score out for analysis.
actualindex=A(:,2)~=-2;
actualscore=A(actualindex,1);
meanvalue=mean(actualscore);
medianvalue=median(actualscore);
stdvalue=std(actualscore);
varvalue=var(actualscore);
rangeofa=max(actualscore)-min(actualscore);
sizeofa=size(A);
if sizeofa(2)==7
    [~,I1]=min(abs(A(:,7)-25));
    q3=A(I1,1);
    [~,I2]=min(abs(A(:,7)-75));
    q1=A(I2,1);
statistic=[meanvalue q1 medianvalue q3 stdvalue varvalue rangeofa];
end
