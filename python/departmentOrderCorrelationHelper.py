#5/17/18
#Authors: Christine Nguyen and Arrido Arfiadi

import csv
import pandas as pd

def main():
    
    with open('test.csv', newline ='') as f:
        reader = csv.reader(f)
        headers = next(reader)
        
        column = {}
        for h in headers:
            column[h] = []
        department = [] #holds number of departments per order
        orderNum = []
        result = []
        
        for row in reader:
            department.append(row[1:])
            orderNum.append(row[0])
        departmentsInOrder = {}
        
        for i in range(len(orderNum)):
            temp = []
            for j in range (len(department[i])):
                if int((department[i][j]))>0 :
                    temp.append(headers[j+1])
            departmentsInOrder[i] = temp
    
        f.close()

    getAllOrders(departmentsInOrder,headers)

def getCorrelation(dep1,dep2, headers):
    matrix = []
    with open('correlationMatrix.csv', newline ='') as test:
        reader = csv.reader(test)
        for row in reader:
            matrix.append(row)
        index1 = headers.index(dep1)
        index2 = headers.index(dep2)
        return matrix[index1-1][index2-1]

def dictionaryHelper(deptsInAnOrder,i,headers):
    print ("OrderID", i+1)
    orderNum = i +1
    numOfWeak = 0
    numOfAverage = 0
    numOfStrong = 0
    numOfNoCorr = 0
    corrDepartmentOfOrder = []
    for i in range(len(deptsInAnOrder)):
        print(i)
        for j in range(i,len(deptsInAnOrder)):
            if deptsInAnOrder[i] == deptsInAnOrder[j]:
                pass
            else:
                corr = getCorrelation(deptsInAnOrder[i],deptsInAnOrder[j],headers)
                if corr == "no corr":
                    numOfNoCorr+=1
                elif corr == "weak":
                    numOfWeak+=1
                elif corr == "average":
                    numOfAverage+=1
                elif corr == "strong":
                    numOfStrong+=1
corrDepartmentOfOrder.append(orderNum)
corrDepartmentOfOrder.append(numOfNoCorr)
corrDepartmentOfOrder.append(numOfWeak)
corrDepartmentOfOrder.append(numOfAverage)
corrDepartmentOfOrder.append(numOfStrong)
print(corrDepartmentOfOrder)
with open('corrDepartmentOfOrder.csv', 'a') as file:
    writer = csv.writer(file, delimiter=',', lineterminator='\n')
    writer.writerow(corrDepartmentOfOrder)


def getAllOrders(departmentsInOrder,headers):
    for i in departmentsInOrder:
        dictionaryHelper(departmentsInOrder[i],i,headers)

if __name__ == "__main__":
    main()

