
function [chi,mat,eng,phy,che,bio,pol,his,geo,all,total,allinone,...
    allinonetotal,prediction]=readdata(testID,directory)

% Overview: 

% This function is the main function in the data processing part, including
% the load-in, process, generate and extraction.

% Input and Output:
% --Input: the two inputs are testID(student's ID,used for 
% data extraction) and directory (will be read in the GUI). 
% --Output: There are totally 14 inputs, the first nine(chi~geo) represents 
% the score data for certain students. All is the generation of these nine 
% matrixes and total represents for the total score for each exam for 
% certain student. allinone and allintotal are the data for all students, 
% which serves for the fluctuation_range.m and averagegra.m. And finally, 
% prediction is the predicted score for certain students.

% Menu:
% data loadin and process: 30-904
%     graduate:30-47
%     senior:51-379
%     junior:391-683
%     freshman:695-844
% data extraction: 905-end

%--------------------------------------------------------------------------

% load in data for graduate to get history data, this especially serves for
% all the fufen part.
graduate_gaokao_Physics=importdata([directory '/graduate/gaokao/graduate_gaokao_Physics.csv']);
graduate_gaokao_Chemistry=importdata([directory '/graduate/gaokao/graduate_gaokao_Chemistry.csv']);
graduate_gaokao_Politics=importdata([directory '/graduate/gaokao/graduate_gaokao_Politics.csv']);
graduate_gaokao_History=importdata([directory '/graduate/gaokao/graduate_gaokao_History.csv']);
 
graduate_gaokao_Physics=rank_value(graduate_gaokao_Physics.data);
graduate_gaokao_Chemistry=rank_value(graduate_gaokao_Chemistry.data);
graduate_gaokao_Politics=rank_value(graduate_gaokao_Politics.data);
graduate_gaokao_History=rank_value(graduate_gaokao_History.data);

% set the standardline for certain subjects as the score of the graduate
% student.
Physicsstandard=graduate_gaokao_Physics;
Chemistrystandard=graduate_gaokao_Chemistry;
Politicsstandard=graduate_gaokao_Politics;
Historystandard=graduate_gaokao_History;



% load in data of senior students;
% the examID is set to be: gaokao=37 chunkao=36 nine1=31 six1=34 nine2=32
% nine3=33 six2=35 six3=38
% Special mention: 36 only has the data of chinese,math and english, and
% 37 only contains data of biology and geography.
senior_six2_Chinese=importdata([directory '/senior/six2/senior_six2_Chinese.csv']);
senior_six2_Math=importdata([directory '/senior/six2/senior_six2_Math.csv']);
senior_six2_English=importdata([directory '/senior/six2/senior_six2_English.csv']);
senior_six2_Physics=importdata([directory '/senior/six2/senior_six2_Physics.csv']);
senior_six2_Chemistry=importdata([directory '/senior/six2/senior_six2_Chemistry.csv']);
senior_six2_Biology=importdata([directory '/senior/six2/senior_six2_Biology.csv']);
senior_six2_Politics=importdata([directory '/senior/six2/senior_six2_Politics.csv']);
senior_six2_History=importdata([directory '/senior/six2/senior_six2_History.csv']);
senior_six2_Geography=importdata([directory '/senior/six2/senior_six2_Geography.csv']);

senior_six1_Chinese=importdata([directory '/senior/six1/senior_six1_Chinese.csv']);
senior_six1_Math=importdata([directory '/senior/six1/senior_six1_Math.csv']);
senior_six1_English=importdata([directory '/senior/six1/senior_six1_English.csv']);
senior_six1_Physics=importdata([directory '/senior/six1/senior_six1_Physics.csv']);
senior_six1_Chemistry=importdata([directory '/senior/six1/senior_six1_Chemistry.csv']);
senior_six1_Biology=importdata([directory '/senior/six1/senior_six1_Biology.csv']);
senior_six1_Politics=importdata([directory '/senior/six1/senior_six1_Politics.csv']);
senior_six1_History=importdata([directory '/senior/six1/senior_six1_History.csv']);
senior_six1_Geography=importdata([directory '/senior/six1/senior_six1_Geography.csv']);

senior_six3_Chinese=importdata([directory '/senior/six3/senior_six3_Chinese.csv']);
senior_six3_Math=importdata([directory '/senior/six3/senior_six3_Math.csv']);
senior_six3_English=importdata([directory '/senior/six3/senior_six3_English.csv']);
senior_six3_Physics=importdata([directory '/senior/six3/senior_six3_Physics.csv']);
senior_six3_Chemistry=importdata([directory '/senior/six3/senior_six3_Chemistry.csv']);
senior_six3_Biology=importdata([directory '/senior/six3/senior_six3_Biology.csv']);
senior_six3_Politics=importdata([directory '/senior/six3/senior_six3_Politics.csv']);
senior_six3_History=importdata([directory '/senior/six3/senior_six3_History.csv']);
senior_six3_Geography=importdata([directory '/senior/six3/senior_six3_Geography.csv']);

senior_nine1_Chinese=importdata([directory '/senior/nine1/senior_nine1_Chinese.csv']);
senior_nine1_Math=importdata([directory '/senior/nine1/senior_nine1_Math.csv']);
senior_nine1_English=importdata([directory '/senior/nine1/senior_nine1_English.csv']);
senior_nine1_Physics=importdata([directory '/senior/nine1/senior_nine1_Physics.csv']);
senior_nine1_Chemistry=importdata([directory '/senior/nine1/senior_nine1_Chemistry.csv']);
senior_nine1_Biology=importdata([directory '/senior/nine1/senior_nine1_Biology.csv']);
senior_nine1_Politics=importdata([directory '/senior/nine1/senior_nine1_Politics.csv']);
senior_nine1_History=importdata([directory '/senior/nine1/senior_nine1_History.csv']);
senior_nine1_Geography=importdata([directory '/senior/nine1/senior_nine1_Geography.csv']);

senior_nine2_Chinese=importdata([directory '/senior/nine2/senior_nine2_Chinese.csv']);
senior_nine2_Math=importdata([directory '/senior/nine2/senior_nine2_Math.csv']);
senior_nine2_English=importdata([directory '/senior/nine2/senior_nine2_English.csv']);
senior_nine2_Physics=importdata([directory '/senior/nine2/senior_nine2_Physics.csv']);
senior_nine2_Chemistry=importdata([directory '/senior/nine2/senior_nine2_Chemistry.csv']);
senior_nine2_Biology=importdata([directory '/senior/nine2/senior_nine2_Biology.csv']);
senior_nine2_Politics=importdata([directory '/senior/nine2/senior_nine2_Politics.csv']);
senior_nine2_History=importdata([directory '/senior/nine2/senior_nine2_History.csv']);
senior_nine2_Geography=importdata([directory '/senior/nine2/senior_nine2_Geography.csv']);

senior_nine3_Chinese=importdata([directory '/senior/nine3/senior_nine3_Chinese.csv']);
senior_nine3_Math=importdata([directory '/senior/nine3/senior_nine3_Math.csv']);
senior_nine3_English=importdata([directory '/senior/nine3/senior_nine3_English.csv']);
senior_nine3_Physics=importdata([directory '/senior/nine3/senior_nine3_Physics.csv']);
senior_nine3_Chemistry=importdata([directory '/senior/nine3/senior_nine3_Chemistry.csv']);
senior_nine3_Biology=importdata([directory '/senior/nine3/senior_nine3_Biology.csv']);
senior_nine3_Politics=importdata([directory '/senior/nine3/senior_nine3_Politics.csv']);
senior_nine3_History=importdata([directory '/senior/nine3/senior_nine3_History.csv']);
senior_nine3_Geography=importdata([directory '/senior/nine3/senior_nine3_Geography.csv']);


