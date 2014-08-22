>==================================================================
#CodeBook for Course Project 
>==================================================================

##Relevant Information or Notes

Field Width of these Variables are variable up to 18 characters to allow for very small pos/neg numbers 
and larger activity descriptions such as "Walking Downstairs". I did not assume a fixed width format.

Per the README.txt file provided to us in the download, the features are normalized 
and bounded within -1 to 1. Therefore, unless stated else wise, the Range of the variables is set to [-1,1]

Unless stated else wise, Units of measure are normalized frequency ratios rather than Hz since the [-1,1]
bounding makes no sense in terms of Hz.

From our project instructions we were directed to "Extract only the measurements on the mean and 
standard deviation for each measurement." I interpreted this conservatively and thus extracted 86 
measurements. I.e. any variable with mean or std referenced in its name from the original 561. 

My README file will further discuss my approach to this assignment. The rest of this document will
list each of the variables that exist in the final submission file: dcasted.txt

##The Data Dictionary

1.Variable:  subjectids

    Definition:  Subject identifiers
    Units: Integer
    Range:  1 to 30
2.Variable: activities

    Definition: 1-6 physical activities while on the phone
    Units: Character
    Range: Walking, Walking upstairs, Walking Downstairs, Sitting, Standing, Laying
3.Variable: tbodyaccstdx

    Definition: Standard Deviation of body acceleration - x axis
    Range: [-1,1] 
4.Variable: tbodyaccstdy

    Definition: Standard Deviation of body acceleration - y axis
    Range: [-1,1]
5.Variable: tbodyaccstdz

    Definition: Standard Deviation of body acceleration - z axis
    Range: [-1,1]   
6.Variable: tgravityaccstdx

    Definition: Standard Deviation of gravity acceleration - x axis
    Range: [-1,1]
7.Variable: tgravityaccstdy

    Definition: Standard Deviation of gravity acceleration - y axis
    Range: [-1,1]
8.Variable: tgravityaccstdz

    Definition: Standard Deviation of gravity acceleration - z axis
    Range: [-1,1]
9.Variable: tbodyaccjerkstdx

    Definition: Standard Deviation of body acceleration with jerk movements - x axis
    Range: [-1,1]
10.Variable: tbodyaccjerkstdy

    Definition: Standard Deviation of body acceleration with jerk movements - y axis
    Range: [-1,1]   
11.Variable: tbodyaccjerkstdz

    Definition: Standard Deviation of body acceleration with jerk movements - z axis
    Range: [-1,1]
12.Variable: tbodygyrostdx

    Definition: Standard Deviation of gyroscope - x axis	
    Range: [-1,1]
13.Variable: tbodygyrostdy

    Definition: Standard Deviation of gyroscope - y axis	
    Range: [-1,1]
14.Variable: tbodygyrostdz

    Definition: Standard Deviation of gyroscope - z axis	
    Range: [-1,1]
15.Variable: tbodygyrojerkstdx

    Definition: Standard Deviation of gyroscope with jerk movements - x axis	
    Range: [-1,1]   
16.Variable: tbodygyrojerkstdy

    Definition: Standard Deviation of gyroscope with jerk movements - y axis	
    Range: [-1,1]
17.Variable: tbodygyrojerkstdz

    Definition: Standard Deviation of gyroscope with jerk movements - z axis	
    Range: [-1,1]
18.Variable: tbodyaccmagstd

    Definition: Magnitude of the Standard Deviation of body acceleration
    Range: [-1,1]
19.Variable: tgravityaccmagstd

    Definition: Magnitude of the Standard Deviation of gravity acceleration
    Range: [-1,1]
20.Variable: tbodyaccjerkmagstd

    Definition: Magnitude of the Standard Deviation of body acceleration with jerk movements
    Range: [-1,1]   
21.Variable: tbodygyromagstd

    Definition: Magnitude of the Standard Deviation of gyroscope	
    Range: [-1,1]
22.Variable:tbodygyrojerkmagstd	

    Definition: Magnitude of the Standard Deviation of gyroscope with jerk movements
    Range: [-1,1]
23.Variable: fbodyaccstdx

    Definition: Fast Fourier Transform applied to STD of body acceleration - x axis
    Range: [-1,1]   
24.Variable: fbodyaccstdy

    Definition: Fast Fourier Transform applied to STD of body acceleration - y axis
    Range: [-1,1]   
25.Variable: fbodyaccstdz

    Definition: Fast Fourier Transform applied to STD of body acceleration - z axis
    Range: [-1,1]
26.Variable: fbodyaccjerkstdx	

    Definition: Fast Fourier Transform applied to STD of body acceleration with jerk movements - x axis
    Range: [-1,1]
