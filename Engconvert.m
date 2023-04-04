function A=Engconvert(standard,A)
% Overview: This function serves for the policy to choose the higher
% English score within two tests. Take difficulty level into
% consideration, here we take percentage as standard, which means student
% will take the higher percentage of the two tests, and get the score
% correspondingly.
A(:,1)=A(:,2);
for i=1:length(A)
    if standard(i,7)>A(i,7)
        [~,I]=min(abs(A(:,7)-standard(i,7)));
        A(i,2)=A(I(1),2);
    end
end
A=A(:,1:5);
A=rank_valueforeng(A);
end