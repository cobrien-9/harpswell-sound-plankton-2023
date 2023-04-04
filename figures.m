%   What: Blooming dynamics of phytoplankton communities in Harpswell Sound ME
%   Why: Independent project figure documentation
%   When: May 2023
%   Who: Charles O'Brien

% files needed: biovolume.mat, *_int_IFCB.mat, Headers.mat,
% longterm_runningm_and_anomaly2.mat, LOBO_HL_model_junjul21.mat,longterm_int1.mat
% Sensor005220230216144947.tsv, Sensor0052-20230208114311.tsv,
% longterm_int2.mat,lobo_retimed.mat,
% mt.mat, lobo.mat, mc.mat, mn.mat, transect_HS.mat, key.xlsx

clearvars
% cd to folder with files needed

%% Figure 8
clearvars
% column classifications
diatoms=[4 5 7 11 13 15 16 17 18 19 25 26 27 33 34 35 37 42 44 45 49 50 53 57 64 67 69 70 73 74 94];
dinos=[1 2 3 8 9 10 23 24 32 36 38 39 40 46 47 52 58 59 60 61 62 63 68 78];
flags=[12 14 20 22 28 54 55 65 66 77 79 91];
cils=[6 21 29 30 31 41 43 48 56 71 75 76 84];
coccs=[51 72 85];
nanos=[92 93];
detr=[86 87 88 90 95];
zoo=97;
load('biovolume.mat');
for i=[2 3 5 6 7 8 9 10 11 12]           
    m=num2str(i); if i<10,m=['0',num2str(i)];end 
    file=strcat('2020',m,'_int_IFCB.mat'); % 
    load(file);
    M=table2cell(data);
    c=cell2mat(M(:,1));
    for j=1:height(c)
        c(j,:)=c(j,:).*bvol(1,:)/10000/10000/10000*1000000;
    end
    g=c(:,diatoms); q=g.'; w=sum(q); dia=w.';
    g=c(:,dinos); q=g.'; w=sum(q); din=w.';
    g=c(:,flags); q=g.'; w=sum(q); fla=w.';
    g=c(:,coccs); q=g.'; w=sum(q); coc=w.';
    g=c(:,nanos); q=g.'; w=sum(q); nano=w.';
    photo=dia+din+fla+coc+nano;
    mdate=cell2mat(M(:,2)); rdate=mdate-0.1666666667; % local time
    figure(17);subplot(3,1,1);plot(rdate,photo,'b-','LineWidth',1.2);hold on;
    subplot(3,1,2);plot(rdate,dia,'b-','LineWidth',1.2);hold on;
    subplot(3,1,3);dia_pc=dia./photo.*100;plot(rdate,dia_pc,'b-','LineWidth',1.2);hold on;
end
hold on;
subplot(3,1,1);ylabel('Phytoplankton (cm^3/m^3)');datetick('x');xlim([737791 738156]);
subplot(3,1,2);ylabel('Diatoms (cm^3/m^3)');datetick('x');xlim([737791 738156]);
subplot(3,1,3);ylabel('% diatoms');datetick('x','mmm','keeplimits');xlim([737791 738156]);
for i=[1 2 3 4 6 7 8 9 10 11 12]         
    m=num2str(i); if i<10,m=['0',num2str(i)];end 
    file=strcat('2021',m,'_int_IFCB.mat'); % 
    load(file);
    M=table2cell(data);
    c=cell2mat(M(:,1));
    for j=1:height(c)
        c(j,:)=c(j,:).*bvol(1,:)/10000/10000/10000*1000000;
    end
        g=c(:,diatoms); q=g.'; w=sum(q); dia=w.';
         g=c(:,dinos); q=g.'; w=sum(q); din=w.';
    g=c(:,flags); q=g.'; w=sum(q); fla=w.';
    g=c(:,coccs); q=g.'; w=sum(q); coc=w.';
    g=c(:,nanos); q=g.'; w=sum(q); nano=w.';
        photo=dia+din+fla+coc+nano;
    mdate=cell2mat(M(:,2)); rdate=mdate-0.1666666667-365.25; % local time
    subplot(3,1,1);
    plot(rdate,photo,'m-','LineWidth',1.2);hold on;
    subplot(3,1,2);
    plot(rdate,dia,'m-','LineWidth',1.2);hold on;
    subplot(3,1,3);dia_pc=dia./photo.*100;plot(rdate,dia_pc,'m-','LineWidth',1.2);hold on;
end
hold on;
for i=1:5          
    m=num2str(i); if i<10,m=['0',num2str(i)];end 
    file=strcat('2022',m,'_int_IFCB.mat'); % 
    load(file);
    M=table2cell(data);
    c=cell2mat(M(:,1));
    for j=1:height(c)
        c(j,:)=c(j,:).*bvol(1,:)/10000/10000/10000*1000000;
    end
        g=c(:,diatoms); q=g.'; w=sum(q); dia=w.';
          g=c(:,dinos); q=g.'; w=sum(q); din=w.';
    g=c(:,flags); q=g.'; w=sum(q); fla=w.';
    g=c(:,coccs); q=g.'; w=sum(q); coc=w.';
   g=c(:,nanos); q=g.'; w=sum(q); nano=w.';
        photo=dia+din+fla+coc+nano;
    mdate=cell2mat(M(:,2)); rdate=mdate-0.1666666667-730.5; % local time
    subplot(3,1,1);
    plot(rdate,photo,'g-','LineWidth',1.2);
    subplot(3,1,2);
    plot(rdate,dia,'g-','LineWidth',1.2);
    subplot(3,1,3);dia_pc=dia./photo.*100;plot(rdate,dia_pc,'g-','LineWidth',1.2);hold on;
