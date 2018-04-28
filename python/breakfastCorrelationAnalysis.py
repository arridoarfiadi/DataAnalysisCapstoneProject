
# coding: utf-8

# In[24]:


import pandas as pd 

breakfast = pd.read_csv("breakfastComplete.csv", index_col=0)
breakfast


# In[21]:


breakfast.corr()

