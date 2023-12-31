<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.customerevent.*"%>
     <%@ page import="java.sql.*"%>
     <%@page import="java.sql.DriverManager"%>
	 <%@page import="java.sql.ResultSet"%>
	 <%@page import="java.sql.Statement"%>
	 <%@page import="java.sql.Connection"%>
	
    <%
    
     String url = "jdbc:mysql://localhost:3306/event_management_system";
	 String user = "root";
	 String pass = "eventmanagement123";
	 
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e) {
			System.out.println("Database connection unsuccessful!");
		}
		
		
    
     	Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
    
    %>
    

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>EVENTS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../CSS/eventspage.css">
        <script src="https://kit.fontawesome.com/dbed6b6114.js""></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        
         <style>
         
    	.black_overlay {
		  display: none;
		  position: absolute;
		  top: 0%;
		  left: 0%;
		  width: 100%;
		  height: 100%;
		  background-color: black;
		  z-index: 1001;
		  -moz-opacity: 0.8;
		  opacity: .80;
		  filter: alpha(opacity=80);
		}
		
		.white_content {
		  display: none;
		  position: absolute;
		  top: 25%;
		  left: 30%;
		  width: 40%;
		  height: 30%;
		  padding: 16px;
		  background-color: white;
		  z-index: 1002;
		  overflow: auto;
		}
		
		/* CSS */
		.button-50 {
		  appearance: button;
		  background-color: #000;
		  background-image: none;
		  border: 1px solid #000;
		  border-radius: 4px;
		  box-shadow: #fff 4px 4px 0 0,#000 4px 4px 0 1px;
		  box-sizing: border-box;
		  color: #fff;
		  cursor: pointer;
		  display: inline-block;
		  font-family: ITCAvantGardeStd-Bk,Arial,sans-serif;
		  font-size: 14px;
		  font-weight: 400;
		  line-height: 20px;
		  margin: 60px 40px 10px 0;
		  overflow: visible;
		  padding: 12px 40px;
		  text-align: center;
		  text-transform: none;
		  touch-action: manipulation;
		  user-select: none;
		  -webkit-user-select: none;
		  vertical-align: middle;
		  white-space: nowrap;
		}

		.button-50:focus {
		  text-decoration: none;
		}
		
		.button-50:hover {
		  text-decoration: none;
		}
		
		.button-50:active {
		  box-shadow: rgba(0, 0, 0, .125) 0 3px 5px inset;
		  outline: 0;
		}
		
		.button-50:not([disabled]):active {
		  box-shadow: #fff 2px 2px 0 0, #000 2px 2px 0 1px;
		  transform: translate(2px, 2px);
		}
		
		@media (min-width: 768px) {
		  .button-50 {
		    padding: 12px 50px;
		  }
		}
	

    
    </style>
    
    </head>
    
    
    <body>
     <div id="light" class="white_content"><a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"></a>
	  <h1>Sign In As</h1>
	  <button class="button-50" role="button" id = "myButton1">Customer</button>
	  <button class="button-50" role="button" id = "myButton2">Vendor</button>
	  </div>
  <div id="fade" class="black_overlay"></div>
  
  <script type="text/javascript">
    document.getElementById("myButton1").onclick = function () {
        location.href = "CLoginSignup.jsp";
    };
    
    document.getElementById("myButton2").onclick = function () {
        location.href = "VLoginSignup.jsp";
    };
 </script>
		
  <header >
    <div class="navbar">
            <div class = "logo">
                <img src = "../Images/logo.png">
            </div>
                    <nav>
                        <ul>
                            <li> <a href="Home.jsp" class="navItem">HOME</a></li>
                            <li> <a href="#"class="navItem">EVENTS</a></li>
                            <li> <a href="Gallery1.jsp"class="navItem">GALLERY</a></li>
                            <li> <a href="About_Us.jsp" class="navItem">ABOUT US</a></li>
                            <li> <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" class = "navItem">SIGN IN</a></li>
                        </ul>
                    </nav>
                    
                    <div class = "overlay" id = "divOne">
                    	<div class  = "wrapper">
                    		<button>Log In as Customer</button>
                    		<button>Log In as Vendor</button>
                    	</div>			
					</div>
        </div> 
</header>
		<br><br><br><br><br><br><br><br>
		<h1>EVENTS</h1>
  		<br><br>
  <div class="row">
  <div class="column">
    <img src="../Images/img1.jpg" alt="Snow" style="width:90%">
  </div>
  <div class="column">
    <img src="../Images/img2.jpg" alt="Forest" style="width:90%">
  </div>
  <div class="column">
    <img src="../Images/img3.jpg" alt="Mountains" style="width:90%">
  </div>
</div>
		<br><br>
		
		
		
       
        <%
                    
            try{
                    	
                   con = DriverManager.getConnection(url, user, pass);
                   stmt = con.createStatement();
                  	 	
                   String sql = "select * from category ";
                    	
                   rs = stmt.executeQuery(sql);
                  	 	
                   while(rs.next()){ %>
                   
                    <h1><%= rs.getString("Cat_Name") %></h1>
               			<br>
                	   <div class="tete">
                	   <%= rs.getString("Description") %>
                	   
                	   </div>
     					<br>
                   <% }
      
        
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        
            %>
       
        <br><br>
        
         <footer>
    <img class="logo1" src="../Images/logo.png" >
    <p id="cprt">Copyright � 2022 Eventrra. Website design & management by Team 1.</p>
    <div class="social-container">
        <ul class="social-icons">
            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
        </ul>
    </div>    
    

</footer>
        
    </body>
</html>
    