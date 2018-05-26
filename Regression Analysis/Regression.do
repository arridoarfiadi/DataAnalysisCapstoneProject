//Regression Model Number 1
reg dayssincepriororder numofshort numoflong, robust
reg dayssincepriororder numofshort numoflong numofnocorr numofweak numofstrong, robust
reg dayssincepriororder numofshort numoflong numofnocorr numofweak numofstrong itemonorder, robust
reg dayssincepriororder numofshort numoflong numofnocorr numofweak numofstrong itemonorder numofreordered, robust
reg dayssincepriororder saturday sunday monday tuesday thursday friday numofshort numoflong numofnocorr numofweak numofstrong itemonorder numofreordered, robust
reg dayssincepriororder saturday sunday monday tuesday thursday friday am12 am1 am2 am3 am4 am5 am6 am7 am8 am9 am10 am11 pm1 pm2 pm3 pm4 pm5 pm6 pm7 pm8 pm9 pm10 pm11 numofshort numoflong numofnocorr numofweak numofstrong itemonorder numofreordered, robust
//Regression Model Number 2
reg itemonorder numofshort numoflong, robust
reg itemonorder numofshort numoflong numofnocorr numofweak numofstrong, robust
reg itemonorder numofshort numoflong numofnocorr numofweak numofstrong numofreordered, robust
reg itemonorder saturday sunday monday tuesday thursday friday numofshort numoflong numofnocorr numofweak numofstrong numofreordered, robust
reg itemonorder saturday sunday monday tuesday thursday friday am12 am1 am2 am3 am4 am5 am6 am7 am8 am9 am10 am11 pm1 pm2 pm3 pm4 pm5 pm6 pm7 pm8 pm9 pm10 pm11 numofshort numoflong numofnocorr numofweak numofstrong numofreordered, robust

//For outputing into Excelsssss
ssc install outreg2
outreg using documentName.xls
