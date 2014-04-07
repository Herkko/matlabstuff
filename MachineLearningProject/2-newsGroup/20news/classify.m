function confusionMatrix = classify(words, documents, testSet, classifier)

%luokitellaan testSetin dokumentit luokkiin ja esitetään confusion
%matriisissa. Matriisin ensimmäinen sarake on dokumentin numero, toinen
%sarake on  arvottu luokka ja kolmannessa on oikea luokka ja neljänness on 
%ykkönen jos luokat olivat eri.

%kutsu on conf = classify(voc, Xs, testSet, classifier)

confusionMatrix = zeros(1000,3);

%loop 1 to 20, J on numero joka kertaa confuinmatriisin rivinumeron
j=1;
for i=1:(length(testSet))
    documentId = testSet(i,1);
    
    
    
    while documentId <testSet(i,2)
        
        confusionMatrix(j,1) =documentId; %dokumentin numero
        confusionMatrix(j,2) = classNumber(classifier, documentId, documents); %arvio luokan numeron,
        confusionMatrix(j,3) = i; % oikea luokan numero
        
        %virheen antaminen jos arvottu luokka ja oikea luokka ovat erit
        if (confusionMatrix(j,2) ~=confusionMatrix(j,3));
            confusionMatrix(j,4) = 1;
        end
        documentId = documentId+1;
        j = j+1;
   end
    
    
end




end


function class= classNumber(classifier, documentId, documents)



%etsi rivi documents taulusta, jossa ensimmäisen rivin numero on
%documentId. luuppaa eteenpäin kunnes näin ei enää ole


i = find(documents>=documentId, 1, 'first');
wordId = documents(i,2);
predictions = classifier(wordId,:);
k=1;

while (documents(i,1) == documentId)
    
    wordId = documents(i,2);
    %lasketaan yhteen kaikki todennäköisyydet
    for j=1:20
        
        predictions(k,j) = (classifier(wordId,j)) ;% otetaan jokaiselle riville tn 
        
    end
    k=k+1;
    i= i+1;
    
end
    
%kaikki on otettu allekkain jonka jälkeen voidaan laskea ne yhteen ja jakaa
%sopivalla yhteenslasketulla termillä

    predictionSums = sum(predictions);
    predictionSums = predictionSums/sum(predictionSums);
    






[am,mx]=max(predictionSums);
class = mx;    

end