end
subplot(3,1,1);legend('2020','2021','2022');fontname(gcf,"Times New Roman");
%% Figure 9
clearvars
% drag in Sensor005220230216144947
 a=1:2593; % 735599 2014
b=2594:6267; % 735964 2015
 c=6268:11481; % 736329 2016
 d=11482:16585; % 736695.00 2017
 e=16586:21671; % 737060.00 2018
 f=21672:24756; % 737425.00 2019
g=24757:26954; % 737790.00 2020
 h=26955:33958; % 738156.00 2021
i1=33959:36339; % 738521.00 2022
time=table2array(Sensor005220230216144947(:,1));time=datenum(time);
sal=table2array(Sensor005220230216144947(:,2));temp=table2array(Sensor005220230216144947(:,3));
sizea = size(temp);
numrows = sizea(1);
numcols = sizea(2);
tthresh = -1;
salthresh = 15;
for i = 1:numrows 
    
        if temp(i,1) < tthresh
            temp(i,1) = nan;
        end 
        if sal(i,1) < salthresh
            sal(i,1) = nan;
        end       
  
end 
figure(1);tiledlayout(1,9); %set scale big
nexttile;plot(time(a),temp(a),'r');datetick('x','mmm');ylabel('Temperature (°C)');
xlim([735599 735963]);ylim([-5 25]);grid on;title('2014');
nexttile;plot(time(b),temp(b),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([735964 736328]);ylim([-5 25]);grid on;title('2015');
nexttile;plot(time(c),temp(c),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([736329 736694]);ylim([-5 25]);grid on;title('2016');
nexttile;plot(time(d),temp(d),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([736695 737059]);ylim([-5 25]);grid on;title('2017');
nexttile;plot(time(e),temp(e),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([737060 737424]);ylim([-5 25]);grid on;title('2018');
nexttile;plot(time(f),temp(f),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([737425 737789]);ylim([-5 25]);grid on;title('2019');
nexttile;plot(time(g),temp(g),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([737790 738155]);ylim([-5 25]);grid on;title('2020');
nexttile;plot(time(h),temp(h),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([738156 738520]);ylim([-5 25]);grid on;title('2021');
nexttile;plot(time(i1),temp(i1),'r');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([738521 738885]);ylim([-5 25]);grid on;title('2022');
figure(1);fontname(gcf,"Times New Roman");

figure(2);tiledlayout(1,9);
nexttile;plot(time(a),sal(a),'k');datetick('x','mmm');ylabel('Salinity (ppt)');
xlim([735599 735963]);ylim([15 34]);grid on;
nexttile;plot(time(b),sal(b),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([735964 736328]);ylim([15 34]);grid on;
nexttile;plot(time(c),sal(c),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([736329 736694]);ylim([15 34]);grid on;
nexttile;plot(time(d),sal(d),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([736695 737059]);ylim([15 34]);grid on;
nexttile;plot(time(e),sal(e),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([737060 737424]);ylim([15 34]);grid on;
nexttile;plot(time(f),sal(f),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([737425 737789]);ylim([15 34]);grid on;
nexttile;plot(time(g),sal(g),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([737790 738155]);ylim([15 34]);grid on;
nexttile;plot(time(h),sal(h),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([738156 738520]);ylim([15 34]);grid on;
nexttile;plot(time(i1),sal(i1),'k');datetick('x','mmm');set(gca,'Yticklabel',[])
xlim([738521 738885]);ylim([15 34]);grid on;
figure(2);fontname(gcf,"Times New Roman");

clearvars
% drag in 'Sensor0052-20230208114311.tsv'
figure(3);tiledlayout(1,9);
 a=1:56; % 735599 2014
sensor=table2array(Sensor005220230208114311(a,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(a,1));time=datenum(time);
for r=1:length(a)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
datetick('x','mmm');ylabel('Depth (m)');xlim([735599 735963]);

clearvars 
% drag in 'Sensor0052-20230208114311.tsv'
b=57:1322; % 735964 2015
sensor=table2array(Sensor005220230208114311(b,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(b,1));time=datenum(time);
for r=1:length(b)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
datetick('x','mmm');xlim([735964 736328]);set(gca,'Yticklabel',[]);

clearvars
% drag in 'Sensor0052-20230208114311.tsv'
 c=1323:4984; % 736329 2016
sensor=table2array(Sensor005220230208114311(c,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(c,1));time=datenum(time);
for r=1:length(c)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
datetick('x','mmm');xlim([736329 736694]);set(gca,'Yticklabel',[]);

clearvars
% drag in 'Sensor0052-20230208114311.tsv'
d=4985:9874; % 736695.00 2017
sensor=table2array(Sensor005220230208114311(d,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(d,1));time=datenum(time);
for r=1:length(d)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
datetick('x','mmm');xlim([736695 737059]);set(gca,'Yticklabel',[]);

clearvars
% drag in 'Sensor0052-20230208114311.tsv'
 e=9875:12465; % 737060.00 2018
sensor=table2array(Sensor005220230208114311(e,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(e,1));time=datenum(time);
for r=1:length(e)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
datetick('x','mmm');xlim([737060 737424]);set(gca,'Yticklabel',[]);

clearvars
% drag in 'Sensor0052-20230208114311.tsv'
 f=12465:17442; % 737425.00 2019
sensor=table2array(Sensor005220230208114311(f,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(f,1));time=datenum(time);
for r=1:length(f)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
%ylabel(h,'Residual current speed (cm/s)','FontSize',12);
datetick('x','mmm');xlim([737425 737789]);set(gca,'Yticklabel',[]);

clearvars
% drag in 'Sensor0052-20230208114311.tsv'
g=17443:19332; % 737790.00 2020
sensor=table2array(Sensor005220230208114311(g,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(g,1));time=datenum(time);
for r=1:length(g)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
datetick('x','mmm');xlim([737790 738155]);set(gca,'Yticklabel',[]);

clearvars
% drag in 'Sensor0052-20230208114311.tsv'
 h=19333:25489; % 738156.00 2021
sensor=table2array(Sensor005220230208114311(h,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(h,1));time=datenum(time);
for r=1:length(h)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
colorbar off;
datetick('x','mmm');xlim([738156 738520]);set(gca,'Yticklabel',[])

clearvars 
% drag in 'Sensor0052-20230208114311.tsv'
i1=25490:27836; % 738521.00 2022
sensor=table2array(Sensor005220230208114311(i1,2:91));
for n=1:30
    U(1,n)=3+(3*(n-1));E(1,n)=1+(3*(n-1));N(1,n)=2+(3*(n-1));x1(1,n)=0;y1(1,n)=n*(-1);end
up=sensor(:,U)/10; %velocity vertical (mm/s to cm/s)
east=sensor(:,E)/10;%(mm/s to cm/s)
north=sensor(:,N)/10;%(mm/s to cm/s)
theta_rot=45; % whatever angle you determine from the map 
rotN=cosd(theta_rot) + sind(theta_rot);
along = north*rotN; %velocity along-sound 
time=table2array(Sensor005220230208114311(i1,1));time=datenum(time);
for r=1:length(i1)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);
end
sizea = size(along);
numrows = sizea(1);
numcols = sizea(2);
threshold = 50;
for i = 1:numrows 
    for j = 1:numcols
        if abs(along(i,j)) > threshold
            along(i,j) = 0;
        end 
        if abs(up(i,j)) > threshold
            up(i,j) = 0;
        end       
    end 
end 
tavg=zeros(height(time),1);
 for j=26:height(time)-25
     low=j-25;high=j+25;
 tavg(j,1)=mean(time(low:high,1));
 end
sz=size(x);acuravg=zeros(sz);upcuravg=zeros(sz);
for h=1:30
    for j=26:height(time)-25
    low=j-25;high=j+25;    
        acuravg(j,h)=mean(along(low:high,h));
        upcuravg(j,h)=mean(up(low:high,h));
    end
end
for q=2:30
 time(:,q)=time(:,1);end
nexttile;nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
 clim([-12 12]);
h = colorbar;
set(h, 'ylim', [-15 15])
colormap(mycolormap);
ylabel(h,'Along-sound residual current velocity (cm/s)','FontSize',12);
datetick('x','mmm');xlim([738521 738885]);set(gca,'Yticklabel',[]);
fontname(gcf,"Times New Roman");

%% Figure 10
clearvars
load lobo_retimed.mat
t_lobo_aligned=LOBO(2362:140436,:);t=t_lobo_aligned.timestamp;tnum=datenum(t);
yearday(1:8745,1)=tnum(1:8745,1)-735599; %2014
yearday(8746:26265,1)=tnum(8746:26265,1)-735964;
yearday(26266:43833,1)=tnum(26266:43833,1)-736329;
yearday(43834:61353,1)=tnum(43834:61353,1)-736695;
yearday(61354:78873,1)=tnum(61354:78873,1)-737060;
yearday(78874:96393,1)=tnum(78874:96393,1)-737425;
yearday(96394:113961,1)=tnum(96394:113961,1)-737790;
yearday(113962:131481,1)=tnum(113962:131481,1)-738156;
yearday(131482:138075,1)=tnum(131482:138075,1)-738521; %2022

lobo_aligned=table2array(t_lobo_aligned);
lobo_aligned(1402:13920,:)=NaN;
lobo_aligned(15994:32073,:)=NaN;
lobo_aligned(42346:48153,:)=NaN;
lobo_aligned(58426:65673,:)=NaN;
lobo_aligned(72202:83193,:)=NaN;
lobo_aligned(90538:108778,:)=NaN;
lobo_aligned(113002:116995,:)=NaN;
lobo_aligned(118714:124708,:)=NaN;
lobo_aligned(130042:130330,:)=NaN;
lobo_aligned(132010:133306,:)=NaN;
lobo_aligned(134328:135696,:)=NaN;
lobo_aligned(134328:135696,:)=NaN;
lobo_aligned(136282:136762,:)=NaN;

sal=lobo_aligned(:,2);
temp=lobo_aligned(:,1);

o=find(sal<20);
sal(o,:)=NaN;
temp(o,:)=NaN;

load mc.mat
roi=2306:140380;
time=datenum(mc.Time);time=time(roi,:);
acuravg=mc.Var1;acuravg=acuravg(roi,:);
m1=acuravg(:,1);

ind = isnan(sal) | isnan(m1);
sal(ind) = [];
m1(ind) = [];
yearday(ind) = [];
time(ind) = [];
temp(ind)=[];

figure(101)
yline(0,'--k');hold on;
scatter(sal,m1,1,yearday,'filled');colorbar;xlim([20 33]);colormap hsv;c=colorbar;c.Label.String='Day of year';c.Label.FontSize=11;hold on;
Fit=polyfit(sal,m1,1); % x = x data, y = y data, 1 = order of the polynomial i.e a straight line 
y=sal*-.3977+13.135;
plot(sal,y,'k',LineWidth=2.5);hold on;mdl=fitlm(sal,m1); %rsquared 0.03
a(:,1)=yearday;a(:,2)=m1;a(:,3)=sal;a(:,4)=temp;
A=sortrows(a,1);
A(2941:17622,:)=[];%exclude april-may (day 91-152)
sal_noam=A(:,3);
m1_noam=A(:,2);
Fit2=polyfit(sal_noam,m1_noam,1); 
y2=sal_noam*-1.4793+46.9976;
plot(sal_noam,y2,'k:',LineWidth=1);mdl2=fitlm(sal_noam,m1_noam);grid on; %rsquared 0.23
ylabel('Residual current velocity at 1m (cm/s)');xlabel('Salinity (ppm)');ylim([-15 15]);xlim([20.5 32.5]);
fontname(gcf,"Times New Roman");

figure(102)
yline(0,'--k');hold on;
scatter(temp,m1,1,yearday,'filled');colorbar;xlim([-1 21]);colormap hsv;c=colorbar;c.Label.String='Day of year';c.Label.FontSize=11;hold on;
Fit=polyfit(temp,m1,1); % x = x data, y = y data, 1 = order of the polynomial i.e a straight line 
y=temp.*.2387-1.6116;
plot(temp,y,'k',LineWidth=2.5);hold on;mdl=fitlm(temp,m1);%rsquared 0.13
temp_noam=A(:,4);
Fit2=polyfit(temp_noam,m1_noam,1); 
y2=temp_noam*0.2958-2.6578;
plot(temp_noam,y2,'k:',LineWidth=1);mdl2=fitlm(temp_noam,m1_noam);grid on; %rsquared 0.23
ylabel('Residual current velocity at 1m (cm/s)');xlabel('Temperature (°C)');ylim([-15 15]);
fontname(gcf,"Times New Roman");
%% Figure 11
clearvars
figure(11)
subplot(3,1,1)
load('longterm_runningm_and_anomaly2.mat');load('biovolume.mat');
rdate=(MDate_int-4)./24;x=rdate;% local time
dataline=datam.*bvol(1,:)/10000/10000/10000*1000000;
    Thal(:,1)=dataline(:,74);Thal(:,2)=datam(:,74).*bvol(2,74)/10000/10000/10000*1000000;Thal(:,3)=datam(:,74)*bvol(3,74)/10000/10000/10000*1000000;
    Chae(:,1)=dataline(:,11);Chae(:,2)=datam(:,11).*bvol(2,11)/10000/10000/10000*1000000;Chae(:,3)=datam(:,11)*bvol(3,11)/10000/10000/10000*1000000;
    %Skel(:,1)=dataline(:,69);Skel(:,2)=datam(:,69).*bvol(2,69)/10000/10000/10000*1000000;Skel(:,3)=datam(:,69)*bvol(3,69)/10000/10000/10000*1000000;
    Guin(:,1)=dataline(:,33);Guin(:,2)=datam(:,33).*bvol(2,33)/10000/10000/10000*1000000;Guin(:,3)=datam(:,33)*bvol(3,33)/10000/10000/10000*1000000;
    Cera(:,1)=dataline(:,7);Cera(:,2)=datam(:,7).*bvol(2,7)/10000/10000/10000*1000000;Cera(:,3)=datam(:,7)*bvol(3,7)/10000/10000/10000*1000000;
        Bac(:,1)=dataline(:,5);Bac(:,2)=datam(:,5).*bvol(2,5)/10000/10000/10000*1000000;Bac(:,3)=datam(:,5)*bvol(3,5)/10000/10000/10000*1000000;

        patch([x; flip(x)], [Thal(:,2); flip(Thal(:,3))],[0 0.4470 0.7410],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Thal(:,1),'k','LineWidth',1.2);hold on;
        patch([x; flip(x)], [Chae(:,2); flip(Chae(:,3))],[0.8500 0.3250 0.0980],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Chae(:,1),'k','LineWidth',1.2);hold on;
%       patch([x; flip(x)], [Skel(:,2); flip(Skel(:,3))],[0.4940 0.1840 0.5560],'FaceAlpha',.5,'EdgeColor','none');hold on;
%     plot(x,Skel(:,1),'k','LineWidth',1.2);hold on;
    patch([x; flip(x)], [Guin(:,2); flip(Guin(:,3))],[0.4660 0.6740 0.1880],'FaceAlpha',.5,'EdgeColor','none');hold on;
        plot(x,Guin(:,1),'k','LineWidth',1.2);hold on;
    patch([x; flip(x)], [Cera(:,2); flip(Cera(:,3))],[0.9290 0.6940 0.1250],'FaceAlpha',.5,'EdgeColor','none');hold on;
        plot(x,Cera(:,1),'k','LineWidth',1.2);hold on;
    patch([x; flip(x)], [Bac(:,2); flip(Bac(:,3))],[0.4940 0.1840 0.5560],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Bac(:,1),'k','LineWidth',1.2);hold on;
datetick('x','mmm','keeplimits');xlim([737791 738156]);ylim([0 200]);
subplot(3,1,2);clearvars;
load('longterm_runningm_and_anomaly2.mat');load('biovolume.mat');
rdate=(MDate_int-4)./24;x=rdate;% local time
dataline=datam.*bvol(1,:)/10000/10000/10000*1000000;
    Thal(:,1)=dataline(:,74);Thal(:,2)=datam(:,74).*bvol(2,74)/10000/10000/10000*1000000;Thal(:,3)=datam(:,74)*bvol(3,74)/10000/10000/10000*1000000;
    Chae(:,1)=dataline(:,11);Chae(:,2)=datam(:,11).*bvol(2,11)/10000/10000/10000*1000000;Chae(:,3)=datam(:,11)*bvol(3,11)/10000/10000/10000*1000000;
    Skel(:,1)=dataline(:,69);Skel(:,2)=datam(:,69).*bvol(2,69)/10000/10000/10000*1000000;Skel(:,3)=datam(:,69)*bvol(3,69)/10000/10000/10000*1000000;
    Guin(:,1)=dataline(:,33);Guin(:,2)=datam(:,33).*bvol(2,33)/10000/10000/10000*1000000;Guin(:,3)=datam(:,33)*bvol(3,33)/10000/10000/10000*1000000;
    Cera(:,1)=dataline(:,7);Cera(:,2)=datam(:,7).*bvol(2,7)/10000/10000/10000*1000000;Cera(:,3)=datam(:,7)*bvol(3,7)/10000/10000/10000*1000000; 
             Bac(:,1)=dataline(:,5);Bac(:,2)=datam(:,5).*bvol(2,5)/10000/10000/10000*1000000;Bac(:,3)=datam(:,5)*bvol(3,5)/10000/10000/10000*1000000;
    patch([x; flip(x)], [Thal(:,2); flip(Thal(:,3))],[0 0.4470 0.7410],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Thal(:,1),'k','LineWidth',1.2);hold on;
        patch([x; flip(x)], [Chae(:,2); flip(Chae(:,3))],[0.8500 0.3250 0.0980],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Chae(:,1),'k','LineWidth',1.2);hold on;
%       patch([x; flip(x)], [Skel(:,2); flip(Skel(:,3))],[0.4940 0.1840 0.5560],'FaceAlpha',.5,'EdgeColor','none');hold on;
%     plot(x,Skel(:,1),'k','LineWidth',1.2);hold on;
    patch([x; flip(x)], [Guin(:,2); flip(Guin(:,3))],[0.4660 0.6740 0.1880],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Guin(:,1),'k','LineWidth',1.2);hold on;
    patch([x; flip(x)], [Cera(:,2); flip(Cera(:,3))],[0.9290 0.6940 0.1250],'FaceAlpha',.5,'EdgeColor','none');hold on;
        plot(x,Cera(:,1),'k','LineWidth',1.2);hold on;
        patch([x; flip(x)], [Bac(:,2); flip(Bac(:,3))],[0.4940 0.1840 0.5560],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Bac(:,1),'k','LineWidth',1.2);hold on;
ylabel('Daily biovolume (cm^3/m^3 water)');
datetick('x','mmm','keeplimits');xlim([738157 738521]);ylim([0 200]);
    subplot(3,1,3);clearvars;
load('longterm_runningm_and_anomaly2.mat');load('biovolume.mat');
rdate=(MDate_int-4)./24;x=rdate;% local time
dataline=datam.*bvol(1,:)/10000/10000/10000*1000000;
    Thal(:,1)=dataline(:,74);Thal(:,2)=datam(:,74).*bvol(2,74)/10000/10000/10000*1000000;Thal(:,3)=datam(:,74)*bvol(3,74)/10000/10000/10000*1000000;
    Chae(:,1)=dataline(:,11);Chae(:,2)=datam(:,11).*bvol(2,11)/10000/10000/10000*1000000;Chae(:,3)=datam(:,11)*bvol(3,11)/10000/10000/10000*1000000;
    Skel(:,1)=dataline(:,69);Skel(:,2)=datam(:,69).*bvol(2,69)/10000/10000/10000*1000000;Skel(:,3)=datam(:,69)*bvol(3,69)/10000/10000/10000*1000000;
    Guin(:,1)=dataline(:,33);Guin(:,2)=datam(:,33).*bvol(2,33)/10000/10000/10000*1000000;Guin(:,3)=datam(:,33)*bvol(3,33)/10000/10000/10000*1000000;
    Cera(:,1)=dataline(:,7);Cera(:,2)=datam(:,7).*bvol(2,7)/10000/10000/10000*1000000;Cera(:,3)=datam(:,7)*bvol(3,7)/10000/10000/10000*1000000;
            Bac(:,1)=dataline(:,5);Bac(:,2)=datam(:,5).*bvol(2,5)/10000/10000/10000*1000000;Bac(:,3)=datam(:,5)*bvol(3,5)/10000/10000/10000*1000000;
    patch([x; flip(x)], [Thal(:,2); flip(Thal(:,3))],[0 0.4470 0.7410],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Thal(:,1),'k','LineWidth',1.2);hold on;
        patch([x; flip(x)], [Chae(:,2); flip(Chae(:,3))],[0.8500 0.3250 0.0980],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Chae(:,1),'k','LineWidth',1.2);hold on;
%       patch([x; flip(x)], [Skel(:,2); flip(Skel(:,3))],[0.4940 0.1840 0.5560],'FaceAlpha',.5,'EdgeColor','none');hold on;
%     plot(x,Skel(:,1),'k','LineWidth',1.2);hold on;
    patch([x; flip(x)], [Guin(:,2); flip(Guin(:,3))],[0.4660 0.6740 0.1880],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Guin(:,1),'k','LineWidth',1.2);hold on;
    patch([x; flip(x)], [Cera(:,2); flip(Cera(:,3))],[0.9290 0.6940 0.1250],'FaceAlpha',.5,'EdgeColor','none');hold on;
        plot(x,Cera(:,1),'k','LineWidth',1.2);hold on;
        patch([x; flip(x)], [Bac(:,2); flip(Bac(:,3))],[0.4940 0.1840 0.5560],'FaceAlpha',.5,'EdgeColor','none');hold on;
    plot(x,Bac(:,1),'k','LineWidth',1.2);hold on;
xlabel('Date')
datetick('x','mmm','keeplimits');xlim([738521 738886]);ylim([0 200]);
fontname(gcf,"Times New Roman");

%% Figure 12
    clearvars
load('LOBO_HL_model_junjul21.mat'); 
L=H_model_jun_jul21;H=L_model_jun_jul21;
load('longterm_int1.mat'); 
rdate_intc=(MDate_int-4)./24;% local time
i=18029:19765;Data_int=Data_int(i,:);rdate_intc=rdate_intc(i,:); 
load('biovolume.mat');Data_int=Data_int.*bvol(1,:)/10000/10000/10000*1000000;
Tha=Data_int(:,74);Chae=Data_int(:,11);Cyli=Data_int(:,16);Skel=Data_int(:,69);Cera=Data_int(:,44);
H=H(1:74,2)-18026;L=L(1:73,2)-18026;H(1:2,:)=[];L(1:3,:)=[];
figure(12)
subplot(4,1,1)
    plot(rdate_intc,Skel,'k-');hold on;
    plot(rdate_intc(H(:,1)),Skel(H(:,1)),'b-o','LineWidth',2);hold on;
    plot(rdate_intc(L(:,1)),Skel(L(:,1)),'r-o','LineWidth',2);grid ON;hold on; 
    legend('Skeletonema','High tide population','Low tide population','Location','northwest');ylim([0 105]);
    ax=gca;xlim('tight');g=xlim;r=g(1):1:g(2);ax.XTick=r; datetick('x','mm/dd','keeplimits');
     subplot(3,1,2)
    plot(rdate_intc,Chae,'k-');hold on;
    plot(rdate_intc(H(:,1)),Chae(H(:,1)),'b-o','LineWidth',2);hold on;
    plot(rdate_intc(L(:,1)),Chae(L(:,1)),'r-o','LineWidth',2);grid ON;hold on; 
    legend('Chaetoceros','Location','northwest');ylabel('Biovolume (cm^3/m^3 water)');ylim([0 105]);
    ax=gca;xlim('tight');g=xlim;r=g(1):1:g(2);ax.XTick=r; datetick('x','mm/dd','keeplimits');
 subplot(3,1,3)
    plot(rdate_intc,Tha,'k-');hold on;
    plot(rdate_intc(H(:,1)),Tha(H(:,1)),'b-o','LineWidth',2);hold on;
    plot(rdate_intc(L(:,1)),Tha(L(:,1)),'r-o','LineWidth',2);grid ON;hold on;
    legend('Thalassiosira','Location','northwest');ylim([0 105]);
    ax=gca;xlim('tight');g=xlim;r=g(1):1:g(2);ax.XTick=r; datetick('x','mm/dd','keeplimits');
    fontname(gcf,"Times New Roman");

%% Figure 13
clearvars
load mt.mat
roi=10008:39843;
t=mt.timestamp;tn=datenum(t(roi));
a=mt.images_ml;
load biovolume.mat;
b=a.*bvol(1,:)/10000/10000/10000*1000000;
g=b(roi,33);
c=b(roi,11);
s=b(roi,69);
t=b(roi,74);
figure(1);subplot(2,1,1)
plot(tn,g,'r');hold on;
plot(tn,c,'g');hold on;
plot(tn,s,'b');hold on;
plot(tn,t,'m');hold on;
datetick('x');
grid on;xlim([738051 738673]);
set(gca,'Xticklabel',[]);ylabel('Biovolume (cm^3/m^3)');
legend('Guinardia delicatula','Chaetoceros','Skeletonema','Thalassiosira','Location','best');

load hl_2020on.mat
h=rhl_fromsep20(:,1)-147;
l=rhl_fromsep20(1:1230,2)-147;

hv=g(h(:));lv=g(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    gs=vH-vL;
hv=c(h(:));lv=c(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    cs=vH-vL;
hv=s(h(:));lv=s(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    ss=vH-vL;
hv=t(h(:));lv=t(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    ts=vH-vL;

    subplot(2,1,2);
yline(0,'k-',linewidth=1);hold on;
plot(tn,gs,'r');hold on;
plot(tn,cs,'g');hold on;
plot(tn,ss,'b');hold on;
plot(tn,ts,'m');hold on;
grid on;xlim([738051 738673]);ylim([-150 150]);
datetick('x','keeplimits');ylabel('\Delta slack biovolume (cm^3/m^3)');
    fontname(gcf,"Times New Roman");
    
%% figure 14
clearvars
load lobo_retimed.mat
time=datenum(LOBO.timestamp);
sal=LOBO.sal;temp=LOBO.temp;
sizea = size(temp);numrows = sizea(1);tthresh = -1;sthresh = 25;
for i = 1:numrows 
        if temp(i,1) < tthresh
            temp(i,1) = nan;
        end 
        if sal(i,1) < sthresh
            sal(i,1) = nan;
        end       
end 
figure(14);subplot(4,1,1);
colororder({'r','k'});
yyaxis left;plot(time,temp,'r');grid on;
datetick('x','mmm','keeplimits');ylabel('Temperature (°C)');xlim([738491 738672]);set(gca,'Xticklabel',[]);
yyaxis right;
plot(time,sal,'k');grid on;
datetick('x','mmm','keeplimits');ylabel('Salinity (ppt)');xlim([738491 738672]);set(gca,'Xticklabel',[])

clearvars
load('mn.mat');
t=moon.timestamp;t=t(30721:39265);t=datenum(t);
s=moon.s;s=s(30721:39265);
subplot(4,1,2)
plot(t,s,'k',linewidth=1);grid on;
datetick('x','mmm');ylabel('Tidal magnification (%)');
xlim([738491 738672]);set(gca,'Xticklabel',[]);

clearvars
load('LOBO_HL_2022.mat'); 
load('longterm_int1.mat');
rdate_intc=(MDate_int-4)./24;% local time
i=23884:32425;Data_int=Data_int(i,:);rdate_intc=rdate_intc(i,:); 
load('biovolume.mat');Data_int=Data_int.*bvol(1,:)/10000/10000/10000*1000000;
g=Data_int(:,33);
subplot(4,1,3)
    grid on;ylabel('Biovolume (cm^3/m^3)');
 ax=gca;xlim('tight');g1=xlim;r=g1(1):1:g1(2);ax.XTick=r; datetick('x','mmm','keeplimits');
    set(gca,'Xticklabel',[]);
xlim([738491 738672]);hold on;
clearvars
load mt.mat
roi=10008:39843;
t=mt.timestamp;tn=datenum(t(roi));
a=mt.images_ml;
load biovolume.mat;
b=a.*bvol(1,:)/10000/10000/10000*1000000;
g=b(roi,33);
load hl_2020on.mat
h=rhl_fromsep20(:,1)-147;
l=rhl_fromsep20(1:1230,2)-147;
hv=g(h(:));lv=g(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    gs=vH-vL;
plot(tn,vL,'r',LineWidth=1);hold on;
plot(tn,vH,'b',LineWidth=1);hold on;
grid on;
datetick('x','keeplimits');set(gca,'Xticklabel',[]);
    fontname(gcf,"Times New Roman");

        clearvars
load mc.mat
for n=1:30
    x1(1,n)=0;y1(1,n)=n*(-1);end
roi=124620:140431;
time=datenum(mc.Time);time=time(roi,:);
acuravg=mc.Var1;acuravg=acuravg(roi,:);
for r=1:height(time)
    x(r,1:30)=x1(1,1:30);y(r,1:30)=y1(1,1:30);end
for q=2:30
 time(:,q)=time(:,1);end
subplot(4,1,4)
    nanContourf(time,y,time,y,acuravg,100);grid on;
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
colorbar('eastoutside');
clim([-12 12]);h = colorbar;set(h, 'ylim', [-15 15]);colormap(mycolormap);
ylabel(h,'Residual current speed (cm/s)',FontSize=11);%set(get(gca,'YLabel'),'Rotation',30)
    ax=gca;xlim('tight');g1=xlim;r=g1(1):1:g1(2);ax.XTick=r; datetick('x','mmm','keeplimits');
ylabel('Depth (m)');
xlim([738491 738672])
fontname(gcf,"Times New Roman");

%% Figure 15
clearvars
load mt.mat
c=mt.images_ml;
load('biovolume.mat');b=c.*bvol(1,:)/10000/10000/10000*1000000;
t=datenum(mt.timestamp);
tx=[1 23 24 32 39 64 38];
tox=b(:,tx);

 a=zeros(height(b),97);
    a1=zeros(height(b),97);
    for o=1:97
for j=51:height(b)-50
    x=j-50;y=j+50;
        a(j,o)=mean(b(x:y,o));
        a1(j,o)=b(j,o)-a(j,o);
end
    end
tox_avg=a(:,tx);

figure(15)
subplot(2,1,1);area(t,tox_avg);datetick('x','mmm');ylabel('Biovolume (cm^3/m^3)');grid on;%set(gca,'Xticklabel',[]);
legend('Alexandrium catenella','Dinophysis acuminata','Dinophysis norvegica','Gonyaulax','Karenia','Pseudonitzschia','Heterocapsa triquetra','Location','best');
xlim([737844 738670]);  set(gca,'Xticklabel',[]);

clearvars
load mt.mat
roi=10008:39843;
G=mt.timestamp;tn=datenum(G(roi));
a=mt.images_ml;
load biovolume.mat;
b=a.*bvol(1,:)/10000/10000/10000*1000000;
p=b(roi,64);
a=b(roi,1);
d=b(roi,23);
d2=b(roi,24);
G=b(roi,32);
H=b(roi,38);
k=b(roi,39);
load hl_2020on.mat
h=rhl_fromsep20(:,1)-147;
l=rhl_fromsep20(1:1230,2)-147;

hv=p(h(:));lv=p(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    ps=vH-vL;
hv=a(h(:));lv=a(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    as=vH-vL;
hv=d(h(:));lv=d(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    ds=vH-vL;
hv=d2(h(:));lv=d2(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    d2s=vH-vL;
hv=G(h(:));lv=G(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    Gs=vH-vL;
hv=k(h(:));lv=k(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    ks=vH-vL;
hv=H(h(:));lv=H(l(:));
    vH=interp1(tn(h(:)),hv,tn);
    vL=interp1(tn(l(:)),lv,tn);
    Hs=vH-vL;


    subplot(2,1,2);
yline(0,'k-',linewidth=1);hold on;

plot(tn,as,Color=[0 0.4470 0.7410]);hold on;
plot(tn,ds,Color=[0.8500 0.3250 0.0980]);hold on;
plot(tn,d2s,Color=[0.9290 0.6940 0.1250]);hold on;
plot(tn,Gs,Color=[0.4940 0.1840 0.5560]);hold on;
plot(tn,ks,Color=[0.4660 0.6740 0.1880]);hold on;
plot(tn,ps,Color=[0.3010 0.7450 0.9330]);grid on; 
plot(tn,Hs,Color=[0.6350 0.0780 0.1840]);grid on;
datetick('x','mmm');ylabel('\Delta slack biovolume (cm^3/m^3)');
ylim([-20 20]);xlim([737844 738670]); 
    fontname(gcf,"Times New Roman");
    
%% Figure 17
for i=[2 3 5 6 7 8 9 10 11 12]           
    m=num2str(i); if i<10,m=['0',num2str(i)];end 
    file=strcat('2020',m,'_int_IFCB.mat');  
    load(file);
    M=table2cell(data);
    c=cell2mat(M(:,1));
    x(i,:)=sum(c);
end
y=sum(x);z1=y.*3.6; % cell # per 3.6ml converted to cell #
for i=[1 2 3 4 6 7 8 9 10 11 12]          
    m=num2str(i); if i<10,m=['0',num2str(i)];end 
    file=strcat('2021',m,'_int_IFCB.mat'); 
    load(file);
    M=table2cell(data);
    c=cell2mat(M(:,1));
    a(i,:)=sum(c);
end
b=sum(a);z2=b.*3.6; % cell # per 3.6ml converted to cell #
for i=1:5          
    m=num2str(i); if i<10,m=['0',num2str(i)];end 
    file=strcat('2022',m,'_int_IFCB.mat'); 
    load(file);
    M=table2cell(data);
    c=cell2mat(M(:,1));
    d(i,:)=sum(c);
end
e=sum(d);z3=e.*3.6; % cell # per 3.6ml converted to cell #
all=z1+z2+z3;t=all.';
load('Headers.mat');
diatoms=[4 5 7 11 13 15 16 17 18 19 25 26 27 33 34 35 37 42 44 45 49 50 53 57 64 67 69 70 73 74 94];
diax=Headers(1,diatoms);diax=categorical(diax);
diay=all(1,diatoms);
figure(8)
bar(diax,diay/1000000,'k');ylabel('Number of images (millions)');fontname(gcf,"Times New Roman");

%% Figure 18
clearvars
diatoms=[4 5 7 11 13 15 16 17 18 19 25 26 27 33 34 35 37 42 44 45 49 50 53 57 64 67 69 70 73 74 94];
dinos=[1 2 3 8 9 10 23 24 32 36 38 39 40 46 47 52 58 59 60 61 62 63 68 78];
load mt.mat
c=mt.images_ml;
load('biovolume.mat');b=c.*bvol(1,:)/10000/10000/10000*1000000;
t=datenum(mt.timestamp);
d=b(:,dinos);q=d.'; w=sum(q); din=w.';
D=b(:,diatoms);a=D.'; r=sum(a); dia=r.';

figure(826)
plot(t,dia,'b',LineWidth=2);hold on;
plot(t,din,'k',LineWidth=2);
ylabel('Biovolume (cm^3/m^3)');
legend('Diatoms','Dinoflagellates','Location','best');
xlim([737945 738012]); 
ylim([0 150]);
datetick('x','mm/dd/yy','keeplimits');grid on;
fontname(gcf,"Times New Roman");
 
figure(827)
plot(t,dia,'b',LineWidth=2);hold on;
plot(t,din,'k',LineWidth=2);
ylabel('Biovolume (cm^3/m^3)');
legend('Diatoms','Dinoflagellates','Location','best');
xlim([737867 737881]);
ylim([0 30]);
datetick('x','mm/dd/yy','keeplimits');grid on;
fontname(gcf,"Times New Roman");
xticks(737866:1:737881);
%% Figure 20
clearvars
load transect_HS.mat
d=tran(:,1);h=tran(:,2);sz=size(h);z=zeros(sz);
figure(1);plot(d,h,'k--');ylabel('Depth (m)');xlabel('Distance (km)');hold on;

fit2=polyfit(d,h,5);
x1=0:0.1:21;sz=size(x1);z1=zeros(sz);
y1=polyval(fit2,x1);
plot(x1,y1,'k',LineWidth=2);
fontname(gcf,"Times New Roman");xlim([0 22]);ylim([-45 4]);grid on;xticks(0:1:21);

