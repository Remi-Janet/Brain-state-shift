clear all;
clc;

% load data
DATA = readtable('C:\Users\Neuroeconomics Lab\Data.csv');

% Main GLM (using the first 3 gradients)
mdl05 = fitglme(DATA,'RS ~ ED_HCvsNC * BMI + Age + sex + (1|Study) ');


% LOSO for RS predicted by HC-NC similarity shift
lmfunction = 'RS ~ ED_HCvsNC + BMI + Age + sex + (1|Study)';
RecapPermTest = DATA;
n = size(RecapPermTest,1); 
y = RecapPermTest.RS;
predictions = zeros(1,n);
clear Ypredicted_Deuc

for p=1:n % LOO prediction
    % figure out indices
    trainix = setdiff(1:n,p)';
    testix = p;
    % train the model
    Ttrain = RecapPermTest(trainix,:); Ttest = RecapPermTest(testix,:);
    mdltrain = fitglme(Ttrain,lmfunction);
    beta = mdltrain.Coefficients.Estimate';
    % predict new values
    [ypred,yci] = predict(mdltrain,Ttest,'Alpha',0.05);
    % store predicted value
    Ypredicted_Deuc(p,1) = ypred;
    YCI(p,:) = yci;
end

% correlation predicted RS and observed RS
[rLOSO, pLOSO] = corr(DATA.RS,Ypredicted_Deuc);
r_RS_Deuc = rLOSO;
p_RS_Deuc = pLOSO;

for nperm = 1:1000

    disp(['Permutation number = ', num2str(nperm)])
    RecapPermTest.RS = RecapPermTest.RS(randperm(length(RecapPermTest.RS)));

    % perfom leave-one-out cross-validation
    n = size(RecapPermTest,1); % number of subject
    y = RecapPermTest.RS;
    clear Ttrain ypred

    Ttrain = RecapPermTest;
    mdltrain = fitglme(Ttrain,lmfunction);
    [ypred(:,nperm),yci] = predict(mdltrain,Ttrain,'Alpha',0.05);
    R2test_RSDeuc(nperm,1:2) = [mdltrain.Rsquared.Ordinary,mdltrain.Rsquared.Adjusted];
    [rperm_RS_Deuc(:,nperm)] = corr(ypred(:,nperm),RecapPermTest.RS);

end
[h,p_RS_Deuc,ci_RS_Deuc,stats] =ttest(rperm_RS_Deuc',r_RS_Deuc);

figure
subplot(1,2,1)
scatter((DATA.RS),(Ypredicted_Deuc))
[A hA] = Calc_Working_Hotelling_CI((DATA.RS)',(Ypredicted_Deuc)',0.05);
lineprops.width = 1;
lineprops.edgestyle = ':';
lineprops.col = {'r'};
Hh = mseb(A(1,:),A(2,:),A(5,:),lineprops,1);
xlabel('Observed RS ')
ylabel('Predicted RS ')
set(gcf,'color', 'w');
box off
subplot(1,2,2)
hist((rperm_RS_Deuc'),100)
hold on 
xline(r_RS_Deuc)
xlabel('r coefficient')
ylabel('Count')
set(gcf,'color', 'w');
box off