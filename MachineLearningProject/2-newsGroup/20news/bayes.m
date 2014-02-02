function classifier = bayes(words, documents, newsgroups)

%etsi testisetti kaikista dokumenteista. 
%muodosta taulukko, johon kuuluu:  newsgroup | alku | loppu
%tarvittava data on taulukosa y
% kutsu on bayes(voc, xs, y);


%creates trainingSet (90% of documents per newsgroup belongs to
%trainingSet)
trainingSet = calcTrainingSet(newsgroups);

%käydään dokumentit testisetin ekasta newsgroupista läpi ja katsotaan mitkä
%sanat löytyvät sieltä. Jokainen sana siis käydään läpi ja katsotaan
%löytyykö ko. alueelta.

vocOccuranceInGroup = [1,1];
l = 1;


%%Tätä pitää parantaa nopeammaksi, niin että käy listan vain kertaalleen
%%läpi ja summaa listaan esiintymistiheydet dokumenteissa.
for y=1:5
    startpoint = trainingSet(y,1);
    endpoint = trainingSet(y,2);
    
    for k = 1:10

        occurances = findOccurances(k, documents, startpoint, endpoint);
        vocOccuranceInGroup(l,1) = y;
        vocOccuranceInGroup(l,2) = k;
        vocOccuranceInGroup(l,3) = occurances;
        vocOccuranceInGroup(l,4) = ((occurances+1)/((endpoint-startpoint)+2));
        l = l+1;
    end

end




disp(trainingSet);
classifier = vocOccuranceInGroup;
save classifier.mat classifier;


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
        
        find(vocOccurancy(2
        
        
        
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



function set = calcTrainingSet(newsgroups)

set= [1,1];
groupId = 1;
for i = 1:length(newsgroups)-1;
    if groupId ~= newsgroups(i)
        set(groupId,2) = set(groupId,1)+(floor((i-set(groupId,1))*0.9));
        groupId = groupId +1;
        set(groupId,1)= i;
    end
 
end

end
