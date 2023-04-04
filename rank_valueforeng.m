function m=rank_valueforeng(A)
% overview: almost the same with rank_value, but serves for Engconvert.m
% which the first column is not set to be 0
actualindex=A(:,2)~=-2;
unusedindex=A(:,2)==-2;
unusedscore=A(unusedindex,:);
sizeofunusedscore=size(unusedscore);
unusedscore=[unusedscore zeros(sizeofunusedscore(1),2)];
actualscore=A(actualindex,:);
if ~isempty(actualscore)
    [~,idx]=sort(actualscore(:,2),'descend');
    temp=actualscore(idx,:);
    temp=[temp zeros(length(temp),2)];
    rk=1;
    temp(1,6)=1;
    
    sizeoftemp=size(temp);
    for i=2:sizeoftemp(1)
        if temp(i,2)==temp(i-1,2)
            temp(i,6)=temp(i-1,6);
            rk=rk+1;
        else
            rk=rk+1;
            temp(i,6)=rk;
        end
    end

    for i=1:sizeoftemp(1)
        temp(i,7)=100-round((temp(i,6)/rk)*100);
    end
    temp=[temp;unusedscore];
    [~,useindex]=sort(temp(:,3));
    m=temp(useindex,:);
else
    m=unusedscore;
end
end
