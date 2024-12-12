# Problema Emanuela
df  = readxl::read_excel("materials/dataEma/fake_dataset_Tec.xlsx")
#cosa c'è di strano?
str(df)
# Dobbiamo prendere i nomi delle colonne dalla prima riga
colnames(df) = df[1,]
df = df[-1,]
str(df)

# Trasforma in numerico
# puoi fare uno per volta as factor, o utilizzare col_type = ....
# oppure fare un for loop
df1 = df

for(i in 1:ncol(df1)){
  if(i < 3){
  df1[[i]] = as.factor(df1[[i]])
  }else{
  df1[[i]] = as.numeric(df1[[i]])
  }
}

str(df1)

# con data.frame mapply
df2 = df
df2[,3:ncol(df2)] = mapply(as.numeric, df2[,3:ncol(df2)])
df2


# Crea la componente 1:
# 1. Somma i punteggi da TEC1 a TEC5, 
# se la somma è maggiore di 4 allora assegno in punteggio 1, 0 
df1$comp1 = ifelse(df1$TEC1 + df1$TEC2 + df1$TEC3 + df1$TEC4 + df1$TEC5 >= 4, 1, 0)
#df1$comp1_2 = ifelse(rowSums(df1[,4:8]) >= 4, 1, 0)
#all.equal(df1$comp1_1,df1$comp1_2)

# Crea la componente 2:
# 2. Somma i punteggi da TEC6 a TEC10, 
# se la somma è maggiore di 4 allora assegno in punteggio 1, 0
df1$comp2 = ifelse(df1$TEC6 + df1$TEC7 + 
                       df1$TEC8 + df1$TEC9 + df1$TEC10  >= 4, 1, 0)
#df1$comp2_2 = ifelse(rowSums(df1[,9:13]) >= 4, 1, 0)

#all.equal(df1$comp2_1,df1$comp2_2)


# Crea la componente 3:
# 3. Somma i punteggi da TEC12.1 a TEC12.2, se la somma fa 2 allora 1, 0 
df1$comp3 = ifelse(df1$TEC12.1 + df1$TEC12.2 == 2, 1, 0)

# Crea la componente 4:
# Risposta TEC13.1 se 1, 1 sennò 0
df1$comp4 = df1$TEC13.1

# Crea la componente 5:
# Risposta TEC17 se 1, 1 sennò 0
df1$comp5 = df1$TEC17

# Crea la componente 6:
# Risposta TEC18 se 1, 1 sennò 0
df1$comp6 = df1$TEC18

# Crea la componente 7:
# Risposta TEC19 se 1, 1 sennò 0
df1$comp7 = df1$TEC19

# Crea la componente 8:
# Risposta TEC20 se 1, 1 sennò 0
df1$comp8 = df1$TEC20

# Crea la componente 9:
# Risposta TEC23 se 1, 1 sennò 0
df1$comp9 = df1$TEC23

str(df1)
# Crea la componente TOTALE:
# somma le componenti da 1 a 9 
df1$tot = rowSums(df1[,(ncol(df1)-8):ncol(df1)])

str(df1)
max(df1$tot)
min(df1$tot) #ok!

#------------------------------------------------------------------------

# 1. calcola media gruppi (a b), guarda la funzione aggregate e summarise
aggregate(tot ~ Gruppo, data = df1, FUN = mean)

df1 %>% group_by(Gruppo)%>%
  summarise(tot_mean = mean(tot))

# 2. percentuale di accuratezza per ogni item ?grep, ?colMeans
medieITEM = colMeans(df1[,grep(pattern = "TEC", x = colnames(df1))]) 
medieITEM


# 3. crea dataframe in cui escludiamo
#  chi ha il punteggio totale minore/uguale a 3 e   ha 11 anni
#  chi ha 12 anni 
#  chi ha 10 anni e punteggio totale minore/uguale a 2
