file=load('contrast_response.mat');
[maximum,argmax]=max(file.contrasts);
highestContrastData=file.spikeTimes{2};
first20Sec=highestContrastData(highestContrastData<=40000);
hists=hist(first20Sec,400)*10;
avgFireRatesPerTrial=[];
for i=1:size(file.contrasts,1)
    avgFireRatesPerTrial(end+1,:)=[size(file.spikeTimes{i},1)/100,file.contrasts(i)];
end
seconds=zeros(40000,size(first20Sec,1));
for i = 1:size(first20Sec,1)
    seconds(:,i)=(1:40000)';
end
contrasts = file.contrasts;
spikes = file.spikeTimes;
stimulus = file.stimulus;
%compute trigger feature intensity based on STA
sta = AverageTriggeredSpike(spikes,stimulus,tau);
sta = [sta;zeros(size(sta))];
gNoise=sum(2000*normpdf(seconds',first20Sec,32),1);
trigFeatIntens = conv(stimulus,flipud(sta(:,2))','same');
plot(.0005*(1:40000),gNoise)
hold on
trigFeatIntens(trigFeatIntens<0)=0;
plot(.0005*(1:40000),10*trigFeatIntens(1:40000))
xlabel('time(s)')
ylabel('Firing Rate/Trigger Feature Intensity')
% noiseAddedFR=zeros(20000,1);
% for i = 1:size(hists,2)
%     noiseAddedFR((i-1)*100+1:i*100,1)=10*hists(i)*ones(100,1);
% end
%  noiseAddedFRR=conv(noiseAddedFR,2000*normpdf(-100:.1:100,0,35)','same');
%  ats=AverageTriggeredSpike(file.spikeTimes,file.stimulus,5);