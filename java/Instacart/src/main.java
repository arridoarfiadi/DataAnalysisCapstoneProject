import java.io.FileWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

import com.mysql.jdbc.Connection;

public class main {
    public static void main(String[] args){
        for (int i=1; i <= 49688; i++){
            query(i);
        }


    }
    public static void query(int product_id){
        PreparedStatement myStatement = null;

        ResultSet myResult =null;
        Connection conn;
        String host = "jdbc:mysql://instacart.cbvhsm9drvzt.us-east-2.rds.amazonaws.com:3306/Instacart";
        String username =  "uwb_instacart";
        String password= "1g*MIh$a3k";
        try {
            conn = (Connection) DriverManager.getConnection(host, username, password);

            myStatement = conn.prepareStatement("select d.department_name,p.product_name, sum(op.add_to_cart_order) from  Products p, Order_Products op, Departments d where op.product_id = p.product_id and d.department_id = p.department_id and p.product_id = ?;");
            myStatement.setInt(1, product_id);
            myResult = myStatement.executeQuery();
            ResultSetMetaData myResultMeta = myResult.getMetaData();
            int columnsNumber = myResultMeta.getColumnCount();
            FileWriter pw = new FileWriter("amountBought.csv", true);
            StringBuilder sb = new StringBuilder();
            while (myResult.next()) {
                for (int i = 1; i <= columnsNumber; i++) {
                    if (i > 1){
                        System.out.print("/  ");
                        sb.append('/');
                    }

                    String columnValue = myResult.getString(i);
                    System.out.print(columnValue);
                    sb.append(columnValue);

                }
                System.out.println("");
            }
            sb.append('\n');
            pw.write(sb.toString());
            pw.close();
        }
        catch (Exception e){
            System.out.println("DB not connected");

        }
    }
    }