27.Variable: fbodyaccjerkstdy

    Definition: Fast Fourier Transform applied to STD of body acceleration with jerk movements - y axis
    Range: [-1,1]   
28.Variable: fbodyaccjerkstdz

    Definition: Fast Fourier Transform applied to STD of body acceleration with jerk movements - z axis
    Range: [-1,1]
29.Variable: fbodygyrostdx

    Definition: Fast Fourier Transform applied to STD of gyroscope - x axis	
    Range: [-1,1]
30.Variable: fbodygyrostdy

    Definition: Fast Fourier Transform applied to STD of gyroscope - y axis
    Range: [-1,1]   
31.Variable: fbodygyrostdz

    Definition: Fast Fourier Transform applied to STD of gyroscope - z axis
    Range: [-1,1]   
32.Variable: fbodyaccmagstd

    Definition: Fast Fourier Transform applied to Magnitude of STD of body acceleration
    Range: [-1,1]
33.Variable: fbodybodyaccjerkmagstd

    Definition: Fast Fourier Transform applied to Magnitude of STD of body acceleration with jerk movements	
    Range: [-1,1]
34.Variable: fbodybodygyromagstd

    Definition: Fast Fourier Transform applied to Magnitude of STD of gyroscope
    Range: [-1,1]   
35.Variable: fbodybodygyrojerkmagstd

    Definition: Fast Fourier Transform applied to Magnitude of STD of gyroscope with jerk movements
    Range: [-1,1]   
36.Variable: tbodyaccmeanx

    Definition: Mean of body acceleration signal -  along x axis
    Range: [-1,1]
37.Variable: tbodyaccmeany

    Definition: Mean of body acceleration signal -  along y axis	
    Range: [-1,1]
38.Variable: tbodyaccmeanz

    Definition: Mean of body acceleration signal -  along z axis
    Range: [-1,1]   
39.Variable: tgravityaccmeanx

    Definition: Mean of gravity acceleration signal - along x axis
    Range: [-1,1] 
40.Variable: tgravityaccmeany

    Definition: Mean of gravity acceleration signal - along y axis
    Range: [-1,1] 
41.Variable: tgravityaccmeanz

    Definition: Mean of gravity acceleration signal - along z axis
    Range: [-1,1]   
42.Variable: tbodyaccjerkmeanx

    Definition: Mean of body acceleration with jerk movements - x axis
    Range: [-1,1]
43.Variable: tbodyaccjerkmeany

    Definition: Mean of body acceleration with jerk movements - y axis
    Range: [-1,1] 
44.Variable: tbodyaccjerkmeanz

    Definition: Mean of body acceleration with jerk movements - z axis
    Range: [-1,1]   
45.Variable: tbodygyromeanx

    Definition: Mean of gyroscope - x axis
    Range: [-1,1]   
46.Variable: tbodygyromeany

    Definition: Mean of gyroscope - y axis
    Range: [-1,1]
47.Variable: tbodygyromeanz

    Definition: Mean of gyroscope - z axis
    Range: [-1,1]
48.Variable: tbodygyrojerkmeanx

    Definition: Mean of gyroscope with jerk movements - x axis
    Range: [-1,1]   
49.Variable: tbodygyrojerkmeany

    Definition: Mean of gyroscope with jerk movements - y axis
    Range: [-1,1]   
50.Variable: tbodygyrojerkmeanz

    Definition: Mean of gyroscope with jerk movements - z axis
    Range: [-1,1] 
51.Variable: tbodyaccmagmean

    Definition: Magnitude of the Mean of body acceleration
    Range: [-1,1]
52.Variable: tgravityaccmagmean	

    Definition: Magnitude of the Mean of gravity acceleration
    Range: [-1,1]
53.Variable: tbodyaccjerkmagmean

    Definition: Magnitude of the Mean of body acceleration with jerk movements
    Range: [-1,1]   
54.Variable: tbodygyromagmean

    Definition: Magnitude of the Mean of gyroscope
    Range: [-1,1]   
55.Variable: tbodygyrojerkmagmean

    Definition: Magnitude of the Mean of gyroscope with jerk movements 
    Range: [-1,1]
56.Variable: fbodyaccmeanx

    Definition: Fast Fourier Transform applied to Mean of body acceleration - x axis
    Range: [-1,1]
57.Variable: fbodyaccmeany

    Definition: Fast Fourier Transform applied to Mean of body acceleration - y axis
    Range: [-1,1]   
58.Variable: fbodyaccmeanz

    Definition: Fast Fourier Transform applied to Mean of body acceleration - z axis
    Range: [-1,1]
59.Variable: fbodyaccmeanfreqx

    Definition: Fast Fourier Transform applied to Mean frequency of body acceleration - x axis
    Range: [-1,1]
60.Variable: fbodyaccmeanfreqy

    Definition: Fast Fourier Transform applied to Mean frequency of body acceleration - y axis
    Range: [-1,1]   
