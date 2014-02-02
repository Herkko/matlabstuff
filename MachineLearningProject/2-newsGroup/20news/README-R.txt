
Example use of 20newsgroups data in R

First, source all the .R files in the directory:

> source("sourcedir.R")
> sourceDir("./")

Next, load the 20 newsgroups data (creates the global variables
'Xs', 'y', 'voc', and 'groups' to hold the data)

> loadnews()

Then you can try out the demo code (in demo.R) as follows

> demo(0)
> demo(1)
> demo(2)
> demo(3)
> demo(4)
> demo(5)

Please see the code for details of what these different calls do, and
also look at the implementations to see how they are done.

