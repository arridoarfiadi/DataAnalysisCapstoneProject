//Regression Model Number 1
reg dayssincepriororder saturday sunday monday tuesday thursday friday am12 am1 am2 am3 am4 am5 am6 am7 am8 am9 am10 am11 pm1 pm2 pm3 pm4 pm5 pm6 pm7 pm8 pm9 pm10 pm11 numofshort numoflong numofnocorr numofweak numofstrong itemonorder numofreordered, robust
//Regression Model Number 2
reg itemonorder saturday sunday monday tuesday thursday friday am12 am1 am2 am3 am4 am5 am6 am7 am8 am9 am10 am11 pm1 pm2 pm3 pm4 pm5 pm6 pm7 pm8 pm9 pm10 pm11 numofshort numoflong numofnocorr numofweak numofstrong numofreordered, robust

//INSERT NEW REGRESSION
//1 alone, 1 with Time, 1 with Day, 1 with Both 
//2 alone, 2 with Time, 2 with Day, 2 with Both 