61.Variable: fbodyaccmeanfreqz

    Definition: Fast Fourier Transform applied to Mean frequency of body acceleration - z axis
    Range: [-1,1]
62.Variable: fbodyaccjerkmeanx	

    Definition: Fast Fourier Transform applied to Mean of body acceleration with jerk movements - x axis
    Range: [-1,1]
63.Variable: fbodyaccjerkmeany

    Definition: Fast Fourier Transform applied to Mean of body acceleration with jerk movements - y axis
    Range: [-1,1]   
64.Variable: fbodyaccjerkmeanz

    Definition: Fast Fourier Transform applied to Mean of body acceleration with jerk movements - z axis
    Range: [-1,1]   
65.Variable: fbodyaccjerkmeanfreqx

    Definition: Fast Fourier Transform applied to Mean Frequency of body acceleration with jerk movements - x axis
    Range: [-1,1]
66.Variable: fbodyaccjerkmeanfreqy

    Definition: Fast Fourier Transform applied to Mean Frequency of body acceleration with jerk movements - y axis
    Range: [-1,1]
67.Variable: fbodyaccjerkmeanfreqz

    Definition: Fast Fourier Transform applied to Mean Frequency of body acceleration with jerk movements - z axis
    Range: [-1,1]   
68.Variable: fbodygyromeanx

    Definition: Fast Fourier Transform applied to Mean of gyroscope - x axis
    Range: [-1,1]
69.Variable: fbodygyromeany

    Definition: Fast Fourier Transform applied to Mean of gyroscope - y axis
    Range: [-1,1]
70.Variable: fbodygyromeanz

    Definition: Fast Fourier Transform applied to Mean of gyroscope - z axis	
    Range: [-1,1]   
71.Variable: fbodygyromeanfreqx	

    Definition: Fast Fourier Transform applied to Mean Frequency of gyroscope - x axis
    Range: [-1,1]
72.Variable: fbodygyromeanfreqy	 	

    Definition: Fast Fourier Transform applied to Mean Frequency of gyroscope - y axis
    Range: [-1,1]
73.Variable: fbodygyromeanfreqz

    Definition: Fast Fourier Transform applied to Mean Frequency of gyroscope - z axis
    Range: [-1,1]   
74.Variable: fbodyaccmagmean

    Definition: Fast Fourier Transform applied to Magnitude of Mean of body acceleration
    Range: [-1,1]   
75.Variable: fbodyaccmagmeanfreq

    Definition: Fast Fourier Transform applied to Magnitude of Mean Frequency of body acceleration
    Range: [-1,1]
76.Variable: fbodybodyaccjerkmagmean

    Definition: Fast Fourier Transform applied to Magnitude of Mean of body acceleration with jerk movements 
    Range: [-1,1]
77.Variable: fbodybodyaccjerkmagmeanfreq	

    Definition: Fast Fourier Transform applied to Magnitude of Mean Frequency of body acceleration with jerk movements
    Range: [-1,1]   
78.Variable: fbodybodygyromagmean

    Definition: Fast Fourier Transform applied to Magnitude of Mean of gyroscope
    Range: [-1,1]
79.Variable: fbodybodygyromagmeanfreq	

    Definition: Fast Fourier Transform applied to Magnitude of Mean Frequency of gyroscope	
    Range: [-1,1]
80.Variable: fbodybodygyrojerkmagmean

    Definition: Fast Fourier Transform applied to Magnitude of Mean of gyroscope with jerk movements
    Range: [-1,1]   
81.Variable: fbodybodygyrojerkmagmeanfreq

    Definition: Fast Fourier Transform applied to Magnitude of Mean Frequency of gyroscope with jerk movements
    Range: [-1,1]
82.Variable: angletbodyaccmeangravity	

    Definition: Angle of Mean of body acceleration signal  vs gravity	
    Range: [-1,1]
83.Variable: angletbodyaccjerkmeangravitymean

    Definition: Angle of Mean of body acceleration with jerk movements  vs gravity Mean
    Range: [-1,1]   
84.Variable: angletbodygyromeangravitymean

    Definition: Angle of Mean of gyroscope vs gravity Mean 
    Range: [-1,1]   
85.Variable: angletbodygyrojerkmeangravitymean

    Definition: Angle of Mean of gyroscope with jerk movements vs gravity Mean
    Range: [-1,1]
86.Variable: anglexgravitymean

    Definition: Angle of gravity vs Mean - x axis 
    Range: [-1,1]
87.Variable:angleygravitymean

    Definition: Angle of gravity vs Mean - y axis
    Range: [-1,1]   
88.Variable: anglezgravitymean

    Definition: Angle of gravity vs Mean - z axis 
    Range: [-1,1]


