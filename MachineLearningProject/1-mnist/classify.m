function classify(classifier, data, classes)
error=0;

for i=1:(length(data(:,1)-1));

    vector = data(i,:);
    
    value = sign((vector*classifier));
    classes(i,2) = value;
    
    if(value~=classes(i,1))
        %muodostetaan kolmannelle sarakkeelle kertyneiden virheiden määrä
        classes(i,3) = 1;
        error = error+1;
    end
    
    
    
end



disp(error);




end
