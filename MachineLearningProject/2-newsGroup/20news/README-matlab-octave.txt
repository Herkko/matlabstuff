
Example use of 20newsgroups data in matlab/octave:

First, load the 20 newsgroups data:

>> [Xs y voc groups] = loadnews();

Then you can try out the demo code (in demo.m) as follows

>> demo( Xs, y, voc, groups, 0 );
>> demo( Xs, y, voc, groups, 1 );
>> demo( Xs, y, voc, groups, 2 );
>> demo( Xs, y, voc, groups, 3 );
>> demo( Xs, y, voc, groups, 4 );
>> demo( Xs, y, voc, groups, 5 );

Please see the code for details of what these different calls do, and
also look at the implementations to see how they are done.

