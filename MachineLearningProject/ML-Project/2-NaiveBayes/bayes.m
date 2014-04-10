function [classifier, trainingSet, testSet]  = bayes(words, documents, newsgroups)

%etsi testisetti kaikista dokumenteista. 
%muodosta taulukko, johon kuuluu:  newsgroup | alku | loppu
%tarvittava data on taulukosa y
% [Xs y voc groups] = loadnews();
% kutsu on [classifier, trainingSet, testSet] = bayes(voc, Xs, y);


%creates trainingSet (90% of documents per newsgroup belongs to
%trainingSet)
[trainingSet, testSet] = calcTrainingSet(newsgroups);

%käydään dokumentit testisetin ekasta newsgroupista läpi ja katsotaan mitkä
%sanat löytyvät sieltä. Jokainen sana siis käydään läpi ja katsotaan
%löytyykö ko. alueelta.

classifier = zeros(53976, 20);

k=1; % juokseva listan numero
l=1; %juokseva dokumentin numero

for i=1:20
    
    startpoint = trainingSet(i,1);
    endpoint = trainingSet(i,2);
   
   %kelataan aina jokaisella kierroksella indeksi k sopivaan paikkaan,
   %jottei käydä läpi kaikkia dokumentteja
    cond = documents(k,1);
    while cond<startpoint
        k=k+1;
        cond = documents(k,1);
    end
    
    
    while l<endpoint
        wordnumber = documents(k,2);
        classifier(wordnumber,i) = (classifier(wordnumber,i)+1);
        l=documents(k,1);
        k=k+1;
    end

    for j=1:53976
    divider = (endpoint-startpoint)+2;   
    classifier(j,i) = (classifier(j,i)+1)/divider;
    
    end

end

%disp(trainingSet);

%save classifier.mat classifier;
sanityCheck(classifier, words);

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


function sanityCheck(classifier, words)

for i=1:20;
    
    column = classifier(i,:);
    column(:,2) = (1:length(classifier));
    set = sortrows(column, 1)
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
