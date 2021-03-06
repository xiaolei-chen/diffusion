%% Random Walk in 2 Dimensions with Histogram Output
% Authors: 
% Philip Thomas, github.com/philipithomas
% Mohammad Hashim, github.com/mohashim
%
% Simulates a 2-dimensional random walk with a variable number of steps.
% Data is displayed as a 2-D histogram. There is a fixed equal probability 
% of a step in each direction. 
%
% * Dimensions: 2
% * Step Probability: Fixed
% * Visualization: Histogram
% * Data Output: randomwalk2d.asv

% It is based on a Wikipedia description of a 2D random walk, which
% describes a 'drunk' in a city who approaches 4-way intersections, and
% must select which direction to go. Each choice is independent, and of
% equal probability.

%% initialize
clear
clf
clc

disp('<th><th>Trials</th><th>Steps</th><th>Average of trials</th><th>Standard Dev</th></tr>');
%% Change these variables
% Probability: Equal for all 4 directions

%Number of steps
steps =1000;

%Number of trials
trials=1000;

%% Dont' change below here for general trials

% Make a large matrix with columns of each trial and rows representing
% steps within a trial
% The third dimension is of size '2' to represent a 2-dimensional random
% walk, i.e. x and y coordinates.

% The 'zeros' function is used for effiency - the matrix is initialized as
% blank, then the program iteratively inputs a choice for the random
% walker.

M = zeros(steps,trials,2);

% We then loop through each trial and determine which direction the random
% walker proceeds. The choices, positive x, negative x, positive y, and
% negative y, simulate a 4-way intersection and are of equal probability. 

for i=1:steps
    for j=1:trials
        % Generate a random number for the trial, from 0 to 1
        trial=rand();
        if trial <.25
            %left
            M(i,j,1)=-1;
        elseif trial<.5
            %right
            M(i,j,1)=1;

        elseif trial<.75
            %forward
            M(i,j,2)=-1;
        else
            %backward
            M(i,j,2)=1;
        end
            
    end
end
% Summing across the first dimension, we get the cumulative displacement of
% a single random walk of the number of steps specified:
Results= sum(M,1);

x= mean(Results(1,:,1));
y= mean(Results(1,:,2));
r= sqrt(x^2 + y^2)
s= std(r)

%% Plot results
% Display the results as a histogram:
%hist2d(Results(:,:,1)',Results(:,:,2)')
%title(strcat('Random walk in 2 d with ',num2str(trials),' trials and ',num2str(steps),' steps') );
%xlabel('X displacement')
%ylabel('Y displacement')
%zlabel('Trials')

%% Display results

disp('</td><td>')
disp(num2str(trials))
disp('</td><td>')
disp(num2str(steps))
disp('</td><td>')
disp(num2str(mean(Results)))
disp('</td><td>')
disp(num2str(std(Results)))
disp('</td></tr>')
disp('')
