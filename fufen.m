function test=fufen(standard,test)
% Overview: take the standard line out and apply to the given data to get
% converted score.

% take the standard line out:
[~,idx]=sort(standard(:,2));
standard=standard(idx,:);
standardline=[standard(:,2) standard(:,7)];
standardline=standardline(standardline(:,1)~=-2,:);
uniquestandardline=standardline(1,:);
for i=2:length(standardline)
     if standardline(i,2)~=standardline(i-1,2)
          uniquestandardline=[uniquestandardline;standardline(i,:)];
     end
end

% Apply it to given test
for i=1:length(test)
    test(i,1)=test(i,2);
    if test(i,2)~=-2
        issuccessful=0;
        for j=1:length(uniquestandardline)
            if test(i,7)>=uniquestandardline(j,2)
                test(i,2)=uniquestandardline(j,1);
                issuccessful=1;
            end
            if issuccessful==0
                test(i,2)=uniquestandardline(1,1);
            end
        end
    end
end

end


