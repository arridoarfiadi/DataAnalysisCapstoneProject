import pandas as pd
import numpy as np
import csv


data = pd.read_csv("matrix.csv")
#data

with open('correlationMatrix.csv', 'w') as file:
    writer = csv.writer(file, delimiter=',', lineterminator='\n')

    #no corr. = 0
    #weak = 1
    #average = 2
    #strong = 3
    correlationTable = []

    for index, row in data.iterrows():
        #print("Row", index+1)
        temp = []
        for num in row:    
            if float(num) == 1.00:
                temp.append("itself")
            elif float(num) <= 0: #no correlation
                #print("no corr", num)
                temp.append("no corr")
            elif float(num) > 0 and float(num) <= 0.1:
                #print("weak", num)
                temp.append("weak")
            elif float(num) > 0.1 and float(num) <= 0.25:
                #print("average", num)
                temp.append("average")
            else:
                #print("strong", num)
                temp.append("strong")
        correlationTable.append(temp)
        writer.writerow(temp)
    
#print(correlationTable)
    

