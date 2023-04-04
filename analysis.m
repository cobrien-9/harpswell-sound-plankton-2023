%   What: Blooming dynamics of phytoplankton communities in Harpswell Sound ME
%   Why: Independent project analysis documentation
%   When: May 2023
%   Who: Charles O'Brien


%% cell concentration (creating 'mt.mat')
clearvars;
load('P202002_IFCB_class_concentration.mat');a=data;
load('P202003_IFCB_class_concentration.mat');b=data;
load('P202005_IFCB_class_concentration.mat');c=data;
load('P202006_IFCB_class_concentration.mat');d=data;
load('P202007_IFCB_class_concentration.mat');e=data;
load('P202008_IFCB_class_concentration.mat');f=data;
load('P202009_IFCB_class_concentration.mat');g=data;
load('P202010_IFCB_class_concentration.mat');h=data;
load('P202011_IFCB_class_concentration.mat');i=data;
load('P202012_IFCB_class_concentration.mat');j=data;
load('P202101_IFCB_class_concentration.mat');k=data;
load('P202102_IFCB_class_concentration.mat');l=data;
load('P202103_IFCB_class_concentration.mat');m=data;
load('P202104_IFCB_class_concentration.mat');n=data;
load('P202105_IFCB_class_concentration.mat');o=data;
load('P202106_IFCB_class_concentration.mat');p=data;
load('P202107_IFCB_class_concentration.mat');q=data;
load('P202108_IFCB_class_concentration.mat');r=data;
load('P202109_IFCB_class_concentration.mat');s=data;
load('P202110_IFCB_class_concentration.mat');t=data;
load('P202111_IFCB_class_concentration.mat');u=data;
load('P202112_IFCB_class_concentration.mat');v=data;
load('P202201_IFCB_class_concentration.mat');w=data;
load('P202202_IFCB_class_concentration.mat');x=data;
load('P202203_IFCB_class_concentration.mat');y=data;
load('P202204_IFCB_class_concentration.mat');z=data;
load('P202205_IFCB_class_concentration.mat');a1=data;

total=cat(1,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a1);

timestamp= datetime(total.mdate,'InputFormat','dd.MM.yyyy HH:mm:ss.SSS','ConvertFrom','datenum');
images_ml=table2array(total(:,1));
sn=table2array(total(:,4));

TT=timetable(timestamp,images_ml,sn);

dt = minutes(30);
mt = retime(TT,'regular','linear','TimeStep',dt);

%% temp and sal interpolation (creating 'lobo_retimed.mat')
clearvars
% drag in 'Sensor0052-20230216144947.tsv'

t=table2array(Sensor005220230216144947(:,1));t=datenum(t);
sal=table2array(Sensor005220230216144947(:,2));
temp=table2array(Sensor005220230216144947(:,3));

timestamp=datetime(t,'InputFormat','dd.MM.yyyy HH:mm:ss.SSS','ConvertFrom','datenum');

TT=timetable(timestamp,temp,sal);

dt = minutes(30);
LOBO = retime(TT,'regular','linear','TimeStep',dt);

%% LOBO currents interpolation (creating 'mc.mat')
clearvars
% drag in 'Sensor0052-20230208114311.tsv'

sensor=table2array(Sensor005220230208114311(:,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
a = north*rotN; %velocity along-sound 

sizea = size(a);
numrows = sizea(1);
numcols = sizea(2);
threshold = 100;
for i = 1:numrows 
    for j = 1:numcols
        if abs(a(i,j)) > threshold
            a(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 

time=table2array(Sensor005220230208114311(:,1));time=datenum(time);
for r=1:height(time)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end

sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(a(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end

TT=timetable(Sensor005220230208114311.dateEST,acuravg);

dt = minutes(30);
mc = retime(TT,'regular','linear','TimeStep',dt);

%% moon interpolation (creating 'mn.mat')
clearvars
load('moon.mat');
time=moon(:,1);
dist=moon(:,2);
ilu=moon(:,3)*100;
sizea=size(time);
numrows = sizea(1);
dithresh = 1;
for i = 1:numrows 
        if dist(i,1) < dithresh
            dist(i,1) = nan;
        end 
end
pa=dist/221500; % Include apogee and perigee factor
a=abs((ilu-50))*2;
s=a./pa;I = ~isnan(time) & ~isnan(s);
time=time(I);s=s(I);
dist=dist(I);ilu=ilu(I);
timestamp=datetime(time,'InputFormat','dd.MM.yyyy HH:mm:ss.SSS','ConvertFrom','datenum');

TT=timetable(timestamp,dist,ilu,s);

dt = minutes(30);
moon = retime(TT,'regular','linear','TimeStep',dt);

%% longterm daily mean and anomaly (creating '2020_int.mat', 2021_int.mat', '2022_int(til_may).mat', 'longterm_int1.mat', 'longterm_int2.mat', and 'longterm_runnningm_and_anomaly2.mat')
   clearvars        
     %2020 has [2 3 5 6 7 8 9 10 11 12]; 2021 has [1 2 3 4 6 7 8 9 10 11 12] ; 2022 has 1:5
     load('202201_int_IFCB.mat'); % TO START year
      M=table2cell(data);
     Data_int=cell2mat(M(:,1));mdate_int=cell2mat(M(:,2));MDate_int=mdate_int.*24;% TO START
   for i= 2:5     
    m=num2str(i); if i<10,m=['0',num2str(i)];end 
    file=strcat('2022',m,'_int_IFCB.mat'); %                      
    load(file);
    M=table2cell(data);
    data_int2=cell2mat(M(:,1)); % change num in series
    mdate_int=cell2mat(M(:,2));
    mdate_int2=mdate_int.*24; % change to num in series
                             
        Data_int=cat(1,Data_int,data_int2); % change array added
        MDate_int=cat(1,MDate_int,mdate_int2); % change array added
   end
save('2022_int(til_may).mat','Data_int','MDate_int')

clearvars;load('2020_int.mat');d2021=Data_int;m2021=MDate_int; 
load('2021_int.mat');
Data_inti=cat(1,d2021,Data_int); % change array added
        MDate_inti=cat(1,m2021,MDate_int); % change array added
    load('2022_int(til_may).mat');
    Data_int=cat(1,Data_inti,Data_int); % change array added
        MDate_int=cat(1,MDate_inti,MDate_int); % change array added
        save('longterm_int1.mat','Data_int','MDate_int');
 datam=zeros(height(Data_int),97);
    data_anom=zeros(height(Data_int),97);
for j=26:height(MDate_int)-25
    x=j-25;y=j+25;
        datam(j,:)=mean(Data_int(x:y,:));
        data_anom(j,:)=Data_int(j,:)-datam(j,:);
end
filem=strcat('longterm_runningm_and_anomaly2.mat');
    save(filem,'datam','data_anom','MDate_int');



