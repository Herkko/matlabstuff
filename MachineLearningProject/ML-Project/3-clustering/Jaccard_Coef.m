function [Jaccard] = Jaccard_Coef(movie1,movie2,ratings,items,output)

  % if the variable output does not exist, we set it to 1, which means that
  % we will then output the information for which two movies we calculate the
  % Jaccard Coefficient. If it is 0, we do not output such information
  if ~exist('output')
    output = 1;
  end

  if (output)
    temp = items(movie1);
    fprintf('Movie 1: %s\n', temp{1});
    temp = items(movie2);
    fprintf('Movie 2: %s\n', temp{1});
  end

  % Calculation of Jaccard Coefficient:

  vote1 = ratings(:,2)==movie1; % 1 if voted for movie 1, 0 otherwise
  users1 = ratings(vote1,1); % users who have rated movie 1

  vote2 = ratings(:,2)==movie2; % 1 if voted for movie 2, 0 otherwise
  users2 = ratings(vote2,1); % users who have rated movie 2

  users12 = intersect(users1,users2); % users who have rated both movies
  
  Jaccard = length(users12)/(length(users1)+length(users2)-length(users12));
  % in denominator: users who have seen first movie + users who have seen
  %                 second movie - users who have seen both (since counted
  %                 twice (once in first and once in second part of sum)