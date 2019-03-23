Number_of_models = 64
results=[Number_of_models,3]
for C_test = [0.01 0.03 0.1 0.3 1, 3, 10 30]
    for sigma_test = [0.01 0.03 0.1 0.3 1, 3, 10 30]
         Model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
         predictions = svmPredict(Model, Xval);
         pred_error=mean(double(predictions ~= yval))
         
         results=[C_test, sigma_test, pred_error]
    end 
end

C=results(1,1)
sigma=results(1,2)