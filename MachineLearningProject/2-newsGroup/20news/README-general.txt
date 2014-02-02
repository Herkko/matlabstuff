
------------------------------
README file for 20news package
------------------------------

This directory contains "20 newsgroups" text data in 
bag-of-words format. The data is taken from:

http://people.csail.mit.edu/jrennie/20Newsgroups/

Specifically, the directory contains the data files

train.data
train.label
train.map
vocabulary.txt

downloaded from that site. It also contains code
for easily reading the data into Matlab/Octave/R and 
some demo code showing examples of looking at the 
data.

The files are provided here to help the students of the
Introduction to Machine Learning course quickly get started 
analyzing the data without having to figure out the details
of the data format and how to load it. 

The files are provided exclusively for the above purpose.
Do not distribute.

The format of the data files are as follows:

train.data: each row contains (docID, wordID, freq) 
where the docID is the ID number of the document,
wordID is the ID number of the word, and freq is 
the number of times that word was present in that document.
There are no values 0 for freq: all such cases are implicit
by the fact that the docID-wordID pair is not given in
the train.data file.

train.label: if on row X there is the value Y then this 
means that the document with docID=X has the label
groupID=Y.

vocabular.txt: if on row X there is the word Y then this
means that the word with wordID=X is the word 'Y'

train.map: contains the mapping from labels (groupID)
to the names of the newsgroups.

Please see the demo code for examples of how to use these
matrices.

Matlab/Octave users: see README-matlab-octave.txt
R users: see README-R.txt

