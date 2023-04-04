function A=BioGeoTransfer(B,A)
% Overview: BioGeoTransfer serves for tests after gaokao for Bio and Geo, and gives
% them the score.
[len,~]=size(A);
for i=1:len
    if B(i,2)~=-2
        A(i,2)=B(i,2);
        A(i,1)=100;
        A(i,6)=B(i,6);
        A(i,7)=B(i,7);
    end
end

end