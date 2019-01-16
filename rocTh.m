function [R,auc] = rocTh(t,y,th)
fp=0;tp=0;
totalP=length(find(t));
totalN=length(t)-totalP;
% sort by classifier output
[Y,idx] = sort(y,'descend');
t2 = t(idx);
tpr=zeros(1,8);
fpr=zeros(1,8);
for i=1:8
    if Y(i)>th
        if t2(i)==1
        tp=tp+1;
        else
        fp=fp+1;    
        end
    elseif Y(i)<th
        if t2(i)==0
        tp=tp+1;
        else
        fp=fp+1;
        end
    else 
        fp=fp+1;
    end
    tpr(i)=tp/totalP;
    fpr(i)=fp/totalN;
end
R=[fpr;tpr];
plot(R(1,:),R(2,:));

x_auc=R(1,:);
y_auc=R(2,:);
auc=trapz(x_auc,y_auc);
disp(auc)
end