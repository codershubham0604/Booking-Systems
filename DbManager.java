/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 *
 * @author Brijesh
 */
public class DbManager {
    Connection con=null; //Instance Variable
    public DbManager() throws ClassNotFoundException, SQLException
    {
        //Load the driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish the connection
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digitalhrdb", "root","");
    }
    public boolean insertUpdateDelete(String query)
    {
        try 
        {
            PreparedStatement ps=con.prepareStatement(query);
            int n=ps.executeUpdate();
            if(n>0)
                return true;
            else
                return false;
        } 
        catch (SQLException ex) 
        {
            return false;
        }
    }
    public ResultSet selectData(String query) throws SQLException
    {
       PreparedStatement ps=con.prepareStatement(query);
       ResultSet rs=ps.executeQuery();
       return rs;
    }
        
}
