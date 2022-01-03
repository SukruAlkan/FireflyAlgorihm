function [ns]=findlimits(n,ns,Lb,Ub)
for i=1:n
  nsol_tmp=ns(i,:);
  % Apply the lower bound
  I=nsol_tmp<Lb;  nsol_tmp(I)=Lb(I);
  % Apply the upper bounds
  J=nsol_tmp>Ub;  nsol_tmp(J)=Ub(J);
  % Update this new move
  ns(i,:)=nsol_tmp;
end
end