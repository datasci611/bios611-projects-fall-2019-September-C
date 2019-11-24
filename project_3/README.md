# BIOS 611 Project 3

Xinran Chu 

## Background 
The data was provided by UMD (Urban Ministry of Durham). Established in 1983, Urban Ministries of Durham works holistically to end homelessness and meet the emergency needs of very poor and hungry neighbors through its programs and in partnership with other nonprofits. UMD is a private, 501(c) 3 non-profit organization governed by a volunteer Board of Directors from the community. UMD offers food, shelter and a future to about 6,000 men, women and children annually. 

## Datasets 
For this project, I selected several datasets provided by UMD, including the following along with the variables I used: 

* CLIENT: EE Provider ID, Client ID, Client Age at Entry, Client Gender, Client Primary Race, Client Ethnicity, Client      Veteran Status. 
* ENTRY_EXIT: Client ID, Entry Date, Exit Date, Destination, Reason for Leaving. 
* INCOME_ENTRY: Client ID, Monthly Amount (Entry). 
* NONCASH_ENTRY: Client ID, Receiving Benefit (Entry). 
* DISABILITY_ENTRY: Client ID, Disability Determination (Entry). 

## Questions Explored 
* How the length of stay relates to client demographics. 
* Destinations and reasons for leaving. 
* How does client recurrence relate to clients who are chronically homeless, youth who age out of the foster care system,   and other demographics/community trends? 

## Methods of Analysis 
* Use a Docker container that has both R and Python installed. 
* Use Python for data wrangling. 
* Use R for data analysis and visualization. 
* Use Makefile to run and compile all the programs. 

