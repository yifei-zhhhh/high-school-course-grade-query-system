function statsiticset = averagegra(directory,grade,subjectID,testID)
% Overview: averagegra is a function used to get different stastic data for certain
% test data, the main part in this function is taking certain table
% out,while the calculation part is put in averagefforfufen and averageff
    [~,~,~,~,~,~,~,~,~,~,~,allinone,allintotal,~]=readdata(2048,directory);
    allinonegrade=allinone(allinone(:,3)/1000<2,:);
    if grade==1
        allinonegrade=allinone(allinone(:,3)/1000<2,:);
        allinonetotal=allintotal(allintotal(:,3)/1000<2,:);
        allinonegrade=[allinonegrade;allinonetotal];
    elseif grade==2
        allinonegrade=allinone(allinone(:,3)/1000>2&allinone(:,3)/1000<3,:);
        allinonegradetotal=allintotal(allintotal(:,3)-mod(allintotal,1000)==2,:);
        allinonegrade=[allinonegrade;allinonegradetotal];
    elseif grade==3
        allinonegrade=allinone(allinone(:,3)>3,:);
        allinonetotal=allinone(allintotal(:,3)>3,:);
        allinonegrade=[allinonegrade;allinonetotal];
    end
allinonesubject=allinonegrade(allinonegrade(:,4)==subjectID,:);
allinonetest=allinonesubject(allinonesubject(:,5)==testID,:);
if subjectID<=3
    statsiticset=averageff(allinonetest);
else
    statsiticset=averagefforfufen(allinonetest);
end
end
