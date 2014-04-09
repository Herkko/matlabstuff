function movieDistances = createMovieDistances(set, items, ratings)
movieDistances = zeros(length(set),length(set));

%laskee elokuvien etäisyydet toisiinsa
for i=1:length(set)
    
    for j= 1:length(set)
        
        distance = Jaccard_Coef(set(i), set(j),ratings,items,0);
        movieDistances(i,j) = distance;
        movieDistances(j,i) = distance;
        if (i==j)
          movieDistances(j,i) = 0;   
        end
        
    end
    
    
    
    
end




end
