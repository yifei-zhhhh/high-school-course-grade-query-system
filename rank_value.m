function m=rank_value(A)
% overview: rank_value is to give the given matrix ranking and percentage
% while unify some columns.

% set all the first column to be 0
A(:,1)=0;
% take the actualindex out, which means the index that attend the exam, and
% unusedindex for the rest.
actualindex=A(:,2)~=-2;
unusedindex=A(:,2)==-2;
unusedscore=A(unusedindex,:);
sizeofunusedscore=size(unusedscore);
% enlarge the unusedscore to 7 columns to be consistent
unusedscore=[unusedscore zeros(sizeofunusedscore(1),2)];
actualscore=A(actualindex,:);
if ~isempty(actualscore)
    % give the ranking: students with the same score gets the same ranking
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
    % give the percentage
    for i=1:sizeoftemp(1)
        temp(i,7)=100-round((temp(i,6)/rk)*100);
    end
    % take the unusedscore back and sort according to ID
    temp=[temp;unusedscore];
    [~,useindex]=sort(temp(:,3));
    m=temp(useindex,:);
else
    m=unusedscore;
end
end
