X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
X_test<- read.table("./data/UCI HAR Dataset/test/X_test.txt")
subject_test<- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
y_test<- read.table("./data/UCI HAR Dataset/test/y_test.txt")
activity_labels<- read.table("./data/UCI HAR Dataset/activity_labels.txt")
col_names<- read.table("./data/UCI HAR Dataset/features.txt")%>%
        select(V2)

##renaming the columns 
names(X_train)<- col_names$V2
names(X_test)<- col_names$V2

subject_train <- rename(subject_train, Subject=V1)
y_train <- rename(y_train, Activity=V1)
subject_test <- rename(subject_test, Subject=V1)
y_test <- rename(y_test, Activity=V1)

##Choosing the required columns
X_train<- X_train[,grep(pattern= "-?(mean|std)[(][)]?-?[XYZ]?$", colnames(X_train))]
X_test<- X_test[,grep(pattern= "-?(mean|std)[(][)]?-?[XYZ]?$", colnames(X_test))]

##combining the datasets
train<- cbind(subject_train, X_train)
train<- cbind(train, y_train)
test<- cbind(subject_test, X_test)
test<- cbind(test, y_test)
data<- rbind(train,test)

##Adding the activity labels
convertactivitylabels<- function(x){
        if (x==1){
                x='WALKING'
        }
        else if (x==2){
                x= 'WALKING_UPSTAIRS'
        }
        else if (x==3){
                x="WALKING_DOWNSTAIRS"
        }
        else if (x==4){
                x="SITTING"
        }
        else if (x==5){
                x='STANDING'
        }
        else{
                x='LAYING'
        }
        return (x)
}
data$Activity <- sapply(data$Activity, convertactivitylabels)

##Tidy data set with the average of each variable for each activity and 
#each subject.
data_mean <- data%>%
        group_by(Subject, Activity)%>%
        summarise(across(everything(), mean))
