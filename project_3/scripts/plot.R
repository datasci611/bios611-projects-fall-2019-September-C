# Load the required libraries
library(tidyverse)
library(ggplot2)

# read in the data wrangled in Python
dat = read_tsv("/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/data/new_dataset.tsv")

# Extract number of days from the character type variable `Days Stayed` and cast it into int
library(stringr)
numextract <- function(string){ 
  str_extract(string, "\\-*\\d+\\.*\\d*")
} 

days_stayed = numextract(dat$`Days Stayed`)
days_stayed = as.numeric(days_stayed)
dat$`Days Stayed` = days_stayed

# Explore the distribution of client't age and gender at time of entry. 
ggplot(data = dat, mapping = aes(x = dat$`Client Age at Entry`)) + 
  geom_bar(mapping = aes(colour = `Client Gender`))+ 
  theme(legend.text = element_text(size = 8), legend.position = 'bottom') + 
  labs(title = "Plot of Client's Age and Gender at Entry") + 
  xlab("Client's Age at Entry") + 
  ylab("Frenquency")

# Explore the pattern of the length of stay with respect client's age and gender. 
ggplot(dat, mapping = aes(x = dat$`Client Age at Entry`, y = dat$`Days Stayed`, 
                          group = dat$`Client Gender`, color = dat$`Client Gender`, legend = dat$`Client Gender`)) + 
  geom_violin() + 
  theme(legend.text = element_text(size = 8), legend.position = 'bottom') + 
  labs(title = "Violin plot for the length of stay vs. client's age and gender") + 
  xlab("Client's Age at Entry") + 
  ylab("Lenght of Stay (days)")

ggsave('/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/results/age_gender.png', height=4, width=7)

#  Explore the pattern of the length of stay with respect client's income at entry. 
ggplot(dat %>% filter(`Monthly Amount (Entry)` < 30000),
       mapping = aes(x = `Monthly Amount (Entry)`, y = `Days Stayed`)) + 
  geom_point() + 
  labs(title = "Scatter Plot for length of stay and income at entry")+ 
  xlab("Monthly Income at Entry")+
  ylab("Lenght of Stay (days)")

ggsave('/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/results/stay_income.png', height=4, width=7)

# Explore the pattern of the length of stay with respect client's number of noncash services at entry. 
ggplot(dat,mapping = aes(x = `Number of Noncash at Entry`, y = `Days Stayed`)) + 
  geom_point() + 
  labs(title = "Scatter plot for length of stay and number of noncash services at entry")+ 
  xlab("Number of Noncash at Entry")+
  ylab("Lenght of Stay (days)")

ggsave('/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/results/stay_noncash.png', height=4, width=7)

# Generate HTML 
rmarkdown::render("/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/results/report.Rmd", "html_document")

