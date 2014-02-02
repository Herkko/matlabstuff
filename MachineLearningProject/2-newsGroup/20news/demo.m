function demo( Xs, y, voc, groups, task )
% demo - examples of how to work with the 20 newsgroups data
%
% Before calling this function, call loadnews():
% [Xs y voc groups] = loadnews();
%
    
% general statistics of the dataset
if task==0,    
    fprintf(1,'Number of groups: %d\n',length(groups));
    fprintf(1,'Number of words: %d\n',length(voc));
    fprintf(1,'Number of documents: %d\n',max(Xs(:,1)));
    fprintf(1,'Number of word-doc pairs: %d\n',size(Xs,1));
    fprintf(1,'Density: %.5f\n',1467345/(11269*53975));   
end

% show the groups
if task==1,    
    fprintf(1,'Labels:\n');
    for i=1:20,
	fprintf(1,'%d: %s \n',i,groups{i});
    end
end

% show the vocabulary (just the beginning and the end)
if task==2,    
    fprintf(1,'Vocabulary:\n');
    for i=1:10,
	fprintf(1,'%d: %s \n',i,voc{i});
    end
    fprintf(1,'...\n');
    for i=53966:53975,
	fprintf(1,'%d: %s \n',i,voc{i});
    end
end

% find the index of a given word
if task==3,    
    wordID = findterm( 'gretzky', voc )
    voc{wordID}
end

% show the distribution of labels for documents containing a given term
if task==4,    
    wordID = findterm( 'god', voc );
    docIDs = Xs( (Xs(:,2)==wordID), 1 );
    labels = y(docIDs);
    hits = zeros(1,20);
    for i=1:length(labels),
	hits(labels(i)) = hits(labels(i))+1;
    end
    for i=1:20,
	fprintf(1,'%d (%s) \n',hits(i),groups{i});
    end
    
end

% take a random document from a given newsgroup, and show all the words
% in that document, in order of decreasing frequency
if task==5,
    thegroup = 11; % rec.sport.hockey
    docIDs = find(y==thegroup);
    selDoc = docIDs(ceil(rand*length(docIDs)));
    words = Xs( Xs(:,1)==selDoc, : );
    [dummy,inds] = sort(words(:,3),1,'descend');
    words = words(inds,:);
    for i=1:size(words,1),
	fprintf(1,'%s, ',voc{words(i,2)});	
    end
    fprintf(1,'\n');
end
