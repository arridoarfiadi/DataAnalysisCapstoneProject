import pandas as pd 

breakfast = pd.read_csv("breakfastComplete.csv", index_col=0)
breakfast #displays the data 

breakfast.corr() #correlation martrix of breakfast items

