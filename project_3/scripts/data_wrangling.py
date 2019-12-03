#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Import required packages 
import pandas as pd
import numpy as np
from datetime  import date
from sklearn.model_selection import train_test_split


# In[2]:


# Read dataset about client summary
client = pd.read_csv(r'/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/data/CLIENT_191102.tsv',sep='\t',header = 0, na_values=" ")
client.head()


# In[3]:


# Read dataset that records clients' entry and exit dates 
entry_exit = pd.read_csv(r'/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/data/ENTRY_EXIT_191102.tsv',sep='\t',header = 0, na_values=" ")
entry_exit.head()


# In[4]:


# Read dataset of client income at time of entry
income_entry = pd.read_csv(r'/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/data/INCOME_ENTRY_191102.tsv',sep='\t',header = 0, na_values=" ")
income_entry.head()


# In[5]:


# Read dataset of noncash resources clients had at time of entry
noncash_entry = pd.read_csv(r'/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/data/NONCASH_ENTRY_191102.tsv',sep='\t',header = 0, na_values=" ")
noncash_entry.head()


# In[6]:


# Read dataset of disabilities clients had at time of entry
disability_entry = pd.read_csv(r'/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/data/DISABILITY_ENTRY_191102.tsv',sep='\t',header = 0, na_values=" ")
disability_entry.head()


# In[7]:


# Calculate the length of time (in days) each client stayed in the shelter
# Python code to find number of days between two given dates
def numOfDays(date1, date2): 
    return (date2-date1).days 


# In[8]:


# split 'Exit Date' to extract month, day, and year
split_exit_date = entry_exit['Exit Date'].str.split("/", n = 2, expand = True)
split_exit_date.head()

# split 'Entry Date' to extract month, day, and year
split_entry_date = entry_exit['Entry Date'].str.split("/", n = 2, expand = True)
split_entry_date.head()


# In[9]:


# Extract the year of exit
year_exit = split_exit_date[2]
year_exit

# Extract the month of exit
month_exit = split_exit_date[0]
month_exit

# Extract the day of exit
day_exit = split_exit_date[1]
day_exit

# Extract the year of entry
year_entry = split_entry_date[2]

# Extract the month of entry
month_entry = split_entry_date[0]

# Extract the day of entry
day_entry = split_entry_date[1]


# In[10]:


# identifying NaN values
print(year_exit.isnull())

# remove all rows with NaNs
year_exit = year_exit.dropna()
month_exit = month_exit.dropna()
day_exit = day_exit.dropna()

year_entry = year_entry.dropna()
month_entry = month_entry.dropna()
day_entry = day_entry.dropna()


# In[11]:


# Convert variables to integers
year_exit = year_exit.astype(int)
month_exit = month_exit.astype(int)
day_exit = day_exit.astype(int)

year_entry = year_entry.astype(int)
month_entry = month_entry.astype(int)
day_entry = day_entry.astype(int)


# In[13]:


# Another way to calculate days of stay
entry_exit[['Entry Date', 'Exit Date']] = entry_exit[['Entry Date', 'Exit Date']].apply(pd.to_datetime)
entry_exit['Days Stayed'] = entry_exit['Exit Date'] - entry_exit['Entry Date']
entry_exit.head()


# In[14]:


# Calculate the monthly incomes of each client at their time of entry
entry_income = pd.DataFrame(income_entry.groupby('Client ID')['Monthly Amount (Entry)'].sum())
entry_income.fillna(0, inplace = True)


# In[15]:


#  Calculate the number of noncash resources each client had at their time of entry
entry_noncash = noncash_entry.groupby('Client ID')['Receiving Benefit (Entry)'].apply(lambda x: (x=='Yes').sum()).reset_index(name='Number of Noncash at Entry')


# In[16]:


# Calculate number of disabilities each client had at their time of entry
entry_disability = disability_entry.groupby('Client ID')['Disability Determination (Entry)'].apply(lambda x: (x=='Yes').sum()).reset_index(name='Number of Disabilities at Entry')


# In[17]:


df1 = pd.merge(client, entry_exit, on='Client ID')
df2 = pd.merge(df1, entry_income, on='Client ID')
df3 = pd.merge(df1, entry_noncash, on='Client ID')
df4 = pd.merge(df2, entry_disability, on='Client ID')
df4.head()


# In[18]:


# Save the wrangled dataset into a new seperate file
df3.to_csv('/Users/September/Documents/GitHub/bios611-projects-fall-2019-September-C/project_3/data/new_dataset.tsv', sep = '\t')




