
# STARTING UP:
#
# > source('sourcedir.R')
# > sourceDir('./')
# > loadnews()
# > demo(task)
#

demo <- function( task ) {

  #------------------------------------------------------------------------
  # Task 0: Shows some statistics of the dataset
  #------------------------------------------------------------------------

  if (task==0) {
	
	cat('Number of groups: ',length(groups),'\n',sep='')
	cat('Number of words: ',length(voc),'\n',sep='')
	cat('Number of documents: ',max(Xs[,1]),'\n',sep='')
	cat('Number of word-doc pairs: ',nrow(Xs),'\n',sep='')
	cat('Density: ',1467345/(11269*53975),'\n',sep='')
    
  } 

  #------------------------------------------------------------------------
  # Task 1: Show the groups
  #------------------------------------------------------------------------

  if (task==1) {

	cat('Labels:\n')
	for (i in 1:20) {
		cat(i,': ',groups[i],'\n',sep='')
	}
  } 
  

  #------------------------------------------------------------------------
  # Task 2: Show the vocabulary
  #------------------------------------------------------------------------

  if (task==2) {

	cat('Vocabulary:\n')
	for (i in 1:10) {
		cat(i,': ',voc[i],'\n',sep='')
	}
	for (i in 53966:53975) {
		cat(i,': ',voc[i],'\n',sep='')
	}
  } 

  #------------------------------------------------------------------------
  # Task 3: Find the index of a given word
  #------------------------------------------------------------------------

  if (task==3) {
	wordID <- findterm( 'gretzky' )
	cat(wordID,': ',voc[wordID],'\n',sep='')
  } 

  #------------------------------------------------------------------------
  # Task 4: Show the distribution of labels for documents containing
  # a given term
  #------------------------------------------------------------------------

  if (task==4) {

    wordID <- findterm( 'gretzky' )
    docIDs <- Xs[ Xs[,2]==wordID, 1 ]
    lab <- y[docIDs]
    hits <- rep(0,20)
    for (i in 1:length(lab)) {
	  hits[lab[i]] <- hits[lab[i]]+1
	}
    for (i in 1:20) {
	  cat(hits[i],' (',groups[i],')\n',sep='')
    }

  } 

  #------------------------------------------------------------------------
  # Task 5: take a random document from a given newsgroup, and show all 
  # the words in that document, in order of decreasing frequency
  #------------------------------------------------------------------------
  if (task==5) {
  
    thegroup <- 11 # rec.sport.hockey
    docIDs <- which(y==thegroup)
    selDoc <- docIDs[ceiling(runif(1)*length(docIDs))]
    words <- Xs[ Xs[,1]==selDoc, ]
    sortlist <- sort(words[,3],decreasing=TRUE,index.return=TRUE)
	inds <- sortlist$ix
    words <- words[inds,]
    for (i in 1:nrow(words)) {
      cat(voc[words[i,2]],', ',sep='')
    }
    cat('\n')
  }

}

