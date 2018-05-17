# 5/17/18
# Authors: Christine Nguyen and Arrido Arfiadi

import csv


def main():
    with open('test.csv', newline='') as f:
        reader = csv.reader(f)
        headers = next(reader)

        column = {}
        for h in headers:
            column[h] = []
        department = []  # holds number of departments per order
        orderNum = []
        result = []

        for row in reader:
            department.append(row[1:])
            orderNum.append(row[0])
        departmentsInOrder = {}

        for i in range(len(orderNum)):
            temp = []
            for j in range(len(department[i])):
                if int((department[i][j])) > 0:
                    temp.append(headers[j + 1])
            departmentsInOrder[i] = temp

        f.close()

        getAllOrders(departmentsInOrder, headers)


def getNature(dep, headers):
    matrix = []
    with open('nature.csv', newline='') as test:
        reader = csv.reader(test)
        for row in reader:
            matrix.append(row)
        index1 = headers.index(dep)
        nature = (matrix[index1-1][1])
        return nature



def dictionaryHelper(deptsInAnOrder, i, headers):
    print ("OrderID", i+1)
    orderNum = i + 1
    numOfAverage = 0
    numOfLong = 0
    numOfShort = 0
    natureOfOrder = []
    for i in range(len(deptsInAnOrder)):

        nature = getNature(deptsInAnOrder[i], headers)
        if "short" in nature.lower():
            numOfShort += 1
        elif "average" in nature.lower():
            numOfAverage += 1
        elif "long" in nature.lower():
            numOfLong += 1
    natureOfOrder.append(orderNum)
    natureOfOrder.append(numOfShort)
    natureOfOrder.append(numOfAverage)
    natureOfOrder.append(numOfLong)
    print(natureOfOrder)
    with open('natureOfOrders.csv', 'a') as file:
        writer = csv.writer(file, delimiter=',', lineterminator='\n')
        writer.writerow(natureOfOrder)

def getAllOrders(departmentsInOrder, headers):
    for i in departmentsInOrder:
        dictionaryHelper(departmentsInOrder[i], i, headers)


if __name__ == "__main__":
    main()
