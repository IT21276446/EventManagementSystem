package Vendor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;

public class AdvertisementDButil {
	
	
	public static boolean insertAdvertisement(int vid, String name, String title, String desc, float price, String attach)
	{
		
		boolean isSuccess = false;
		ArrayList<Advertisement> arr = new ArrayList<>();
		String url = "jdbc:mysql://localhost:3306/event_management_system";
		String user = "root";
		String pass = "eventmanagement123";

		
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection(url,user,pass);
				Statement stmt = con.createStatement();
				
				String sql = "insert into advertisement values(0, '"+vid+"', '"+price+"', '"+desc+"', NULL)";
				int rs = stmt.executeUpdate(sql);
				
				System.out.println(rs);
				
				if(rs > 0)
				{
					isSuccess = true;
				}
				else
				{
					isSuccess = false;
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		
	
		
		return isSuccess;
		
		
		
	}
				
}