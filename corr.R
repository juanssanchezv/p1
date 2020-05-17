corr <- function(directory, threshold = 0)
{
  fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  
  results<-numeric(0)
  
  cases <- complete(directory)
  id <- cases[cases$nobs > threshold, ]
  
  if (nrow(id) > 0)
  {
    for(i in id$id)
    {
      info<-read.csv(fileList[i]) 
      filter_info<-info[(!is.na(info$sulfate)&!is.na(info$nitrate)),]
      sulfate_info<-filter_info["sulfate"]
      nitrate_info<-filter_info["nitrate"]
      results<-c(results,cor(sulfate_info,nitrate_info))
    }
  }
 ## else
 ## {
 ##   print("The threshold is too high.")
 ## }
  results
}

