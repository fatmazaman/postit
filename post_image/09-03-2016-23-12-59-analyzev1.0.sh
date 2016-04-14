#!/bin/bash
# t-values : http://www.itl.nist.gov/div898/handbook/eda/section3/eda3672.htm
ecj_data_processing() {
  loc="";
  if [ "$1" = "algo1" ] 
  then
     loc=$1
  fi

  if [ "$1" = "algo2" ]
  then
  loc=$1
  fi


  for i in ../$loc/*.out.stat
  do
   cut -f3 -d ' ' $i > ./$i.bstonly  
   #-f says which field you want to extract, -d says what is the field delimeter that is used in the input file
  done

 if [ "$loc" = "algo1"  ]
 then
     paste ../$loc/*.out.stat.bstonly > results_algo1.all 
 fi 
	
 if [ "$loc" = "algo2"  ]
 then
     paste ../$loc/*.out.stat.bstonly > results_algo2.all 
 fi  
}

generate_RScript() {
   cat > results.R <<EOF
     library(matrixStats) #loading for rowSds

     if ("$1" == "algo1") {
        fitness_by_generation = read.table("results_algo1.all")
        means_by_experiments = colMeans(fitness_by_generation, na.rm = TRUE)
        means_by_generations = rowMeans(fitness_by_generation, na.rm = TRUE)
        write.table(means_by_generations,file= "ExpAlgo1gen.means",sep="\t",row.names=F,col.names=F)  
        write.table(means_by_experiments,file= "ExpAlgo1.means",sep="\t",row.names=F,col.names=F)  
        std_by_experiments  = colSds(data.matrix(fitness_by_generation,rownames.force=NA), na.rm = TRUE) 
        std_by_generations  = rowSds(data.matrix(fitness_by_generation,rownames.force=NA), na.rm = TRUE) 
        write.table(std_by_generations,file="ExpAlgo1gen.std",sep="\t",row.names=F,col.names=F) 
        write.table(std_by_experiments,file="ExpAlgo1.std",sep="\t",row.names=F,col.names=F) 
     }
    if ("$2" == "algo2") {
        fitness_by_generation = read.table("results_algo2.all")
        means_by_experiments = colMeans(fitness_by_generation, na.rm = TRUE)
        means_by_generations = rowMeans(fitness_by_generation, na.rm = TRUE)
        write.table(means_by_generations,file= "ExpAlgo2gen.means",sep="\t",row.names=F,col.names=F)
        write.table(means_by_experiments,file= "ExpAlgo2.means",sep="\t",row.names=F,col.names=F)
        std_by_experiments   = colSds(data.matrix(fitness_by_generation,rownames.force=NA), na.rm = TRUE) 
        std_by_generations   = rowSds(data.matrix(fitness_by_generation,rownames.force=NA), na.rm = TRUE) 
        write.table(std_by_generations,file="ExpAlgo2gen.std",sep="\t",row.names=F,col.names=F) 
        write.table(std_by_experiments,file="ExpAlgo2.std",sep="\t",row.names=F,col.names=F)     
    }

EOF
}

measure_tTest() {
   cat > tTest.R <<EOF
   no_DOF <- 100
   standard_t_values = read.table("standard.tvalues")


   if ("$1" == "experiment") {
   	no_Experiments <- 50
        loop_controller=no_Experiments

        meu_algo1 = read.table("ExpAlgo1.means")
   	std_algo1 = read.table("ExpAlgo1.std")
   
   	meu_algo2 = read.table("ExpAlgo2.means")
   	std_algo2 = read.table("ExpAlgo2.std")  
   
   	meu_difference = meu_algo1 - meu_algo2
    }
    
   if ("$1" == "generation") {
   	no_Generations <- 100
        loop_controller=no_Generations

        meu_algo1 = read.table("ExpAlgo1gen.means")
   	std_algo1 = read.table("ExpAlgo1gen.std")
   
   	meu_algo2 = read.table("ExpAlgo2gen.means")
   	std_algo2 = read.table("ExpAlgo2gen.std")  
   
   	meu_difference = meu_algo1 - meu_algo2
    }


   
   
   for (i in 1:loop_controller) {
     
     #calculating t-test
      meu_abs = abs(meu_difference[i,1])
      variance_1 = std_algo1 * std_algo1 # You can also use ^ operator
      variance_2 = std_algo2 * std_algo2     
      denominator = sqrt((variance_1/loop_controller) + (variance_2/loop_controller))     
      t_values = (meu_abs/denominator) #According to Luke's Chapter 11
      #print(t_values[i,1])
      
      #calculating degree of freedom
      nominator_frac   = ((variance_1/loop_controller) + (variance_2/loop_controller))
      nominator   = nominator_frac * nominator_frac
      firstPart_denom =  ((variance_1/loop_controller) * (variance_1/loop_controller)) / (loop_controller-1)
      secondPart_denom = ((variance_2/loop_controller) * (variance_2/loop_controller)) / (loop_controller-1)
      denominator = firstPart_denom + secondPart_denom
      dof = nominator/denominator    #According to Luke's Chapter 11
      dof = ceiling(dof)
      

      #Comaping two algos based on their mean and calculated t-values
      if (dof <= 100) {
          for (j in 1:no_DOF) {
            if (dof == standard_t_values[j,1] ) { #matching calculated dof with standard dof number
               if (meu_difference[i,1] > 0) {#Test for Algo1 superiority UPDATE: You need to update the following code in a function
                  if(t_values[i,1] > standard_t_values[j,3]) { #Comparing with 95% CI
                     msg <- "Algo1 is better than Algo2" #algo1, exp_sl, mean, obtained_t, std_t
                     print (msg)
                     algo1 = 1
                     exp_sl = i
                     mean = meu_algo1[i,1]
                     obtained_t = t_values[i,1]
                     std_t = standard_t_values[j,3]
                     rows_algo1 = c(algo1, exp_sl, mean, obtained_t, std_t)
                     print(rows_algo1)            
                  } #end of if
               } #end of if meu_difference
               else {  #Test for Algo2 superiority
                  if(t_values[i,1] > standard_t_values[j,3]) { #Comparing with 95% CI
                     msg <- "Algo2 is better than Algo1" #algo2, exp_sl, mean, obtained_t, std_t
                     print(msg)
                     algo2 = 2
                     exp_sl_2 = i
                     mean_2 = meu_algo2[i,1]
                     obtained_t_2 = t_values[i,1]
                     std_t_2 = standard_t_values[j,3]
                     rows_algo2 = c(algo2, exp_sl_2, mean_2, obtained_t_2, std_t_2)
                     print (rows_algo2)
                  } #end of if                 
               } #end of else in Algo2 superioity               
            } #end of if dof==std_t_values           
         } #end of for      
      } #end of if dof <100
      else { #dof > 100
         # print (msg) # The following codes will be called from a function. (t_values, meu_difference, std_tvalues, i)
        
         if (meu_difference[i,1] > 0) { #Test for Algo1 superiority
                  if(t_values[i,1] > 1.984) { #Comparing with 95% CI
                     msg <- "Algo1 is better than Algo2" #algo1, exp_sl, mean, obtained_t, std_t
                     print (msg)
                     algo1 = 1
                     exp_sl = i
                     mean = meu_algo1[i,1]
                     obtained_t = t_values[i,1]
                     std_t = 1.984
                     rows_algo1 = c(algo1, exp_sl, mean, obtained_t, std_t)
                     print(rows_algo1)            
                  } #end of if
               } #end of if meu_difference
               else {  #Test for Algo2 superiority
                  if(t_values[i,1] > 1.984) { #Comparing with 95% CI
                     msg <- "Algo2 is better than Algo1" #algo2, exp_sl, mean, obtained_t, std_t
                     print(msg)
                     algo2 = 2
                     exp_sl_2 = i
                     mean_2 = meu_algo2[i,1]
                     obtained_t_2 = t_values[i,1]
                     std_t_2 = 1.984
                     rows_algo2 = c(algo2, exp_sl_2, mean_2, obtained_t_2, std_t_2)
                     print (rows_algo2)
                  } #end of if                 
               } #end of else in Algo2 superioity
                       
      } #end of else dof >100
      tail(warnings(), 2) 	
    
   } #end of outest for
  
EOF
}

generate_GNUPlot_script() {
   cat > gp <<EOF
   set key at 50,50.0
   set style data lines 
   #plot "result.t" using 1 title "t-values"
   #replot "result.dof" using 1 title "dof"
   pause mouse key "..."
    
EOF
}

wipeTmpFiles() {
   rm ../algo1/*.out.stat.bstonly
   rm results.R
   #rm gp
   #rm results.all
   #rm results.means
   #rm results.std
}
ecj_data_processing algo1 
ecj_data_processing algo2
generate_RScript algo1 algo2
measure_tTest experiment 
measure_tTest generation
#generate_GNUPlot_script
module add apps/R/3.1.2
R -q -e 'source("results.R")'
R -q -e 'source("tTest.R")'
#gnuplot < gp
#wipeTmpFiles


