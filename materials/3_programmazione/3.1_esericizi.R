# Funzioni e programmazione condizionale

# 0. Scrivi una funzione in R che prenda un numero come input e 
#   restituisca il doppio di quel numero.

doppio=function(x) {
  return(x * 2)
}
doppio(4) 


# 1. Definisci una funzione che calcoli l'area di un triangolo rettangolo
# Area = (Base * Altezza) / 2
# sia utlizzando la funzione return e { } 
# sia utilizzando una sola riga di codice (senza { } e return )

area_rect1 = function(base, altezza){
  A = (base*altezza)/2
  return(A)
}
area_rect1(3,4)

area_rect2 = function(base, altezza) (base*altezza)/2
area_rect2(3,4)


# 2. Definisci una funzione che stampi un messaggio di compleanno personalizzato
#    Scrivi una funzione auguri(nome, eta) che prenda come input il nome e 
#    l'età di una persona e restituisca un messaggio personalizzato come:
#   "Buon compleanno, [nome]! 
#    Congratulazioni per i tuoi [eta] anni!".
#    Usa le funzioni paste() e print() per formattare e stampare il messaggio.


auguri = function(nome, età){
  print(paste("Buon compleanno,", nome, "!", sep = " "))
  print(paste("Congratulazioni per i tuoi", età, "anni!", sep = " "))
        }

auguri("Margherita", 29)

# 3. Definisci una funzione che calcoli il valore massimo e minimo di un vettore numerico "z".
z = c(4:19, NA, 3:8)
#    e restituisca una frase come:
#   "Il valore massimo del vettore è ... e il valore minimo è ..." 
#    usando sprintf() o paste().

max_min = function(x, na.rm = TRUE){
  minx = min(x, na.rm = na.rm)
  maxx = max(x, na.rm=na.rm)
 
  frase=sprintf("Il valore massimo del vettore è %i e il valore minimo è %i", 
                minx, maxx)
  return(frase)
}
max_min(z)


# Programmazione condizionale

# 4. Definisci una funzione parity_check() che riceve in input un numero e 
#   restituisce una stringa:
#   "pari" se il numero è pari,
#   "dispari" se il numero è dispari. (?ifelse)

parity_check = function(x){
  ifelse(x%%2==0, "pari","dispari")
}
parity_check(2)

# 5. Definisci una funzione dispari() che riceve in input un numero e
#  restituisce un numero:
#  se il numero è pari allora questo deve essere sommato a 1
#  se il numero è dispari rimane se stesso (ifelse)

dispari = function(x){
  ifelse(x%%2==0, x+1,x)
}
dispari(2)

# 7. Definisci una funzione tran() che, dato un numero, 
#    restituisca:
# Il doppio del numero se è maggiore di 10,
# La metà del numero se è minore di 5,
# Il numero stesso altrimenti.
# 
# utlizza if ... else if ...else....


tran = function(x){
  
  if (x > 10){
    value = x*2
  } else if (x < 5) {
    value = x/2
  }else{
    value = x
  }
  return(value)
}

tran(0.4)

# 7. Dato il vettore
values=rnorm(100, 0, 10)
#   Definisci una funzione class_abs() che classifica un valore numerico 
#   in base al suo valore assoluto:
#   
#   abs(value) < 5: "Piccolo",
#   5 <= abs(value) < 10: "Medio",
#   10 <= abs(value): "Grande".

# Usa una serie di ifelse() nested per assegnare una variabile 
# value_chr con le etichette corrispondenti.
    
class_abs1 = function(x){
  value_chr = ifelse(abs(x) < 5, yes = "Piccolo",
              no = ifelse(abs(x) >= 5 & abs(x) < 10, 
                     "Medio", 
                     "Grande" ))
  return(value_chr)
}
class_abs1(8)

# 8. Utilizza case_when per assegnare una variabile 
# value_chr con le etichette corrispondenti. (dplyr::case_when)

class_abs2 = function(x){
  value_chr = dplyr::case_when(abs(x) < 5 ~ "Piccolo",
                               abs(x) >= 5 & abs(x) < 10 ~  "Medio",
                               TRUE ~ "Grande" )
  return(value_chr)
}


#9. Crea una funzione che accetti un vettore e verifichi se è numerico. 
#  Se non lo è, lancia un errore con il messaggio "Input non numerico".

ver_num=function(vettore) {
  if (!is.numeric(vettore)) {
    stop("Input non numerico")
  }
  return(mean(vettore))
}
ver_num(1:5) 
ver_num(c("A", "B"))  # Errore!!!



# 10.Un negozio offre sconti come segue:
#   10% di sconto per ordini sopra i €100.
#   20% di sconto per ordini sopra i €200.
#   Nessuno sconto per ordini sotto i €100.
#   Crea un vettore con i valori degli ordini e 
# calcola il totale con lo sconto applicato.

ordini=c(50, 150, 250, 90)
sconti=ifelse(ordini > 200, 0.2, ifelse(ordini > 100, 0.1, 0))
totale_scontato=ordini - (ordini * sconti)


