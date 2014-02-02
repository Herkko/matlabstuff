function perceptron(dataset, classes)
Erittelija = [2,1];
iteraatioidenMaara=10;

n = length(dataset);

for i=1:iteraatioidenMaara

    update=0;
    for j=1:n
     
      
      arvo = sign(dataset(:,j)*Erittelija);  
        if arvo ~= classes(j) %jos eivät ole samoja
            Erittelija = Erittelija +transpose(classes(j)*dataset(:,j));
            disp(Erittelija);
            update = 1;
                   
        end
        
    end
    
    if update ==0
        %disp(Erittelija);
        break;
    end
    
end

disp(i);
disp(Erittelija);




end







