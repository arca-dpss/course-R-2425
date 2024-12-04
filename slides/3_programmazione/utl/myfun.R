# funzioni che utilizzo più volte

z_score = function(x, na.rm = FALSE){ # argomenti 
  
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

myfun_ifelse = function(x){ # argomento
  if (x > 2){
    cat("Il valore è maggiore di 0\n")
  }
  else if (x <= 2 & x >= 0){
    cat("Il valore è compreso tra 2 e 0\n")
  }
  else{
    cat("Il valore è minore di 0\n")
  }
}


myfun_stop = function(x){ # argomento
  
  if (!is.numeric(x)) { # utile quando vogliamo evitare che la funzione venga eseguita
    stop("il vettore deve essere numerico")
  }
  mean(x, na.rm = TRUE)
}

mydf_fun = function(mydf){
  
  if (ncol(mydf) != 2) { # utile quando vogliamo evitare che la funzione venga eseguita
    stop("dataframe errato")
  }
  
  if (all.equal(colnames(mydf), c("id","age"))){
    mydf$age_cat = with(mydf, 
                       factor(
      case_when( age > 30 ~ "adulto",
                 age <= 30 & age >= 20 ~ "giovane",
                 age < 20 ~ "adolescente",
                 TRUE ~ "errore" #  check  errori di codifica
      )))
    
    mydf$age_z = z_score(mydf$age)
    
  }else{
    stop("wrong variable names")
  }
  return(mydf)
}
