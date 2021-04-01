<%-- 
    Document   : update
    Created on : Mar 31, 2021, 5:01:04 PM
    Author     : lenovo
--%>
<%@page import="java.sql.*" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 

    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_crud","root","paimon");
        pst = con.prepareStatement("update records set stname = ?, course = ?, fee = ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Updatedd");     
    </script> 
    <%             
    }
   %>
















<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Student Update</h1>
        
        
        
        <div class="row">
             <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_crud","root","paimon");
                    
                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("select * from records where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                            while(rs.next())
                            {
                    
                    
                    %>

                    
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("stname")%>" name="sname" id="sname" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" value="<%= rs.getString("course")%>" name="course" id="course" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%= rs.getString("fee")%>" name="fee" id="fee" required >
                     </div>
                    
                    <% } %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>
                         
                         <div align="right">
                             
                             <p><a href="index.jsp">Click Back</a></p>
                             
                         </div>
                         
                         
                         
                         
                </form>
            </div>
        </div>
    </body>
</html>
