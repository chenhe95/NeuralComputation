%%
%Cassie Wang, He Chen, Ken Hayashima
%parameters
tau = 400;
%trial for first 20 seconds
nsamps = 200000;
std = 32;
%data loading
file = load('contrast_response.mat');
contrasts = file.contrasts;
spikes = file.spikeTimes;
stimulus = file.stimulus;
%compute STA
sta = AverageTriggeredSpike(spikes,stimulus,tau);
sta = [sta;zeros(size(sta))];
%%
%tuning the standard deviation of Gaussian
first20Sec=spikes{9}(spikes{9}<=40000);
seconds=zeros(40000,size(first20Sec,1));
for i = 1:size(first20Sec,1)
    seconds(:,i)=(1:40000)';
end
gNoisetune=sum(2000*normpdf(seconds',first20Sec,32),1);
trigFeatIntens = conv(stimulus,flipud(sta(:,9))','same');
plot(.0005*(1:40000),gNoisetune)
hold on
trigFeatIntens(trigFeatIntens < 0) = 0;
plot(.0005 * (1:40000),10 * trigFeatIntens(1:40000))
title('Trigger Feature Intensity vs Firing Rate')
xlabel('time(s)')
ylabel('Firing Rate/Trigger Feature Intensity')
%%

trigFeatIntens = cell(1,size(sta,2));
fireRate = firingRate(nsamps,std);
    
for i = 1: size(sta,2)
    %%
    %compute trigger feature intensity based on STA
    trigFeatIntens{i} = conv(contrasts(i)*stimulus,flipud(sta(:,i))','same');
    
    %%
    %plot trigger feature intensity
    tfiSize=min(nsamps,size(trigFeatIntens{i},1));  
    figure;
    plot(.0005 * (1:tfiSize),trigFeatIntens{i})
    
    title(strcat('Contrast ',int2str(i),' Trigger Feature Intensity'))
    xlabel('time(s)')
    ylabel('Trigger Feature Intensity')
    %%
    %plot trigger feature intensity vs firing rate 
    f20secConv = trigFeatIntens{i}(1:tfiSize);
    tenthConv = f20secConv(10*(1:floor(tfiSize/10)));
    thisfR = fireRate(i,:);
    tenthFR = thisfR(10*(1:floor(tfiSize/10)));
    figure;
    scatter(tenthConv,tenthFR);
    xlabel('trigger feature intensity')
    ylabel('firing rate')
    title(strcat('contrast',int2str(i)))
    
    %%
    %take a mean within 40 bins
    waypoints = (-20:20);
    meanFRInBins = zeros(1,size(waypoints,2)-1);
    duration = ((max(tenthConv)-min(tenthConv))/size(waypoints,2))*waypoints;
    for j = 1:size(meanFRInBins,2)
        %calculate mean within j th bin
        meanFRInBins(j) = mean(tenthFR(tenthConv>=duration(j) & tenthConv<duration(j+1)));
    end
    %compute center of the bins
    midbins = .5*diff(duration) + duration(1:end-1);
%     figure;
%     %plot
%     scatter(midbins,meanFRInBins)
%     xlabel('trigger feature intensity')
%     ylabel('averaged firing rate')
%     title(strcat('contrast',int2str(i)))
    %%
    %interpolation between averaged points
    intplpoints = interp1(midbins,meanFRInBins,min(duration):.01:max(duration));
    figure;
    scatter(tenthConv,tenthFR);
    hold on
    plot(min(duration):.01:max(duration),intplpoints,'LineWidth',3);
    %plot
    xlabel('trigger feature intensity')
    ylabel('interpolated firing rate')
    title(strcat('contrast',int2str(i)))
    
end

