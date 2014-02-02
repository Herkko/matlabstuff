function ind = findterm( str, voc )
% findterm - searches for a term in the vocabulary
%
% SYNTAX:
% ind = findterm( str, voc );
%
% str      a word (e.g. 'kurri')
% voc      the vocabulary (as obtained using loadnews)
%
% The function returns the wordID of the term in the vocabulary.
% For instance, findterm( 'kurri', voc ) returns 35444
% and voc{ 35444 } = 'kurri'
%
    
ind = find(strcmp( str, voc ));

if length(ind)<1,
   ind = 0; 
end
    
