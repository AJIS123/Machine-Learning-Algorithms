# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#regression

regressor=lm(formula=Salary~YearsExperience,data=training_set)

#predict test

y_pred = predict(regressor,newdata = test_set)
y_pred

#visualise
#Training Set
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             color='Red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),
             color='Blue')+
  ggtitle('Salary vs Experience(train)')+
  xlab('Experience')+
  ylab('Salary')
#Test set
ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),
             color='Red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),
            color='Blue')+
  ggtitle('Salary vs Experience(test)')+
  xlab('Experience')+
  ylab('Salary')
  