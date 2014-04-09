function names = setToNames(set, items, clusters)

for i=1:length(clusters)-1

    movie1 = clusters(i,1);
    movie2 = clusters(i,2);
    
    if(movie1<length(set))
        name = items(1,set(1,movie1));
        names(i,1) =name;
  
    end
    
    if(movie2<length(set))
         name = items(1,set(1,movie2));
        names(i,2) =name;
   
    end
    
    
    
end





end
