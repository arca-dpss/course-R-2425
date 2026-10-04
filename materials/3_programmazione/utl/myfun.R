# functions I use several times

z_score = function(x, na.rm = FALSE){ # arguments 
  
  xcen = (x - mean(x, na.rm = na.rm)) / sd(x, na.rm = na.rm)
  
  return(xcen)
  
}

my_summary =  function(x){
  
  if(is.numeric(x)){ 
    return(mean(x))
    
  }else{
    return(table(x))
  } 
}

myfun_ifelse = function(x){ # argument
  if (x > 2){
    cat("The value is greater than 2\n")
  }
  else if (x <= 2 & x >= 0){
    cat("The value is between 0 and 2\n")
  }
  else{
    cat("The value is less than 0\n")
  }
}


myfun_stop = function(x){ # argument
  
  if (!is.numeric(x)) { # useful when we want to prevent the function from running
    stop("the vector must be numeric")
  }
  mean(x, na.rm = TRUE)
}

mydf_fun = function(mydf){
  
  if (ncol(mydf) != 2) { # useful when we want to prevent the function from running
    stop("wrong dataframe")
  }
  
  if (all.equal(colnames(mydf), c("id","age"))){
    mydf$age_cat = with(mydf, 
                       factor(
      case_when( age > 30 ~ "adult",
                 age <= 30 & age >= 20 ~ "young",
                 age < 20 ~ "adolescent",
                 TRUE ~ "error" # check for coding errors
      )))
    
    mydf$age_z = z_score(mydf$age)
    
  }else{
    stop("wrong variable names")
  }
  return(mydf)
}
