#Author: Christine Nguyen
#5/10/2018

#Description - This code reads in total purchases per department
#and reads it into a data frame. Then, we use the data frame to 
#conduct correlation analysis amongst the 21 departments

import pandas as pd 
import matplotlib.pyplot as plt
pd.options.display.max_columns = 50
pd.options.display.max_rows = 50

departments = pd.read_csv("departmentCorr.csv", index_col=0)
#departments
departments.corr()
