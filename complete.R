complete<-function(directory,id=1:332)
{
  fileList <- list.files(path=directory, pattern=".csv", full.names=TRUE)
  nobs<-numeric()
  for(i in id){
    info<-read.csv(fileList[i])
    ##print(info)
    nobs<-c(nobs,sum(complete.cases(info)))
  }
  data.frame(id,nobs)
}