senior_gaokao_Geography=importdata([directory '/senior/gaokao/senior_gaokao_Geography.csv']);
senior_gaokao_Biology=importdata([directory '/senior/gaokao/senior_gaokao_Biology.csv']);


senior_chunkao_Chinese=importdata([directory '/senior/chunkao/senior_chunkao_Chinese.csv']);
senior_chunkao_Math=importdata([directory '/senior/chunkao/senior_chunkao_Math.csv']);
senior_chunkao_English=importdata([directory '/senior/chunkao/senior_chunkao_English.csv']);



% function rank_value is used to add ranking and percentage to the original data to
% help later calculation.
% After this part, all the matrix will have 7 columns:
% column2:converted score(the score actually used in calculating total score)
% column3:studentID
% column4:subjectID
% column5:examID
% column6:ranking(No.?)
% column7:percentange(?%) special mention: No.1=100%
% the subjectID refers to chinese-1, math-2, english-3, physics-4, 
% chemistry-5, biology-6, history-7, geography-8, politics-17
senior_nine1_Chinese=rank_value(senior_nine1_Chinese.data);
senior_nine1_Math=rank_value(senior_nine1_Math.data);
senior_nine1_English=rank_value(senior_nine1_English.data);
senior_nine1_Physics=rank_value(senior_nine1_Physics.data);
senior_nine1_Chemistry=rank_value(senior_nine1_Chemistry.data);
senior_nine1_Biology=rank_value(senior_nine1_Biology.data);
senior_nine1_History=rank_value(senior_nine1_History.data);
senior_nine1_Politics=rank_value(senior_nine1_Politics.data);
senior_nine1_Geography=rank_value(senior_nine1_Geography.data);
senior_nine2_Chinese=rank_value(senior_nine2_Chinese.data);
senior_nine2_Math=rank_value(senior_nine2_Math.data);
senior_nine2_English=rank_value(senior_nine2_English.data);
senior_nine2_Physics=rank_value(senior_nine2_Physics.data);
senior_nine2_Chemistry=rank_value(senior_nine2_Chemistry.data);
senior_nine2_Biology=rank_value(senior_nine2_Biology.data);
senior_nine2_History=rank_value(senior_nine2_History.data);
senior_nine2_Politics=rank_value(senior_nine2_Politics.data);
senior_nine2_Geography=rank_value(senior_nine2_Geography.data);
senior_nine3_Chinese=rank_value(senior_nine3_Chinese.data);
senior_nine3_Math=rank_value(senior_nine3_Math.data);
senior_nine3_English=rank_value(senior_nine3_English.data);
senior_nine3_Physics=rank_value(senior_nine3_Physics.data);
senior_nine3_Chemistry=rank_value(senior_nine3_Chemistry.data);
senior_nine3_Biology=rank_value(senior_nine3_Biology.data);
senior_nine3_History=rank_value(senior_nine3_History.data);
senior_nine3_Politics=rank_value(senior_nine3_Politics.data);
senior_nine3_Geography=rank_value(senior_nine3_Geography.data);
senior_six1_Chinese=rank_value(senior_six1_Chinese.data);
senior_six1_Math=rank_value(senior_six1_Math.data);
senior_six1_English=rank_value(senior_six1_English.data);
senior_six1_Physics=rank_value(senior_six1_Physics.data);
senior_six1_Chemistry=rank_value(senior_six1_Chemistry.data);
senior_six1_Biology=rank_value(senior_six1_Biology.data);
senior_six1_History=rank_value(senior_six1_History.data);
senior_six1_Politics=rank_value(senior_six1_Politics.data);
senior_six1_Geography=rank_value(senior_six1_Geography.data);
senior_six2_Chinese=rank_value(senior_six2_Chinese.data);
senior_six2_Math=rank_value(senior_six2_Math.data);
senior_six2_English=rank_value(senior_six2_English.data);
senior_six2_Physics=rank_value(senior_six2_Physics.data);
senior_six2_Chemistry=rank_value(senior_six2_Chemistry.data);
senior_six2_Biology=rank_value(senior_six2_Biology.data);
senior_six2_History=rank_value(senior_six2_History.data);
senior_six2_Politics=rank_value(senior_six2_Politics.data);
senior_six2_Geography=rank_value(senior_six2_Geography.data);
senior_six3_Chinese=rank_value(senior_six3_Chinese.data);
senior_six3_Math=rank_value(senior_six3_Math.data);
senior_six3_English=rank_value(senior_six3_English.data);
senior_six3_Physics=rank_value(senior_six3_Physics.data);
senior_six3_Chemistry=rank_value(senior_six3_Chemistry.data);
senior_six3_Biology=rank_value(senior_six3_Biology.data);
senior_six3_History=rank_value(senior_six3_History.data);
senior_six3_Politics=rank_value(senior_six3_Politics.data);
senior_six3_Geography=rank_value(senior_six3_Geography.data);
senior_gaokao_Geography=rank_value(senior_gaokao_Geography.data);
senior_gaokao_Biology=rank_value(senior_gaokao_Biology.data);
senior_chunkao_Chinese=rank_value(senior_chunkao_Chinese.data);
senior_chunkao_Math=rank_value(senior_chunkao_Math.data);
senior_chunkao_English=rank_value(senior_chunkao_English.data);

% set the standard for biology and geography
Biologystandard=senior_gaokao_Biology;
Geographystandard=senior_gaokao_Geography;

% Function fufen is to give converted score based on the ranking and the
% standard line, after this part, column 1 becomes the original score and
% column 2 becomes the converted score.
senior_nine3_Geography=fufen(Geographystandard,senior_nine3_Geography);
senior_nine1_Geography=fufen(Geographystandard,senior_nine1_Geography);
senior_nine2_Geography=fufen(Geographystandard,senior_nine2_Geography);

senior_nine3_Biology=fufen(Biologystandard,senior_nine3_Biology);
senior_nine2_Biology=fufen(Biologystandard,senior_nine2_Biology);
senior_nine1_Biology=fufen(Biologystandard,senior_nine1_Biology);

senior_nine3_Chemistry=fufen(Chemistrystandard,senior_nine3_Chemistry);
senior_nine2_Chemistry=fufen(Chemistrystandard,senior_nine2_Chemistry);
senior_nine1_Chemistry=fufen(Chemistrystandard,senior_nine1_Chemistry);


senior_nine3_Politics=fufen(Politicsstandard,senior_nine3_Politics);
senior_nine2_Politics=fufen(Politicsstandard,senior_nine2_Politics);
senior_nine1_Politics=fufen(Politicsstandard,senior_nine1_Politics);

senior_nine3_Physics=fufen(Physicsstandard,senior_nine3_Physics);
senior_nine2_Physics=fufen(Physicsstandard,senior_nine2_Physics);
senior_nine1_Physics=fufen(Physicsstandard,senior_nine1_Physics);


senior_nine3_History=fufen(Historystandard,senior_nine3_History);
senior_nine2_History=fufen(Historystandard,senior_nine2_History);
senior_nine1_History=fufen(Historystandard,senior_nine1_History);

senior_six3_Geography=fufen(Geographystandard,senior_six3_Geography);
senior_six1_Geography=fufen(Geographystandard,senior_six1_Geography);
senior_six2_Geography=fufen(Geographystandard,senior_six2_Geography);

