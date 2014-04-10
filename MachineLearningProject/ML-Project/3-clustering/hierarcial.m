function clusters = hierarcial(similarityMatrix, condition)
 
% basic simple link example A = [inf, 2, 5,7 ,12; 2, inf, 3, 5, 10; 5,3, inf, 2, 7; 7, 5, 2, inf,5; 12,10,7,5,inf ]

% basic movieSet  set =[1,2,7,12,98,97,96,95,94,121,144,174,226,176,183,222,227,228,229,230]
% another movieSet set = [1, 8, 21, 35, 71, 95, 98, 183, 185, 187, 168, 208
% 432, 227,228,229,230, 176]
% [ratings items userids itemids] = loadmovielens();
% distances = createMovieDistances(set,items,ratings)
% clusters = hierarcial(distances,0)
% names =  setToNames(set, items, clusters)


%oletuksena käytetään single linkkia, ja jos on nolla, niin käytetään
%complete linkkiä
if ~exist('condition')
    condition = 1;
end

clusters = zeros(length(similarityMatrix),3);


%luupataan kunnes kaikki alkiot ovat inf
endCondition =0 ;
i=1;

while (endCondition ==0) 
        
        %etsii pienimmän arvon indeksit similarityMatrixista
        [x,y, endCondition] = findSmallest(similarityMatrix);
        if (endCondition == 1) 
            break;
        end
        %yhdistetyt alkiot
        clusters(i,1)=x;
        clusters(i,2)=y;
        clusters(i,3)= similarityMatrix(x,y);
        
        %mikä on luodun clusterin lähin alkio.
        
        if (condition == 1)
            similarityMatrix = updateSingleLink(similarityMatrix, x, y);
        else
            similarityMatrix = updateCompleteLink(similarityMatrix, x, y);
        end
        
        i=i+1;
    
end

%nyt on muodostettu lista missä järjestyksessä klusterit muodostuvat,
%enää pitää tehdä niistä järkevät kokonaisuudet

%formed = formClusters(clusters);




end


%etsii pienimmän alkion indeksit. jos kaikki alkiot ovat inf, niin
%palauttaa end condition ja lopetetaan
function [x,y, endCondition] = findSmallest(A)

x=0;
y=0;
biggest= 0;
endCondition = 0;

for i=1:length(A)
    
for j=1:length(A)
    
    if (A(i,j)>biggest)
        biggest = A(i,j);
        x=i;
        y=j;
    end
    
end


    
    
end

if (biggest == 0)
    endCondition = 1;
end


end

%päivittää etäisyystaulukkoa
function similarityMatrix = updateSingleLink(similarityMatrix, x, y)
   koko = length(similarityMatrix)+1;

    %funtion similarityMatrix createCluster(similarityMatrix, sizeOfMatrix) luo uusi klusteri
    similarityMatrix(koko,:) = 0;
    similarityMatrix(:,koko) = 0;
    
    %anna uudelle klusterille ensin etäisyysarvoiksi x:n arvot
    similarityMatrix(koko,:) = similarityMatrix(x,:);
    
    %vertaile sen jälkeen y:n arvoihin ja jos y:n arvot voittavat niin
    %korvaa niillä.
    row = similarityMatrix(y,:);
    for i=1:length(row)
        if (similarityMatrix(koko,i) >row(i))
            similarityMatrix(koko,i) = row(i);
        end
    end
    similarityMatrix(:,koko) = similarityMatrix(koko,:);
    
    %nollataan molemmat rivit
    similarityMatrix(x,:) = 0;
    similarityMatrix(:,x) = 0;
    similarityMatrix(:,y) = 0;
    similarityMatrix(y,:) = 0;
    
end


function similarityMatrix = updateCompleteLink(similarityMatrix, x, y)
   koko = length(similarityMatrix)+1;

    %funtion similarityMatrix createCluster(similarityMatrix, sizeOfMatrix) luo uusi klusteri
    similarityMatrix(koko,:) = 0;
    similarityMatrix(:,koko) = 0;
    
    %anna uudelle klusterille ensin etäisyysarvoiksi x:n arvot
    similarityMatrix(koko,:) = similarityMatrix(x,:);
    
    %vertaile sen jälkeen y:n arvoihin ja jos y:n arvot voittavat niin
    %korvaa niillä.
    row = similarityMatrix(y,:);
    for i=1:length(row)
        if (similarityMatrix(koko,i) < row(i))
            similarityMatrix(koko,i) = row(i);
        end
    end
    similarityMatrix(:,koko) = similarityMatrix(koko,:);
    
    %nollataan molemmat rivit
    similarityMatrix(x,:) = 0;
    similarityMatrix(:,x) = 0;
    similarityMatrix(:,y) = 0;
    similarityMatrix(y,:) = 0;
    
end





%Roskaa!!!

%etsitään se alkio joka on lähimpänä luotua klusteria.. turha funktio
function similarityMatrix = findClosestPointGivenPoint(x,y, similarityMatrix)
     koko = length(similarityMatrix)+1;
     
    row = similarityMatrix(x,:);
    column = similarityMatrix(:,y);
    
    [j, pieninSamallaRivilla] = min(row);
    [k, pieninSamallaSarakkeella] = min(column);
    
    similarityMatrix(koko,:) =inf;
    similarityMatrix(:,koko) = inf;
    similarityMatrix(x,:) = inf;
    similarityMatrix(:,x) = inf;
    similarityMatrix(:,y) = inf;
    similarityMatrix(y,:) = inf;
    
    
    if (j<k)%x:n kanssa samalla rivillä ollut alkio on pienempi
        similarityMatrix(koko, pieninSamallaSarakkeella) = j;
         similarityMatrix(pieninSamallaRivilla, koko) = j;
         similarityMatrix(pieninSamallaRivilla, x) = inf;
         similarityMatrix(x, pieninSamallaRivilla) = inf;
         
    else %x:n kanssa samalla sarakkeella ollut alkio on pienin.
        similarityMatrix(koko, pieninSamallaSarakkeella) = k;
         similarityMatrix(pieninSamallaRivilla, koko) = k;
         
         similarityMatrix(pieninSamallaSarakkeella, y) = inf;
         similarityMatrix(y, pieninSamallaSarakkeella) = inf;
         
    end
    
end


function formed = formClusters(clusters)
formed = clusters(1,:); %oletetaan että clusters ei ole tyhjä

for i=2:length(clusters)
    %haetaan yhdistetyt alkiot
    a= clusters(i,1);
    b = clusters(i,2);
    
    %jos a tai b on jo jossakin clusteriss, joka on luotu, niin yhdistetään
    %toinen alkio olemassaolevaan
    [x,y] =find(formed == a);
    formed(x,:) = formed(x,:)
    
    
end





end
