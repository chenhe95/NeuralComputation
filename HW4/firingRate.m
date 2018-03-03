function[gNoisee]=firingRate(nsamps,std)
file=load('contrast_response.mat');
spikes=file.spikeTimes;
contrasts=file.contrasts;
gNoisee=zeros(size(contrasts,1),nsamps);
for i =1:size(contrasts,1)
seconds=zeros(nsamps,size(spikes{i},1));
for j = 1:size(spikes{i},1)
    seconds(:,j)=(1:nsamps)';
end
gNoisee(i,:)=sum(2000*normpdf(seconds',spikes{i},std),1);
end
    