function [progress,decline]=fluctuation_range(directory,grade,subjectID,testID)
% overview: based on confidence intervals, give the abnormal fluctuation
% of students and report the student ID.

% First, take out the data of certain exam from the generated table.
if testID==11||testID==36||testID==37
    disp('The range of fluctuations cannot be compared.');
else
    [~,~,~,~,~,~,~,~,~,~,~,allinone,allintotal,~]=readdata(2048,directory);
    testIDtotal=[11,12,13,21,22,23,24,25,26,27,31,32,33,34,35,38];
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
    % allinonetest_this is the used data
    allinonetest_this=allinonesubject(allinonesubject(:,5)==testID,:);
    
    % for junior and senior, many tests only have part of students to
    % attend so that it's necessary to seek them out and also because of
    % the total students number becomes smaller, the confidence interval
    % needs to set a little bit larger.
    % Here, for chinese math and english, confidence interval is set to be
    % 95%,while for others, it is set to be 93%.
    if grade>=2
    decline=[];
    progress=[];
    for i=1:length(allinonetest_this)
        if allinonetest_this(i,2)~=-2
        if subjectID>=1&&subjectID<=5
            a=0.03;
        else
            a=0.07;
        end
        
        r=allinonesubject(allinonesubject(:,3)==i+grade*1000,7)';
        [~,~,range,~]=normfit(r,a);
            if allinonetest_this(i,7)>range(2)
                progress=[progress i+grade*1000];
            elseif allinonetest_this(i,7)<range(1)
                decline=[decline i+grade*1000];
            end
        end
    end
    end
    
    
    if grade==1
    testID_last=testIDtotal(find(testIDtotal==testID)-1);
    allinonetest_last=allinonesubject(allinonesubject(:,5)==testID_last,:);
    result_this=allinonetest_this(:,2);
    result_last=allinonetest_last(:,2);
    fluc_range=(result_this-result_last)./result_last;
    progress=allinonetest_this(fluc_range(:,1)>0.25,3);
    decline=allinonetest_this(fluc_range(:,1)<-0.2,3);
    end
end
end
