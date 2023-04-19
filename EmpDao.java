package com.admin;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author 91963
 */
public class EmpDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/booking","root","root");
        }
        catch(ClassNotFoundException | SQLException e)
        {
        	System.out.println(e);
        }
        return con;
    }
    public static List<Emp> getRecords(int start,int total){
        List<Emp> list=new ArrayList<>();
        try
        {
            try (Connection con = getConnection()) {
                PreparedStatement ps=con.prepareStatement("select * from AddCurrency  limit "+(start-1)+","+total);
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    Emp e=new Emp();
                    e.setId(rs.getInt(1));
                    e.setCurrencyName(rs.getString(2));
                    e.setCurrencyCode(rs.getString(3));
                    list.add(e);
                }   }
        }
        catch(Exception e)
        {System.out.println(e);
        }
        return list;
    }
}