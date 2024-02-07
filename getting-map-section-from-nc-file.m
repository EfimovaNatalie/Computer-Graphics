close all hidden
clear all
ncfile = 'map.nc';
load coastlines;
%ncdisp(ncfile);
data_lat = ncread(ncfile,'lat');
data_lon = (ncread(ncfile,'lon'));
data = ncread(ncfile, 'data');
%data_long = wrapTo180(data_lon);
%disp(data_lon);
%disp(data_lat);
blob = (data(:, :, 1));
%disp(size(data(:, :, 1)));
lat_from = 1;
lat_to = 64;
lon_from = 1;
lon_to = 80;
figure
worldmap([-90 90], [-180 180])
%geoshow()
%data(1:50, 1:50, 1) = NaN;
%figure
%geoshow(data(:, :, 1),[1,90,0],'DisplayType', 'surface');
%geoshow(coastlat, coastlon);
%disp(blob(:, :, 1));
lat = [lat_from lat_to];
lon = [lon_from lon_to];
%blob = ncread(ncfile, 'data',[lat_from lon_from 1],[lat_to lon_to 1])
%blob = data(80:1, 64:1, 1);
%figure
%imagesc(blob(:, :, 1));
%worldmap(lat, lon);
%geoshow(blob(:, :, 1),[1,90,0],'DisplayType', 'texturemap');
%geoshow(coastlat, coastlon);

%blob_2 = blob(:, lon_from:lon_to);
%figure
%imagesc(blob_2)
%geoshow(coastlat, coastlon);
figure
worldmap(lat, lon);
%disp(data)
geoshow(data(:, :, 1),[1,90,0],'DisplayType', 'texturemap');
geoshow(coastlat, coastlon);