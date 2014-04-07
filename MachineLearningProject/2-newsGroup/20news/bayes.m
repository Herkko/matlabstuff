function [classifier, trainingSet, testSet]  = bayes(words, documents, newsgroups)

%etsi testisetti kaikista dokumenteista. 
%muodosta taulukko, johon kuuluu:  newsgroup | alku | loppu
%tarvittava data on taulukosa y
% kutsu on bayes(voc, xs, y);


%creates trainingSet (90% of documents per newsgroup belongs to
%trainingSet)
[trainingSet, testSet] = calcTrainingSet(newsgroups);

%käydään dokumentit testisetin ekasta newsgroupista läpi ja katsotaan mitkä
%sanat löytyvät sieltä. Jokainen sana siis käydään läpi ja katsotaan
%löytyykö ko. alueelta.

vocOccurances = zeros(53976, 20);
l = 1;


%%Tätä pitää parantaa nopeammaksi, niin että käy listan vain kertaalleen
%%läpi ja summaa listaan esiintymistiheydet dokumenteissa.

%niin kauan kuin ollaan startpointin ja endpointin välissä, niin mennään
%eteenpäin ja pistetään voc occuranceen lisää tavaraa

k=1; % juokseva listan numero
l=1; %juokseva dokumentin numero

for y=1:20
    startpoint = trainingSet(y,1);
    endpoint = trainingSet(y,2);
   
    %l pitää saada nostettua startpointtiin jokaisessa välissä
    ehto = documents(k,1);
    while ehto<startpoint
        k=k+1;
        ehto = documents(k,1);
    end
    
    
    while l<endpoint
        wordnumber = documents(k,2);
        vocOccurances(wordnumber,y) = (vocOccurances(wordnumber,y)+1);
        l=documents(k,1);
        k=k+1;
    end

    for i=1:53976
    vocOccurances(i,y) = (vocOccurances(i,y)+1)/((endpoint-startpoint)+2);
    
    end

end

%disp(trainingSet);
classifier = vocOccurances;
%save classifier.mat classifier;


end

function classify(words, documents, trainingSet, vocOccurancy)
%tries to classify some documents to groups.

%etsi todennäköisyys että dokumentti kuuluu luokkaan
doc = trainingSet(1,2);
startpoint=(doc+1);
endpoint = (doc+2);
startInd =find(documents>=startpoint, 1, 'first');
endInd = find(documents>=endpoint, 1, 'first');

    for p=startInd:endInd
        wordId = documents(p,2);
        %sanan numero jolle pitäisi etsiä osamäärät vocOccurancystä
        
        find(vocOccurancy(2));
        
        
        
     end




end




function occurances = findOccurances(word, documents, startpoint, endpoint)
occurances = 0;


startInd =find(documents>=startpoint, 1, 'first');
endInd = find(documents>=endpoint, 1, 'first');

for j = startInd:endInd;

    if documents(j,2) == word
        occurances=occurances+1;
    end
    

end


end



function [trainingSet, testSet] = calcTrainingSet(newsgroups)
%Luodaan test ja trainingsetit, niin että 90% dokumenteista kuuluu
%trainingSettiin ja 10% testSettiin. Molemmissa seteissä on numero
trainingSet= zeros(20,2);
testSet = zeros(20,2);

groupId = 1;
vikaArvo = 1;
for i = 1:length(newsgroups);
    if ((groupId ~= newsgroups(i)) || i==(length(newsgroups))) 
        trainingSet(groupId,2) = trainingSet(groupId,1)+(floor((i-trainingSet(groupId,1))*0.9));
        testSet(groupId,1) = (trainingSet(groupId,2)+1);
        testSet(groupId,2)=(i-1);
        groupId = groupId +1;
        trainingSet(groupId,1)= i;
    end

end



end
