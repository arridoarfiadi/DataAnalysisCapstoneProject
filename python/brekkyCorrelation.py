import pandas as pd
#import numpy as np


breakfast = pd.read_csv("breakfastCorr.csv", index_col=0)
print(breakfast)

#breakfast.corr()
#print(breakfast['Cereal_Amount'] #for a specific columnm
#print(breakfast.loc[472] #for a specific row/observation
#print(breakfast.loc[[472]]) #to display data in a nice pretty data frame
