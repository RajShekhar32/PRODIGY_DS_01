#Task-01
#Create a bar chart or histogram to visualize the distribution of a categorical or continuous variable, such as the distribution of ages or genders in a population.
#Sample Dataset :- https://data.worldbank.org/indicator/SP.POP.TOTL

# Load the necessary library
library(ggplot2)
#load the dataset
data<-read.csv("C:\\Users\\user\\OneDrive\\Desktop\\Raj\\API_SP.POP.TOTL_DS2_en_csv_v2_56\\data.csv")
head(data)
#selecting relavent colunm (country and population for 2023)
data_2023<-data[,c("Country.Name","X2023")];head(data_2023)
#Renames the colunms
colnames(data_2023)<-c("Country.Name","Population")
data_2023_Population<-as.numeric(data_2023$Population);data_2023_Population
#filter out rows with missing data
cleaned_data<-data_2023[!is.na(data_2023_Population)&data_2023$Population>0,];cleaned_data
order_data<-order(-cleaned_data$Population);order_data
top_10<-cleaned_data[order_data,][1:10,];top_10
#create bar chart
ggplot(top_10,aes(x=reorder(Country.Name,-Population),y=Population))+geom_bar(stat="identity",fill="red")+labs(title="Top 10 Most Populated Countries in 2023",x="Country",y="Total Population")
ggplot(cleaned_data,aes(x=Population))+geom_density(fill="red")+labs(title="Density Plot of Country Population in 2023",x="Population",y="Density")
