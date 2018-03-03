function[ats]=averageTriggeredSpike(spikes,stimulus,tau,contrast)
%This function calculates the STA corresponding to each contrast
%If contrast is given, this returns STA corresponding to that contrast
%as a column vector.
%Otherwise, it returns a matrix where each column represents STA for
%corresponding contrast
ncells=size(spikes,2);
nspikes=zeros(ncells,1);
precededStms=cell(1,ncells);
for i = 1:ncells
    spike=spikes{i};
    spikeNum=size(spike,1);
    nspikes(i,1)=spikeNum;
    precededStms{i}=cell(1,spikeNum);
    for j =1:spikeNum
        spikeT=spike(j);
        if spikeT<=tau
            precededStm=[zeros(tau+1-spikeT,1);stimulus(1:spikeT)];
        else
            precededStm=stimulus(spikeT-tau:spikeT);
        end
        precededStms{i}{j}=precededStm;
    end
    allPrecededStim=cell2mat(precededStms{i});
    unSTA=sum(allPrecededStim,2)/spikeNum;
    precededStms{i}=unSTA/norm(unSTA);
% end
%     precededStim=stimulus(1:end-tau);
%     precededStimSum=sum(precededStim);
    ats=cell2mat(precededStms);
%     ats=ats/norm(ats);
    if nargin==4
        ats=ats(contrast,:);
    end
end