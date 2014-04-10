function [testNumbers, trainNumbers, testclasses, trainclasses] =  helpLoadingNumbers()

[X, Y]= loadmnist(5000);
testclasses = zeros(500,1);
trainclasses = zeros(500,1);
trainNumbers= zeros(400, 784);
testNumbers = zeros(400, 784);

counter1 = 1;
for i=1:2500
    if (Y(i) == 1 || Y(i) == 0)
        trainclasses(counter1) = Y(i);
        trainNumbers(counter1,:) = X(i,:);
        counter1=counter1+1;
    end
    
end


counter2 =1;
for i=2501:5000
    if (Y(i) == 1 || Y(i) == 0)
        
        testNumbers(counter2,:) = X(i,:);
        testclasses(counter2) = Y(i);
        counter2=counter2+1;
        counter1 = counter1+1;
        
    end
    
end

for i=1:length(testclasses)
    if (testclasses(i) ==0)
        testclasses(i) = -1;
        
    end
    
    
end


for i=1:length(trainclasses)
    if (trainclasses(i) ==0)
        trainclasses(i) = -1;
        
    end
    
    
end


end

