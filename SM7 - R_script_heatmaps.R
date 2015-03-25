rm(list=ls(all=TRUE))
install.packages("XLConnect") #esto es para instalar un paquete que requiere para abrir el archivo de excel. Solo necesita correrlo la promera vez. Despues ya puede borrar esta linea
install.packages("plyr") # this is a new package you must installe the just the first time you use it.
setwd("C:/Users/lopezfernj/Desktop/heatmap") # esta linea es para decirle a R donde están sus archivos. Con los que va a trabajar. DOnde tiene las tablas con los datos.
require(XLConnect) # esto es para abrir el paquete que instaló. Tiene que crrer esta linea cada vez que abre R.

wb<-loadWorkbook("./434_vs_Erwinia amylovora ATCC 49946.xls")
wb2 = loadWorkbook("./434_vs_Erwinia billingiae Eb661.xls")
wb3 = loadWorkbook("./434_vs_Erwinia pyrifoliae Ep1_96.xls")
wb4 = loadWorkbook("./434_vs_Erwinia sp. Ejp617.xls")


data = readWorksheet(wb, sheet = 1, header = TRUE)[,c(2,3,4,5,7,9)]
new.table<-rbind(data)
head(new.table)

data2 = readWorksheet(wb2, sheet = 1, header = TRUE)[,c(2,3,4,5,7,9)]
new.table2<-rbind(data2)
head(new.table2)

data3 = readWorksheet(wb3, sheet = 1, header = TRUE)[,c(2,3,4,5,7,9)]
new.table3<-rbind(data3)
head(new.table3)

data4 = readWorksheet(wb4, sheet = 1, header = TRUE)[,c(2,3,4,5,7,9)]
new.table4<-rbind(data4)
head(new.table4)

#aquí va a general una lista de todos los posible "Role" de todas las tables

list.Roles<-c()
number_of_data<-c()
for (x in unique(new.table[,1])){
  data_list = new.table[new.table$Category==x,4]
  data_list2 = new.table2[new.table2$Category==x,4]
  data_list3 = new.table3[new.table2$Category==x,4]
  data_list4 = new.table4[new.table2$Category==x,4]
  count_data<-c()
  for (l in c(data_list, data_list2, data_list3, data_list4)){
    if (!(l %in% list.Roles)){
      list.Roles<-c(list.Roles, l)
      count_data[length(count_data)+1]<-1
    }
  }
  number_of_data[x]<-length(count_data)
}

Category_data<-c()
for (x in unique(new.table[,1])){
  Category_data<-c(Category_data,rep(x,number_of_data[x]))
}

# aquí va a sacar el dato para cada "Role" en cada tabla por separado, por ejemplo aqui se va a trabajar la tabla 1, la cual yo llamé new.table

results_table1<-matrix(c(0,0), nrow=1,ncol=2)
colnames(results_table1)<-c("SS.active.A", "SS.active.B")
for (x in list.Roles){
  if (x %in% new.table[,4]){
    element<-which(new.table[,4]==x)[1]
    activeResult<-new.table[element,c(5,6)]
  }
  else{
    activeResult<-c("no", "no")
  }
  results_table1<-rbind(results_table1,activeResult)
}


# las siguientes tres lines cambian "yes" y "no" por "1" y "0"
library(plyr) # For the revalue() function
results_table1$SS.active.A <- revalue(results_table1$SS.active.A, c("yes"=1, "no"=0))
results_table1$SS.active.B <- revalue(results_table1$SS.active.B, c("yes"=1, "no"=0))

# Esto es lo mismo que antes, pero con la table 2. la cual yo llamé new.table2

results_table2<-matrix(c(0,0), nrow=1,ncol=2)
colnames(results_table2)<-c("SS.active.A", "SS.active.B")
for (x in list.Roles){
  if (x %in% new.table2[,4]){
    element<-which(new.table2[,4]==x)[1]
    activeResult<-new.table2[element,c(5,6)]
  }
  else{
    activeResult<-c("no", "no")
  }
  results_table2<-rbind(results_table2,activeResult)
}

# las siguientes tres lines cambian "yes" y "no" por "1" y "0"
results_table2$SS.active.A <- revalue(results_table2$SS.active.A, c("yes"=1, "no"=0))
results_table2$SS.active.B <- revalue(results_table2$SS.active.B, c("yes"=1, "no"=0))

# aquí va a sacar el dato para cada "Role" en cada tabla por separado, por ejemplo aqui se va a trabajar la tabla 1, la cual yo llamé new.table

results_table3<-matrix(c(0,0), nrow=1,ncol=2)
colnames(results_table3)<-c("SS.active.A", "SS.active.B")
for (x in list.Roles){
  if (x %in% new.table[,4]){
    element<-which(new.table[,4]==x)[1]
    activeResult<-new.table[element,c(5,6)]
  }
  else{
    activeResult<-c("no", "no")
  }
  results_table3<-rbind(results_table3,activeResult)
}


# las siguientes tres lines cambian "yes" y "no" por "1" y "0"
library(plyr) # For the revalue() function
results_table3$SS.active.A <- revalue(results_table3$SS.active.A, c("yes"=1, "no"=0))
results_table3$SS.active.B <- revalue(results_table3$SS.active.B, c("yes"=1, "no"=0))

# aquí va a sacar el dato para cada "Role" en cada tabla por separado, por ejemplo aqui se va a trabajar la tabla 1, la cual yo llamé new.table

results_table4<-matrix(c(0,0), nrow=1,ncol=2)
colnames(results_table4)<-c("SS.active.A", "SS.active.B")
for (x in list.Roles){
  if (x %in% new.table[,4]){
    element<-which(new.table[,4]==x)[1]
    activeResult<-new.table[element,c(5,6)]
  }
  else{
    activeResult<-c("no", "no")
  }
  results_table4<-rbind(results_table4,activeResult)
}


# las siguientes tres lines cambian "yes" y "no" por "1" y "0"
library(plyr) # For the revalue() function
results_table4$SS.active.A <- revalue(results_table4$SS.active.A, c("yes"=1, "no"=0))
results_table4$SS.active.B <- revalue(results_table4$SS.active.B, c("yes"=1, "no"=0))



# Esta linea ve a juntar lo de las dos tablas en una sola table
final_table<-cbind(Category=Category_data, Role=list.Roles, results_table1[-1,], results_table2[-1,], results_table3[-1,], results_table4[-1,])

head(final_table)

#esta ultima linea es para guardar la tabla final en un archivo de texto que puede abrir en excel

write.table(final_table, file = "Heatmap_Erwnia.txt", sep = "\t", row.names = F, col.names = T)
