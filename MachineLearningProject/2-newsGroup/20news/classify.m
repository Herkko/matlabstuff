function classify(words, documents, testSet, classifier)

%luokitellaan testSetin dokumentit luokkiin ja esitetään confusion
%matriisissa. Matriisin ensimmäinen sarake on dokumentin numero, toinen
%sarake on  arvottu luokka ja kolmannessa on oikea luokka ja neljänness on 
%ykkönen jos luokat olivat eri.

confusionMatrix = zeros(3,1000);

%loop 1 to 20, J on numero joka kertaa confuinmatriisin rivinumeron
j=1;
for i=1:(length(testSet))
    documentId = testSet(i,1);
    
    
    
    while documentId <testSet(i,2)
        
        confusionMatrix(i,1) =documentId; %dokumentin numero
        confusionMatrix(j,2) = classNumber(classifier, documentId, documents) %arvio luokan numeron,
        confusionMatrix(j,3) = i; % oikea luokan numero
        
        %virheen antaminen jos arvottu luokka ja oikea luokka ovat erit
        if (confusionMatrix(j,2) ~=confusionMatrix(j,3))
            confusionMatrix(j,4) = 1;
        end
        documentId = documentId+1;
    end
    
    
end




%tästä eteenpäin vanhaa koodia, joka voidaan ehkä poista

%etsi todennäköisyys että dokumentti kuuluu luokkaan
doc = testSet(1,2);
startpoint=(doc+1);
endpoint = (doc+2);
startInd =find(documents>=startpoint, 1, 'first');
endInd = find(documents>=endpoint, 1, 'first');

    for p=startInd:endInd
        wordId = documents(p,2);
        %sanan numero jolle pitäisi etsiä osamäärät vocOccurancystä
        
        find(classifier(2));
        
        
        
     end




end


function class= classNumber(classifier, documentId, documents)

predictions = zeros(1,20);

%etsi rivi documents taulusta, jossa ensimmäisen rivin numero on
%documentId. luuppaa eteenpäin kunnes näin ei enää ole

i = find(documents(1,:),documentId);


while (documents(1,i) == documentId)
    
    
    
   end
    

    

end



