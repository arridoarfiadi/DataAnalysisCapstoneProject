import pandas as pd 

#pd.options.display.max_columns = 50
#pd.options.display.max_rows = 50

breakfast = pd.read_csv("breakfastComplete25.csv", index_col=0)
breakfast #displays the data 

breakfast.corr() #correlation martrix of breakfast items