senior_six3_Biology=fufen(Biologystandard,senior_six3_Biology);
senior_six2_Biology=fufen(Biologystandard,senior_six2_Biology);
senior_six1_Biology=fufen(Biologystandard,senior_six1_Biology);

senior_six3_Chemistry=fufen(Chemistrystandard,senior_six3_Chemistry);
senior_six2_Chemistry=fufen(Chemistrystandard,senior_six2_Chemistry);
senior_six1_Chemistry=fufen(Chemistrystandard,senior_six1_Chemistry);


senior_six3_Politics=fufen(Politicsstandard,senior_six3_Politics);
senior_six2_Politics=fufen(Politicsstandard,senior_six2_Politics);
senior_six1_Politics=fufen(Politicsstandard,senior_six1_Politics);

senior_six3_Physics=fufen(Physicsstandard,senior_six3_Physics);
senior_six2_Physics=fufen(Physicsstandard,senior_six2_Physics);
senior_six1_Physics=fufen(Physicsstandard,senior_six1_Physics);


senior_six3_History=fufen(Historystandard,senior_six3_History);
senior_six2_History=fufen(Historystandard,senior_six2_History);
senior_six1_History=fufen(Historystandard,senior_six1_History);


% BioGeoTransfer is used for the situation that after gaokao for Biology
% and Geography in junior, the score is frozen to the gaokao result.
senior_six1_Biology=BioGeoTransfer(Biologystandard,senior_six1_Biology);
senior_six2_Biology=BioGeoTransfer(Biologystandard,senior_six2_Biology);
senior_six3_Biology=BioGeoTransfer(Biologystandard,senior_six3_Biology);
senior_six3_Geography=BioGeoTransfer(Geographystandard,senior_six3_Geography);
senior_six2_Geography=BioGeoTransfer(Geographystandard,senior_six2_Geography);
senior_six1_Geography=BioGeoTransfer(Geographystandard,senior_six1_Geography);

% English convert is used for the situation that after the first test for
% English in chunkao, the higher score between the actual score and chunkao
% score should be chosen. Taking consideration of the difficulty
% difference, here use ranking as a standard.
senior_six3_English=Engconvert(senior_chunkao_English,senior_six3_English);


