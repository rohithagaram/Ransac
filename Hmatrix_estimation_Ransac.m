%% Taking Photographs
img1 = im2double(rgb2gray(imread(path_to_image1)));
img2 = im2double(rgb2gray(imread(path_to_image2)));

%% Obtaininig Correspondences
points1 = detectSURFFeatures(img1);
points2 = detectSURFFeatures(img2);

features1 = extractFeatures(img1,points1);
features2 = extractFeatures(img2,points2);

indexPairs = matchFeatures(features1,features2,'Unique',true);

matchedPoints1 = points1(indexPairs(:,1));
matchedPoints2 = points2(indexPairs(:,2));

img1_points = matchedPoints1.Location;
img2_points = matchedPoints2.Location;

%% Estimating Homography using RANSAC
H_ransac = estimateTransformRANSAC(img1_points,img2_points)

