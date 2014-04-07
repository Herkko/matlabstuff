function Erittelija = perceptron(dataset, classes)
%dataset, kertoo datapisteet, classes = kertoo mitkä on oikeat luokat
%ajaa niin että ensin luot datasetin esim 
% Esimerkki dataset = [-1 3; 5 5; -2 -2; -1 -1];
% esimerkki classes = [-1; 1; -1; -1];

Erittelija =transpose(dataset(1,:));
iteraatioidenMaara=10;



n = (length(dataset(:,1)-1));

for i=1:iteraatioidenMaara

    update=0;
    
    for j=1:n
      
     vector1= dataset(j,:);
     arvo = sign(vector1*Erittelija);   
      %arvo = sign(dataset(:,j)*Erittelija);  
        if arvo ~= classes(j) %jos eivät ole samoja
           
            difference= transpose(classes(j)*dataset(j,:));
            
            %Erittelija = Erittelija +transpose(classes(j)*dataset(:,j));
            Erittelija = Erittelija + difference;
            %disp(Erittelija);
            update = 1;
                   
        end
      
    end
    
    if update ==0
        %disp(Erittelija);
        break;
    end
    
end
disp(i);

visualize(dataset, Erittelija)

end


function visualize(dataset, classifier)


disp(classifier);
%disp(transpose(classifier));
     x= dataset(:,1);
     y= dataset(:,2);
    
    perp = [0,-1;1,0];
    classifier = perp*classifier; 
    
    linex(1,1) = (5*classifier(1,1));
    linex(1,2) = (-5*classifier(1,1));
    
    liney(1,1) = (5*classifier(2,1));
    liney(1,2) = (-5*classifier(2,1));
    
    
     scatter(x,y,'fill');grid on
   
     
     
     line(linex,liney,...
          'linewidth',2,...
          'color',[1,0,0]);
     set(gca,...
          'xlim',[-10,10],...
          'ylim',[-10,10]);
     axis square;





end