% here we generate all subjects data(ranking include into one table for
% every exam
senior_nine1=[senior_nine1_Chinese;senior_nine1_Math;senior_nine1_English;...
    senior_nine1_Physics;senior_nine1_Chemistry;senior_nine1_Biology;...
    senior_nine1_Politics;senior_nine1_History;senior_nine1_Geography];
senior_nine2=[senior_nine2_Chinese;senior_nine2_Math;senior_nine2_English;...
    senior_nine2_Physics;senior_nine2_Chemistry;senior_nine2_Biology;...
    senior_nine2_Politics;senior_nine2_History;senior_nine2_Geography];
senior_nine3=[senior_nine3_Chinese;senior_nine3_Math;senior_nine3_English;...
    senior_nine3_Physics;senior_nine3_Chemistry;senior_nine3_Biology;...
    senior_nine3_Politics;senior_nine3_History;senior_nine3_Geography];
senior_six1=[senior_six1_Chinese;senior_six1_Math;senior_six1_English;...
    senior_six1_Physics;senior_six1_Chemistry;senior_six1_Biology;...
    senior_six1_Politics;senior_six1_History;senior_six1_Geography];
senior_six2=[senior_six2_Chinese;senior_six2_Math;senior_six2_English;...
    senior_six2_Physics;senior_six2_Chemistry;senior_six2_Biology;...
    senior_six2_Politics;senior_six2_History;senior_six2_Geography];
senior_six3=[senior_six3_Chinese;senior_six3_Math;senior_six3_English;...
    senior_six3_Physics;senior_six3_Chemistry;senior_six3_Biology;...
    senior_six3_Politics;senior_six3_History;senior_six3_Geography];
senior_gaokao=[senior_gaokao_Geography;senior_gaokao_Biology];
senior_chunkao=[senior_chunkao_Chinese;senior_chunkao_Math;senior_chunkao_English];

%and now generate all exam data into one table
senior=[senior_nine1;senior_nine2;senior_nine3;senior_six1;senior_six2;...
    senior_chunkao;senior_gaokao;senior_six3];


% get one's total grade for each exam.
% Special:!!in this data set, gaokao only consists Biology and Geography
% and only a few of students attended, so there's no need to calculate its
% total grade.
senior_total_grade_1=ones(length(senior_nine1_Chinese),5);
senior_total_grade_2=ones(length(senior_nine1_Chinese),5);
senior_total_grade_3=ones(length(senior_nine1_Chinese),5);
senior_total_grade_4=ones(length(senior_nine1_Chinese),5);
senior_total_grade_5=ones(length(senior_nine1_Chinese),5);
senior_total_grade_6=ones(length(senior_nine1_Chinese),5);
senior_total_grade_8=ones(length(senior_nine1_Chinese),5);
i_for_all_grades_1=1;
i_for_all_grades_2=1;
i_for_all_grades_3=1;
i_for_all_grades_4=1;
i_for_all_grades_5=1;
i_for_all_grades_6=1;
i_for_all_grades_8=1;

for ID=3001:3078
    all_grades=senior(senior(:,3)==ID,:);
    all_grades(all_grades==-2)=0;
    senior_total_grade_1(i_for_all_grades_1,2)=sum(all_grades((all_grades(:,5)==31),2));
    senior_total_grade_1(i_for_all_grades_1,3)=ID;
    senior_total_grade_1(i_for_all_grades_1,5)=31;
    senior_total_grade_1(i_for_all_grades_1,4)=20;

    
    senior_total_grade_2(i_for_all_grades_2,2)=sum(all_grades((all_grades(:,5)==32),2));
    senior_total_grade_2(i_for_all_grades_2,3)=ID;
    senior_total_grade_2(i_for_all_grades_2,5)=32;
    senior_total_grade_2(i_for_all_grades_2,4)=20;

    senior_total_grade_3(i_for_all_grades_3,2)=sum(all_grades((all_grades(:,5)==33),2));
    senior_total_grade_3(i_for_all_grades_3,3)=ID;
    senior_total_grade_3(i_for_all_grades_3,5)=33;
    senior_total_grade_3(i_for_all_grades_3,4)=20;
    
    senior_total_grade_4(i_for_all_grades_4,2)=sum(all_grades((all_grades(:,5)==34),2));
    senior_total_grade_4(i_for_all_grades_4,3)=ID;
    senior_total_grade_4(i_for_all_grades_4,5)=34;
    senior_total_grade_4(i_for_all_grades_4,4)=20;
    
    senior_total_grade_5(i_for_all_grades_5,2)=sum(all_grades((all_grades(:,5)==35),2));
    senior_total_grade_5(i_for_all_grades_5,3)=ID;
    senior_total_grade_5(i_for_all_grades_5,5)=35;
    senior_total_grade_5(i_for_all_grades_5,4)=20;
    
    senior_total_grade_6(i_for_all_grades_6,2)=sum(all_grades((all_grades(:,5)==36),2));
    senior_total_grade_6(i_for_all_grades_6,3)=ID;
    senior_total_grade_6(i_for_all_grades_6,5)=36;
    senior_total_grade_6(i_for_all_grades_6,4)=20;
    
    senior_total_grade_8(i_for_all_grades_8,2)=sum(all_grades((all_grades(:,5)==38),2));
    senior_total_grade_8(i_for_all_grades_8,3)=ID;
    senior_total_grade_8(i_for_all_grades_8,5)=38;
    senior_total_grade_8(i_for_all_grades_8,4)=20;
    
    i_for_all_grades_1=i_for_all_grades_1+1;
    i_for_all_grades_2=i_for_all_grades_2+1;
    i_for_all_grades_3=i_for_all_grades_3+1;
    i_for_all_grades_4=i_for_all_grades_4+1;
    i_for_all_grades_5=i_for_all_grades_5+1;
    i_for_all_grades_6=i_for_all_grades_6+1;
    i_for_all_grades_8=i_for_all_grades_8+1;
    
end
senior_total_grade_1=rank_value(senior_total_grade_1);
senior_total_grade_2=rank_value(senior_total_grade_2);
senior_total_grade_3=rank_value(senior_total_grade_3);
senior_total_grade_4=rank_value(senior_total_grade_4);
senior_total_grade_5=rank_value(senior_total_grade_5);
senior_total_grade_6=rank_value(senior_total_grade_6);
senior_total_grade_8=rank_value(senior_total_grade_8);

senior_total_grade=[senior_total_grade_1;senior_total_grade_2...
    ;senior_total_grade_3;senior_total_grade_4;senior_total_grade_5...
    ;senior_total_grade_6;senior_total_grade_8];











% Again, load in all the data for junior students.
% note this time, the examID is all1-21 all2-22 all3-23 all4-24 nine1-25
% nine2-26 nine3-27

junior_all2_Chinese=importdata([directory '/junior/all2/Chinese.csv']);
junior_all2_Math=importdata([directory '/junior/all2/Math.csv']);
junior_all2_English=importdata([directory '/junior/all2/English.csv']);
junior_all2_Physics=importdata([directory '/junior/all2/Physics.csv']);
junior_all2_Chemistry=importdata([directory '/junior/all2/Chemistry.csv']);
junior_all2_Biology=importdata([directory '/junior/all2/Biology.csv']);
junior_all2_Politics=importdata([directory '/junior/all2/Politics.csv']);
junior_all2_History=importdata([directory '/junior/all2/History.csv']);
junior_all2_Geography=importdata([directory '/junior/all2/Geography.csv']);

junior_all1_Chinese=importdata([directory '/junior/all1/Chinese.csv']);
junior_all1_Math=importdata([directory '/junior/all1/Math.csv']);
junior_all1_English=importdata([directory '/junior/all1/English.csv']);
junior_all1_Physics=importdata([directory '/junior/all1/Physics.csv']);
junior_all1_Chemistry=importdata([directory '/junior/all1/Chemistry.csv']);
junior_all1_Biology=importdata([directory '/junior/all1/Biology.csv']);
junior_all1_Politics=importdata([directory '/junior/all1/Politics.csv']);
junior_all1_History=importdata([directory '/junior/all1/History.csv']);
junior_all1_Geography=importdata([directory '/junior/all1/Geography.csv']);

junior_all3_Chinese=importdata([directory '/junior/all3/Chinese.csv']);
junior_all3_Math=importdata([directory '/junior/all3/Math.csv']);
junior_all3_English=importdata([directory '/junior/all3/English.csv']);
junior_all3_Physics=importdata([directory '/junior/all3/Physics.csv']);
junior_all3_Chemistry=importdata([directory '/junior/all3/Chemistry.csv']);
junior_all3_Biology=importdata([directory '/junior/all3/Biology.csv']);
junior_all3_Politics=importdata([directory '/junior/all3/Politics.csv']);
junior_all3_History=importdata([directory '/junior/all3/History.csv']);
junior_all3_Geography=importdata([directory '/junior/all3/Geography.csv']);

junior_all4_Chinese=importdata([directory '/junior/all4/Chinese.csv']);
junior_all4_Math=importdata([directory '/junior/all4/Math.csv']);
junior_all4_English=importdata([directory '/junior/all4/English.csv']);
junior_all4_Physics=importdata([directory '/junior/all4/Physics.csv']);
junior_all4_Chemistry=importdata([directory '/junior/all4/Chemistry.csv']);
junior_all4_Biology=importdata([directory '/junior/all4/Biology.csv']);
junior_all4_Politics=importdata([directory '/junior/all4/Politics.csv']);
junior_all4_History=importdata([directory '/junior/all4/History.csv']);
junior_all4_Geography=importdata([directory '/junior/all4/Geography.csv']);

junior_nine1_Chinese=importdata([directory '/junior/nine1/Chinese.csv']);
junior_nine1_Math=importdata([directory '/junior/nine1/Math.csv']);
junior_nine1_English=importdata([directory '/junior/nine1/English.csv']);
junior_nine1_Physics=importdata([directory '/junior/nine1/Physics.csv']);
junior_nine1_Chemistry=importdata([directory '/junior/nine1/Chemistry.csv']);
junior_nine1_Biology=importdata([directory '/junior/nine1/Biology.csv']);
junior_nine1_Politics=importdata([directory '/junior/nine1/Politics.csv']);
junior_nine1_History=importdata([directory '/junior/nine1/History.csv']);
junior_nine1_Geography=importdata([directory '/junior/nine1/Geography.csv']);

junior_nine2_Chinese=importdata([directory '/junior/nine2/Chinese.csv']);
junior_nine2_Math=importdata([directory '/junior/nine2/Math.csv']);
junior_nine2_English=importdata([directory '/junior/nine2/English.csv']);
junior_nine2_Physics=importdata([directory '/junior/nine2/Physics.csv']);
junior_nine2_Chemistry=importdata([directory '/junior/nine2/Chemistry.csv']);
junior_nine2_Biology=importdata([directory '/junior/nine2/Biology.csv']);
junior_nine2_Politics=importdata([directory '/junior/nine2/Politics.csv']);
junior_nine2_History=importdata([directory '/junior/nine2/History.csv']);
junior_nine2_Geography=importdata([directory '/junior/nine2/Geography.csv']);

junior_nine3_Chinese=importdata([directory '/junior/nine3/Chinese.csv']);
junior_nine3_Math=importdata([directory '/junior/nine3/Math.csv']);
junior_nine3_English=importdata([directory '/junior/nine3/English.csv']);
junior_nine3_Physics=importdata([directory '/junior/nine3/Physics.csv']);
junior_nine3_Chemistry=importdata([directory '/junior/nine3/Chemistry.csv']);
junior_nine3_Biology=importdata([directory '/junior/nine3/Biology.csv']);
junior_nine3_Politics=importdata([directory '/junior/nine3/Politics.csv']);
junior_nine3_History=importdata([directory '/junior/nine3/History.csv']);
junior_nine3_Geography=importdata([directory '/junior/nine3/Geography.csv']);


%function rank_value is used to add ranking and percentage to the original data to
%help later calculation.
junior_nine1_Chinese=rank_value(junior_nine1_Chinese.data);
junior_nine1_Math=rank_value(junior_nine1_Math.data);
junior_nine1_English=rank_value(junior_nine1_English.data);
junior_nine1_Physics=rank_value(junior_nine1_Physics.data);
junior_nine1_Chemistry=rank_value(junior_nine1_Chemistry.data);
junior_nine1_Biology=rank_value(junior_nine1_Biology.data);
junior_nine1_History=rank_value(junior_nine1_History.data);
junior_nine1_Politics=rank_value(junior_nine1_Politics.data);
junior_nine1_Geography=rank_value(junior_nine1_Geography.data);
junior_nine2_Chinese=rank_value(junior_nine2_Chinese.data);
junior_nine2_Math=rank_value(junior_nine2_Math.data);
junior_nine2_English=rank_value(junior_nine2_English.data);
junior_nine2_Physics=rank_value(junior_nine2_Physics.data);
junior_nine2_Chemistry=rank_value(junior_nine2_Chemistry.data);
junior_nine2_Biology=rank_value(junior_nine2_Biology.data);
junior_nine2_History=rank_value(junior_nine2_History.data);
junior_nine2_Politics=rank_value(junior_nine2_Politics.data);
junior_nine2_Geography=rank_value(junior_nine2_Geography.data);
junior_nine3_Chinese=rank_value(junior_nine3_Chinese);
junior_nine3_Math=rank_value(junior_nine3_Math);
junior_nine3_English=rank_value(junior_nine3_English);
junior_nine3_Physics=rank_value(junior_nine3_Physics);
junior_nine3_Chemistry=rank_value(junior_nine3_Chemistry);
junior_nine3_Biology=rank_value(junior_nine3_Biology);
junior_nine3_History=rank_value(junior_nine3_History);
junior_nine3_Politics=rank_value(junior_nine3_Politics);
junior_nine3_Geography=rank_value(junior_nine3_Geography);
junior_all1_Chinese=rank_value(junior_all1_Chinese.data);
junior_all1_Math=rank_value(junior_all1_Math.data);
junior_all1_English=rank_value(junior_all1_English.data);
junior_all1_Physics=rank_value(junior_all1_Physics.data);
junior_all1_Chemistry=rank_value(junior_all1_Chemistry.data);
junior_all1_Biology=rank_value(junior_all1_Biology.data);
junior_all1_History=rank_value(junior_all1_History.data);
junior_all1_Politics=rank_value(junior_all1_Politics.data);
junior_all1_Geography=rank_value(junior_all1_Geography.data);
junior_all2_Chinese=rank_value(junior_all2_Chinese.data);
junior_all2_Math=rank_value(junior_all2_Math.data);
junior_all2_English=rank_value(junior_all2_English.data);
junior_all2_Physics=rank_value(junior_all2_Physics.data);
junior_all2_Chemistry=rank_value(junior_all2_Chemistry.data);
junior_all2_Biology=rank_value(junior_all2_Biology.data);
junior_all2_History=rank_value(junior_all2_History.data);
junior_all2_Politics=rank_value(junior_all2_Politics.data);
junior_all2_Geography=rank_value(junior_all2_Geography.data);
junior_all3_Chinese=rank_value(junior_all3_Chinese.data);
junior_all3_Math=rank_value(junior_all3_Math.data);
junior_all3_English=rank_value(junior_all3_English.data);
junior_all3_Physics=rank_value(junior_all3_Physics.data);
junior_all3_Chemistry=rank_value(junior_all3_Chemistry.data);
junior_all3_Biology=rank_value(junior_all3_Biology.data);
junior_all3_History=rank_value(junior_all3_History.data);
junior_all3_Politics=rank_value(junior_all3_Politics.data);
junior_all3_Geography=rank_value(junior_all3_Geography.data);
junior_all4_Chinese=rank_value(junior_all4_Chinese.data);
junior_all4_Math=rank_value(junior_all4_Math.data);
junior_all4_English=rank_value(junior_all4_English.data);
junior_all4_Physics=rank_value(junior_all4_Physics.data);
junior_all4_Chemistry=rank_value(junior_all4_Chemistry.data);
junior_all4_Biology=rank_value(junior_all4_Biology.data);
junior_all4_History=rank_value(junior_all4_History.data);
junior_all4_Politics=rank_value(junior_all4_Politics.data);
junior_all4_Geography=rank_value(junior_all4_Geography.data);

% Again,the fufen part
junior_all3_Geography=fufen(Geographystandard,junior_all3_Geography);
junior_all1_Geography=fufen(Geographystandard,junior_all1_Geography);
junior_all2_Geography=fufen(Geographystandard,junior_all2_Geography);
junior_all3_Biology=fufen(Biologystandard,junior_all3_Biology);
junior_all2_Biology=fufen(Biologystandard,junior_all2_Biology);
junior_all1_Biology=fufen(Biologystandard,junior_all1_Biology);
junior_nine3_Geography=fufen(Geographystandard,junior_nine3_Geography);
junior_nine1_Geography=fufen(Geographystandard,junior_nine1_Geography);
junior_nine2_Geography=fufen(Geographystandard,junior_nine2_Geography);
junior_nine3_Biology=fufen(Biologystandard,junior_nine3_Biology);
junior_nine2_Biology=fufen(Biologystandard,junior_nine2_Biology);
junior_nine1_Biology=fufen(Biologystandard,junior_nine1_Biology);
junior_all3_Chemistry=fufen(Chemistrystandard,junior_all3_Chemistry);
junior_all2_Chemistry=fufen(Chemistrystandard,junior_all2_Chemistry);
junior_all1_Chemistry=fufen(Chemistrystandard,junior_all1_Chemistry);
junior_nine3_Chemistry=fufen(Chemistrystandard,junior_nine3_Chemistry);
junior_nine2_Chemistry=fufen(Chemistrystandard,junior_nine2_Chemistry);
junior_nine1_Chemistry=fufen(Chemistrystandard,junior_nine1_Chemistry);
junior_all3_Politics=fufen(Politicsstandard,junior_all3_Politics);
junior_all2_Politics=fufen(Politicsstandard,junior_all2_Politics);
junior_all1_Politics=fufen(Politicsstandard,junior_all1_Politics);
junior_nine3_Politics=fufen(Politicsstandard,junior_nine3_Politics);
junior_nine2_Politics=fufen(Politicsstandard,junior_nine2_Politics);
junior_nine1_Politics=fufen(Politicsstandard,junior_nine1_Politics);
junior_all3_Physics=fufen(Physicsstandard,junior_all3_Physics);
junior_all2_Physics=fufen(Physicsstandard,junior_all2_Physics);
junior_all1_Physics=fufen(Physicsstandard,junior_all1_Physics);
junior_nine3_Physics=fufen(Physicsstandard,junior_nine3_Physics);
junior_nine2_Physics=fufen(Physicsstandard,junior_nine2_Physics);
junior_nine1_Physics=fufen(Physicsstandard,junior_nine1_Physics);
junior_all3_History=fufen(Historystandard,junior_all3_History);
junior_all2_History=fufen(Historystandard,junior_all2_History);
junior_all1_History=fufen(Historystandard,junior_all1_History);
junior_nine3_History=fufen(Historystandard,junior_nine3_History);
junior_nine2_History=fufen(Historystandard,junior_nine2_History);
junior_nine1_History=fufen(Historystandard,junior_nine1_History);
junior_all4_Geography=fufen(Geographystandard,junior_all4_Geography);
junior_all4_Biology=fufen(Biologystandard,junior_all4_Biology);
junior_all4_Chemistry=fufen(Chemistrystandard,junior_all4_Chemistry);
junior_all4_Physics=fufen(Physicsstandard,junior_all4_Physics);
junior_all4_History=fufen(Historystandard,junior_all4_History);
junior_all4_Politics=fufen(Politicsstandard,junior_all4_Politics);




% here we generate all subjects data(ranking include into one table for
% every exam
junior_nine1=[junior_nine1_Chinese;junior_nine1_Math;junior_nine1_English;...
    junior_nine1_Physics;junior_nine1_Chemistry;junior_nine1_Biology;...
    junior_nine1_Politics;junior_nine1_History;junior_nine1_Geography];
junior_nine2=[junior_nine2_Chinese;junior_nine2_Math;junior_nine2_English;...
    junior_nine2_Physics;junior_nine2_Chemistry;junior_nine2_Biology;...
    junior_nine2_Politics;junior_nine2_History;junior_nine2_Geography];
junior_nine3=[junior_nine3_Chinese;junior_nine3_Math;junior_nine3_English;...
    junior_nine3_Physics;junior_nine3_Chemistry;junior_nine3_Biology;...
    junior_nine3_Politics;junior_nine3_History;junior_nine3_Geography];
junior_all1=[junior_all1_Chinese;junior_all1_Math;junior_all1_English;...
    junior_all1_Physics;junior_all1_Chemistry;junior_all1_Biology;...
    junior_all1_Politics;junior_all1_History;junior_all1_Geography];
junior_all2=[junior_all2_Chinese;junior_all2_Math;junior_all2_English;...
    junior_all2_Physics;junior_all2_Chemistry;junior_all2_Biology;...
    junior_all2_Politics;junior_all2_History;junior_all2_Geography];
junior_all3=[junior_all3_Chinese;junior_all3_Math;junior_all3_English;...
    junior_all3_Physics;junior_all3_Chemistry;junior_all3_Biology;...
    junior_all3_Politics;junior_all3_History;junior_all3_Geography];
junior_all4=[junior_all4_Chinese;junior_all4_Math;junior_all4_English;...
    junior_all4_Physics;junior_all4_Chemistry;junior_all4_Biology;...
    junior_all4_Politics;junior_all4_History;junior_all4_Geography];

%and now generate all exam data into one table
junior=[junior_all1;junior_all2;junior_all3;junior_all4;junior_nine1;...
   junior_nine2;junior_nine3];


% again,calculating the total score. Note that for 21-24, every student
% take 9 exams, but for 25-27,every student only take 6 exams. So when
% calculating, treat -2(represents for doesn't attend)as 0
junior_total_grade_1=ones(length(junior_nine1_Chinese),5);
junior_total_grade_2=ones(length(junior_nine1_Chinese),5);
junior_total_grade_3=ones(length(junior_nine1_Chinese),5);
junior_total_grade_4=ones(length(junior_nine1_Chinese),5);
junior_total_grade_5=ones(length(junior_nine1_Chinese),5);
junior_total_grade_6=ones(length(junior_nine1_Chinese),5);
junior_total_grade_7=ones(length(junior_nine1_Chinese),5);
i_for_all_grades_1=1;
i_for_all_grades_2=1;
i_for_all_grades_3=1;
i_for_all_grades_4=1;
i_for_all_grades_5=1;
i_for_all_grades_6=1;
i_for_all_grades_7=1;

for ID=2001:2080
    all_grades=junior(junior(:,3)==ID,:);
    all_grades(all_grades==-2)=0;
    junior_total_grade_1(i_for_all_grades_1,2)=sum(all_grades((all_grades(:,5)==21),2));
    junior_total_grade_1(i_for_all_grades_1,3)=ID;
    junior_total_grade_1(i_for_all_grades_1,5)=31;
    junior_total_grade_1(i_for_all_grades_1,4)=20;
    
    junior_total_grade_2(i_for_all_grades_2,2)=sum(all_grades((all_grades(:,5)==22),2));
    junior_total_grade_2(i_for_all_grades_2,3)=ID;
    junior_total_grade_2(i_for_all_grades_2,5)=32;
    junior_total_grade_2(i_for_all_grades_2,4)=20;

    junior_total_grade_3(i_for_all_grades_3,2)=sum(all_grades((all_grades(:,5)==23),2));
    junior_total_grade_3(i_for_all_grades_3,3)=ID;
    junior_total_grade_3(i_for_all_grades_3,5)=33;
    junior_total_grade_3(i_for_all_grades_3,4)=20;
    
    junior_total_grade_4(i_for_all_grades_4,2)=sum(all_grades((all_grades(:,5)==24),2));
    junior_total_grade_4(i_for_all_grades_4,3)=ID;
    junior_total_grade_4(i_for_all_grades_4,5)=34;
    junior_total_grade_4(i_for_all_grades_4,4)=20;
    
    junior_total_grade_5(i_for_all_grades_5,2)=sum(all_grades((all_grades(:,5)==25),2));
    junior_total_grade_5(i_for_all_grades_5,3)=ID;
    junior_total_grade_5(i_for_all_grades_5,5)=35;
    junior_total_grade_5(i_for_all_grades_5,4)=20;
    
    junior_total_grade_6(i_for_all_grades_6,2)=sum(all_grades((all_grades(:,5)==26),2));
    junior_total_grade_6(i_for_all_grades_6,3)=ID;
    junior_total_grade_6(i_for_all_grades_6,5)=36;
    junior_total_grade_6(i_for_all_grades_6,4)=20;
    
    junior_total_grade_7(i_for_all_grades_7,2)=sum(all_grades((all_grades(:,5)==27),2));
    junior_total_grade_7(i_for_all_grades_7,3)=ID;
    junior_total_grade_7(i_for_all_grades_7,5)=38;
    junior_total_grade_7(i_for_all_grades_7,4)=20;
    
    i_for_all_grades_1=i_for_all_grades_1+1;
    i_for_all_grades_2=i_for_all_grades_2+1;
    i_for_all_grades_3=i_for_all_grades_3+1;
    i_for_all_grades_4=i_for_all_grades_4+1;
    i_for_all_grades_5=i_for_all_grades_5+1;
    i_for_all_grades_6=i_for_all_grades_6+1;
    i_for_all_grades_7=i_for_all_grades_7+1;
    
end
junior_total_grade_1=rank_value(junior_total_grade_1);
junior_total_grade_2=rank_value(junior_total_grade_2);
junior_total_grade_3=rank_value(junior_total_grade_3);
junior_total_grade_4=rank_value(junior_total_grade_4);
junior_total_grade_5=rank_value(junior_total_grade_5);
junior_total_grade_6=rank_value(junior_total_grade_6);
junior_total_grade_7=rank_value(junior_total_grade_7);

junior_total_grade=[junior_total_grade_1;junior_total_grade_2...
    ;junior_total_grade_3;junior_total_grade_4;junior_total_grade_5...
    ;junior_total_grade_6;junior_total_grade_7];











% Freshman load-in
% The testID for freshman is all1-11 all2-12 all3-13


freshman_all1_Chinese=importdata([directory '/freshman/all1/freshman_all1_Chinese.csv']);
freshman_all1_Math=importdata([directory '/freshman/all1/freshman_all1_Math.csv']);
freshman_all1_English=importdata([directory '/freshman/all1/freshman_all1_English.csv']);
freshman_all1_Physics=importdata([directory '/freshman/all1/freshman_all1_Physics.csv']);
freshman_all1_Chemistry=importdata([directory '/freshman/all1/freshman_all1_Chemistry.csv']);
freshman_all1_Biology=importdata([directory '/freshman/all1/freshman_all1_Biology.csv']);
freshman_all1_Politics=importdata([directory '/freshman/all1/freshman_all1_Politics.csv']);
freshman_all1_History=importdata([directory '/freshman/all1/freshman_all1_History.csv']);
freshman_all1_Geography=importdata([directory '/freshman/all1/freshman_all1_Geography.csv']);

freshman_all2_Chinese=importdata([directory '/freshman/all2/freshman_all2_Chinese.csv']);
freshman_all2_Math=importdata([directory '/freshman/all2/freshman_all2_Math.csv']);
freshman_all2_English=importdata([directory '/freshman/all2/freshman_all2_English.csv']);
freshman_all2_Physics=importdata([directory '/freshman/all2/freshman_all2_Physics.csv']);
freshman_all2_Chemistry=importdata([directory '/freshman/all2/freshman_all2_Chemistry.csv']);
freshman_all2_Biology=importdata([directory '/freshman/all2/freshman_all2_Biology.csv']);
freshman_all2_Politics=importdata([directory '/freshman/all2/freshman_all2_Politics.csv']);
freshman_all2_History=importdata([directory '/freshman/all2/freshman_all2_History.csv']);
freshman_all2_Geography=importdata([directory '/freshman/all2/freshman_all2_Geography.csv']);

freshman_all3_Chinese=importdata([directory '/freshman/all3/freshman_all3_Chinese.csv']);
freshman_all3_Math=importdata([directory '/freshman/all3/freshman_all3_Math.csv']);
freshman_all3_English=importdata([directory '/freshman/all3/freshman_all3_English.csv']);
freshman_all3_Physics=importdata([directory '/freshman/all3/freshman_all3_Physics.csv']);
freshman_all3_Chemistry=importdata([directory '/freshman/all3/freshman_all3_Chemistry.csv']);
freshman_all3_Biology=importdata([directory '/freshman/all3/freshman_all3_Biology.csv']);
freshman_all3_Politics=importdata([directory '/freshman/all3/freshman_all3_Politics.csv']);
freshman_all3_History=importdata([directory '/freshman/all3/freshman_all3_History.csv']);
freshman_all3_Geography=importdata([directory '/freshman/all3/freshman_all3_Geography.csv']);

% There is something different for all1 dataset, so add some steps here
freshman_all1_Chinese=[zeros(86,1) freshman_all1_Chinese];
freshman_all1_Math=[zeros(86,1) freshman_all1_Math];
freshman_all1_English=[zeros(86,1) freshman_all1_English];
freshman_all1_Physics=[zeros(86,1) freshman_all1_Physics];
freshman_all1_Chemistry=[zeros(86,1) freshman_all1_Chemistry];
freshman_all1_Biology=[zeros(86,1) freshman_all1_Biology];
freshman_all1_Politics=[zeros(86,1) freshman_all1_Politics];
freshman_all1_History=[zeros(86,1) freshman_all1_History];
freshman_all1_Geography=[zeros(86,1) freshman_all1_Geography];

% again the rank_value part
freshman_all1_Chinese=rank_value(freshman_all1_Chinese);
freshman_all1_Math=rank_value(freshman_all1_Math);
freshman_all1_English=rank_value(freshman_all1_English);
freshman_all1_Physics=rank_value(freshman_all1_Physics);
freshman_all1_Chemistry=rank_value(freshman_all1_Chemistry);
freshman_all1_Biology=rank_value(freshman_all1_Biology);
freshman_all1_History=rank_value(freshman_all1_History);
freshman_all1_Politics=rank_value(freshman_all1_Politics);
freshman_all1_Geography=rank_value(freshman_all1_Geography);

freshman_all2_Chinese=rank_value(freshman_all2_Chinese.data);
freshman_all2_Math=rank_value(freshman_all2_Math.data);
freshman_all2_English=rank_value(freshman_all2_English.data);
freshman_all2_Physics=rank_value(freshman_all2_Physics.data);
freshman_all2_Chemistry=rank_value(freshman_all2_Chemistry.data);
freshman_all2_Biology=rank_value(freshman_all2_Biology.data);
freshman_all2_History=rank_value(freshman_all2_History.data);
freshman_all2_Politics=rank_value(freshman_all2_Politics.data);
freshman_all2_Geography=rank_value(freshman_all2_Geography.data);
freshman_all3_Chinese=rank_value(freshman_all3_Chinese.data);
freshman_all3_Math=rank_value(freshman_all3_Math.data);
freshman_all3_English=rank_value(freshman_all3_English.data);
freshman_all3_Physics=rank_value(freshman_all3_Physics.data);
freshman_all3_Chemistry=rank_value(freshman_all3_Chemistry.data);
freshman_all3_Biology=rank_value(freshman_all3_Biology.data);
freshman_all3_History=rank_value(freshman_all3_History.data);
freshman_all3_Politics=rank_value(freshman_all3_Politics.data);
freshman_all3_Geography=rank_value(freshman_all3_Geography.data);

%and again, the fufen part
freshman_all3_Geography=fufen(Geographystandard,freshman_all3_Geography);
freshman_all3_Biology=fufen(Biologystandard,freshman_all3_Biology);
freshman_all3_Chemistry=fufen(Chemistrystandard,freshman_all3_Chemistry);
freshman_all3_Physics=fufen(Physicsstandard,freshman_all3_Physics);
freshman_all3_History=fufen(Historystandard,freshman_all3_History);
freshman_all3_Politics=fufen(Politicsstandard,freshman_all3_Politics);
freshman_all2_Geography=fufen(Geographystandard,freshman_all2_Geography);
freshman_all2_Biology=fufen(Biologystandard,freshman_all2_Biology);
freshman_all2_Chemistry=fufen(Chemistrystandard,freshman_all2_Chemistry);
freshman_all2_Physics=fufen(Physicsstandard,freshman_all2_Physics);
freshman_all2_History=fufen(Historystandard,freshman_all2_History);
freshman_all2_Politics=fufen(Politicsstandard,freshman_all2_Politics);
freshman_all1_Geography=fufen(Geographystandard,freshman_all1_Geography);
freshman_all1_Biology=fufen(Biologystandard,freshman_all1_Biology);
freshman_all1_Chemistry=fufen(Chemistrystandard,freshman_all1_Chemistry);
freshman_all1_Physics=fufen(Physicsstandard,freshman_all1_Physics);
freshman_all1_History=fufen(Historystandard,freshman_all1_History);
freshman_all1_Politics=fufen(Politicsstandard,freshman_all1_Politics);



% again, generation
freshman_all1=[freshman_all1_Chinese;freshman_all1_Math;freshman_all1_English;...
    freshman_all1_Physics;freshman_all1_Chemistry;freshman_all1_Biology;...
    freshman_all1_Politics;freshman_all1_History;freshman_all1_Geography];

freshman_all2=[freshman_all2_Chinese;freshman_all2_Math;freshman_all2_English;...
    freshman_all2_Physics;freshman_all2_Chemistry;freshman_all2_Biology;...
    freshman_all2_Politics;freshman_all2_History;freshman_all2_Geography];

freshman_all3=[freshman_all3_Chinese;freshman_all3_Math;freshman_all3_English;...
    freshman_all3_Physics;freshman_all3_Chemistry;freshman_all3_Biology;...
    freshman_all3_Politics;freshman_all3_History;freshman_all3_Geography];


freshman=[freshman_all1;freshman_all2;freshman_all3];

% again,get total score

freshman_total_grade_1=ones(length(freshman_all1_Chinese),5);
freshman_total_grade_2=ones(length(freshman_all1_Chinese),5);
freshman_total_grade_3=ones(length(freshman_all1_Chinese),5);

i_for_all_grades_1=1;
i_for_all_grades_2=1;
i_for_all_grades_3=1;

for ID=1001:1086
    all_grades=freshman(freshman(:,3)==ID,:);
    all_grades(all_grades==-2)=0;
    freshman_total_grade_1(i_for_all_grades_1,2)=sum(all_grades((all_grades(:,5)==11),2));
    freshman_total_grade_1(i_for_all_grades_1,5)=11;
    freshman_total_grade_1(i_for_all_grades_1,4)=20;
    freshman_total_grade_1(i_for_all_grades_1,3)=ID;
    i_for_all_grades_1=i_for_all_grades_1+1;
    
    freshman_total_grade_2(i_for_all_grades_2,2)=sum(all_grades((all_grades(:,5)==12),2));
    freshman_total_grade_2(i_for_all_grades_2,3)=ID;
    freshman_total_grade_2(i_for_all_grades_2,5)=12;
    freshman_total_grade_2(i_for_all_grades_2,4)=20;
    i_for_all_grades_2=i_for_all_grades_2+1;
    
    freshman_total_grade_3(i_for_all_grades_3,2)=sum(all_grades((all_grades(:,5)==13),2));
    freshman_total_grade_3(i_for_all_grades_3,3)=ID;
    freshman_total_grade_3(i_for_all_grades_3,5)=13;
    freshman_total_grade_3(i_for_all_grades_3,4)=20;
    i_for_all_grades_3=i_for_all_grades_3+1;
end

freshman_total_grade_1=rank_value(freshman_total_grade_1);
freshman_total_grade_2=rank_value(freshman_total_grade_2);
freshman_total_grade_3=rank_value(freshman_total_grade_3);

freshman_total_grade=[freshman_total_grade_1;freshman_total_grade_2;freshman_total_grade_3];

% get allinone and allinonetotal here
allinone=[freshman;junior;senior];
allinonetotal=[freshman_total_grade;junior_total_grade;senior_total_grade];

% prediction table initialization
senior_prediction_1=ones(length(senior_nine1_Chinese),5);
senior_prediction_2=ones(length(senior_nine1_Chinese),5);
senior_prediction_3=ones(length(senior_nine1_Chinese),5);

% get prediction data for all students and put in a table 
for i=1:78
    [pre1,pre2,pre3]=greymodel(senior_total_grade(senior_total_grade(:,3)==i+3000,:));
    senior_prediction_1(i,5)=30001;
    senior_prediction_2(i,5)=30002;
    senior_prediction_3(i,5)=30003;
    
    senior_prediction_1(i,2)=pre1;
    senior_prediction_2(i,2)=pre2;
    senior_prediction_3(i,2)=pre3;
    
    senior_prediction_1(i,3)=3000+i;
    senior_prediction_2(i,3)=3000+i;
    senior_prediction_3(i,3)=3000+i;
    
    senior_prediction_1(i,4)=100;
    senior_prediction_2(i,4)=100;
    senior_prediction_3(i,4)=100;
end

junior_prediction_1=ones(length(junior_nine1_Chinese),5);
junior_prediction_2=ones(length(junior_nine1_Chinese),5);
junior_prediction_3=ones(length(junior_nine1_Chinese),5);

for i=1:80
    [pre1,pre2,pre3]=greymodel(junior_total_grade(junior_total_grade(:,3)==i+2000,:));
    junior_prediction_1(i,5)=20001;
    junior_prediction_2(i,5)=20002;
    junior_prediction_3(i,5)=20003;
    
    junior_prediction_1(i,2)=pre1;
    junior_prediction_2(i,2)=pre2;
    junior_prediction_3(i,2)=pre3;
    
    junior_prediction_1(i,3)=2000+i;
    junior_prediction_2(i,3)=2000+i;
    junior_prediction_3(i,3)=2000+i;
    
    junior_prediction_1(i,4)=100;
    junior_prediction_2(i,4)=100;
    junior_prediction_3(i,4)=100;
end

junior_prediction_1=rank_value(junior_prediction_1);
junior_prediction_2=rank_value(junior_prediction_2);
junior_prediction_3=rank_value(junior_prediction_3);
senior_prediction_1=rank_value(senior_prediction_1);
senior_prediction_2=rank_value(senior_prediction_2);
senior_prediction_3=rank_value(senior_prediction_3);

junior_prediction=[junior_prediction_1;junior_prediction_2;junior_prediction_3];
senior_prediction=[senior_prediction_1;senior_prediction_2;senior_prediction_3];



% data extraction part-----------------------------------------------------



if floor(testID/1000)==3
    total_grades_for_ID=senior_total_grade(senior_total_grade(:,3)==testID,:);
    all_grades_for_ID=senior(senior(:,3)==testID,:);
    testdata_allgrades=all_grades_for_ID;
    Chinese=all_grades_for_ID(all_grades_for_ID(:,4)==1,:);
    Math=all_grades_for_ID(all_grades_for_ID(:,4)==2,:);
    English=all_grades_for_ID(all_grades_for_ID(:,4)==3,:);
    English(1:end-1,1)=English(1:end-1,2);
    Physics=all_grades_for_ID(all_grades_for_ID(:,4)==4,:);
    Chemistry=all_grades_for_ID(all_grades_for_ID(:,4)==5,:);
    Biology=all_grades_for_ID(all_grades_for_ID(:,4)==6,:);
    History=all_grades_for_ID(all_grades_for_ID(:,4)==7,:);
    Geography=all_grades_for_ID(all_grades_for_ID(:,4)==8,:);
    Politics=all_grades_for_ID(all_grades_for_ID(:,4)==17,:);
    prediction=senior_prediction(senior_prediction(:,3)==testID,:);
end

if floor(testID/1000)==2
    total_grades_for_ID=junior_total_grade(junior_total_grade(:,3)==testID,:);
    all_grades_for_ID=junior(junior(:,3)==testID,:);
    testdata_allgrades=all_grades_for_ID;
    Chinese=all_grades_for_ID(all_grades_for_ID(:,4)==1,:);
    Math=all_grades_for_ID(all_grades_for_ID(:,4)==2,:);
    English=all_grades_for_ID(all_grades_for_ID(:,4)==3,:);
    Physics=all_grades_for_ID(all_grades_for_ID(:,4)==4,:);
    Chemistry=all_grades_for_ID(all_grades_for_ID(:,4)==5,:);
    Biology=all_grades_for_ID(all_grades_for_ID(:,4)==6,:);
    History=all_grades_for_ID(all_grades_for_ID(:,4)==7,:);
    Geography=all_grades_for_ID(all_grades_for_ID(:,4)==8,:);
    Politics=all_grades_for_ID(all_grades_for_ID(:,4)==17,:);
    English(:,1)=English(:,2);
    prediction=junior_prediction(junior_prediction(:,3)==testID,:);
end


if floor(testID/1000)==1
    total_grades_for_ID=freshman_total_grade(freshman_total_grade(:,3)==testID,:);
    all_grades_for_ID=freshman(freshman(:,3)==testID,:);
    testdata_allgrades=all_grades_for_ID;

    Chinese=all_grades_for_ID(all_grades_for_ID(:,4)==1,:);
    Math=all_grades_for_ID(all_grades_for_ID(:,4)==2,:);
    English=all_grades_for_ID(all_grades_for_ID(:,4)==3,:);
    Physics=all_grades_for_ID(all_grades_for_ID(:,4)==4,:);
    Chemistry=all_grades_for_ID(all_grades_for_ID(:,4)==5,:);
    Biology=all_grades_for_ID(all_grades_for_ID(:,4)==6,:);
    History=all_grades_for_ID(all_grades_for_ID(:,4)==7,:);
    Geography=all_grades_for_ID(all_grades_for_ID(:,4)==8,:);
    Politics=all_grades_for_ID(all_grades_for_ID(:,4)==17,:);
    English(:,1)=English(:,2);
    % since the datasize is too small, we didn't provide prediction for
    % freshman.
    prediction=zeros(1,1);      
end

chi=Chinese;
mat=Math;
eng=English;
phy=Physics;
che=Chemistry;
bio=Biology;
pol=Politics;
his=History;
geo=Geography;
all=testdata_allgrades;
total=total_grades_for_ID;

end




