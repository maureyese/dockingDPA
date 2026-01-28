library(ggplot2) # Library that allows to make graphs

#########################################################################################################################################################################
# Files and run specifications:
# swissadme.csv must be a previously combined .csv which must store the results of each run
# ProTox 3.0 output ".csv" files must be named after the molecule they come from with the same name stored in the swissadme.csv
# All ".csv" files must be stored in the same directory as the program at the moment of running it, otherwise a setwd() would be needed to specify the working directory
# To appropriately run this program all lines must be selected.
#########################################################################################################################################################################

# Universal variables

save = read.csv("01_pharmprop/protox/swissadme.csv") # Reading of the ".csv" file with SwissADME results
mols = save # Copy to use of the previous data obtained
listmol = levels(factor(save$Molecule)) # List of molecules to be analyze
len = length(mols$Molecule) # Amount of molecules to analyze
ScoreAna = as.data.frame(matrix(nrow = len, ncol =3)) # Dataframe that will store amount of predicted inactive and active toxicities 
colnames(ScoreAna) = c("Molecule", "IScore", "Toxicity events")


# Function to separate a string into words ignoring commas

trimmer <- function(word){ 
  
  word = unlist(strsplit(word, split = ", "), use.names = FALSE)
  return(word)
}

# Analysis of Toxicity

cont = 1
for (i in listmol){ # For that will range each molecule
  
  Iscore = 0 # Number of inactive toxicities
  aux = read.csv(paste(i, ".csv", sep ="")) # Read of ProTox 3.0 results of a concrete UV filter
  auxo = ""
  ScoreAna$Molecule[cont] = i
  
  conta = 1
  for (j in aux$Prediction){ # Each prediction is evaluated for the Iscore
    
    if(j == "Inactive"){ # If inactive Iscore sums 1
      Iscore = Iscore + 1
      ScoreAna$IScore[cont] = Iscore
      conta = conta + 1
    }
    
    else{
      if (auxo == ""){ # Else, active predictions will be noted
        ScoreAna$`Toxicity events`[cont]= paste(aux$Target[conta], sep = "")
        auxo = ScoreAna$`Toxicity events`[cont]
        conta = conta + 1
        
      }
      else{
        ScoreAna$`Toxicity events`[cont]= paste(auxo, ", ", aux$Target[conta], sep = "")
        auxo = ScoreAna$`Toxicity events`[cont]
        conta = conta + 1
      }
    }
  }
  cont = cont + 1
}

listTox = levels(factor(aux$Target)) # List of toxicities to evaluate
ToxGraphData = as.data.frame(matrix(nrow = length(listTox), ncol =2))  # Dataframe that will store frequencies
colnames(ToxGraphData) = c("Toxicity", "Frequency")
ToxGraphData$Toxicity = listTox # Initialization of toxicities
ToxGraphData$Frequency = 0 # Initialization of frequencies

# Nested for to count how many times an active predicted toxicity appears for a specific molecule

cont = 1
for (d in ToxGraphData$Toxicity){
  for (i in ScoreAna$`Toxicity events`){
    for(j in trimmer(i)){
      print(j)
      if(j == d){
        ToxGraphData$Frequency[cont] = ToxGraphData$Frequency[cont] + 1
      }
    }
  }
  cont = cont + 1
}

# Histogram of frequencies for the toxicity results

ggplot(ToxGraphData, aes(x = Toxicity, y = Frequency)) +
  geom_col(fill = "skyblue", color = "black") +
  labs(
    title = "Distribution of Toxicity",
    x = "Toxicity",
    y = "Frequency"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )+ scale_y_continuous(breaks = scales::breaks_width(1))
