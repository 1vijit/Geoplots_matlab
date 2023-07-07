
% Example map: https://goo.gl/maps/M2Nhq3hJnZPPF9Z66
% Extract GPS points and write as JSON file from: https://mapstogpx.com/

%% Reading JSON file and writing to as struct
fileName = 'loadphp.json'; % filename in JSON extension
str = fileread(fileName); % dedicated for reading files as text
data = jsondecode(str); % Using the jsondecode function to parse JSON from string

%% Extracting GPS data from struct
lat = [data.start.lat];
lng = [data.start.lng];

for i=1:1:length(data.points)
    temp_lat = data.points{i, 1}.lat;
    temp_lng = data.points{i, 1}.lng;

    lat = [lat, temp_lat];
    lng = [lng, temp_lng];
end


lat = [lat, data.end.lat];
lng = [lng, data.end.lng];

%% Ploting GPS points
figure(1)
geoplot(lat, lng, "ro-","LineWidth", 2, "MarkerSize",2)
geobasemap streets