import csv

def main():
    test = open('test.csv', 'rb', 8)
    reader = csv.reader(test)
    headers = reader.next()

    column = {}
    for h in headers:
        column[h] = []
    department = []
    orderNum = []
    result = []


    for row in reader:
        department.append(row[1:])
        orderNum.append(row[0])

    for i in range(len(orderNum)):
        temp = []
        for j in range (len(department[i])):
            if int((department[i][j]))>0 :
                temp.append(headers[j+1])
        result.append(temp)
    print(result)
    print(orderNum)

def getCorrelation(dep1,dep2):


if __name__ == "__main__":
    main()