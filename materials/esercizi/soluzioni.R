# Creo un dataframe con 3 colonne 
my_df = data.frame(col1 = 1:4, col2 = letters[1:4],
                    col3 = rnorm(n = 4, mean = 0, sd = 1)) 
my_df
my_df$col1>2


my_df[col1>3, c(2,1)]
