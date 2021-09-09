<%-- 
    Document   : update
    Created on : Aug 19, 2021, 12:04:22 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if(request.getParameter("submit") != null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
        pst = con.prepareStatement("update records set stname = ?,course=?,fee=? where id = ?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();  
        %>
            <script>
                alert("Record updated...");
            </script>
        <%
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    </head>
    <body>
          <h1 style="text-align: center">Student Update</h1>
        <br>
        <div class="row">
            <div class="col-sm-4" style="margin:10px 0px 20px 450px">
                <form  method="POST" action="#">
                    
                    <% 
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
                        String id = request.getParameter("id");
                        pst = con.prepareStatement("select * from records where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next())
                        { 
                        %>
                    <div alight="left">
                        <label class="form-label" for="sname">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" id="sname" name="sname" value="<%= rs.getString("stname")%>" required>
                    </div>
                    <br>
                    <div alight="left">
                        <label class="form-label" for="course">Course</label>
                        <input type="text" class="form-control" placeholder="Course" id="course" name="course" value="<%= rs.getString("course")%>" required>
                    </div>
                    <br>
                    <div alight="left">
                        <label class="form-label" for="fee">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" id="fee" name="fee" value="<%= rs.getString("fee")%>" required>
                    </div>
                       <% 
                        }
                       %>
                    <br>
                     <div alight="right">
                        <input type="submit" class="btn btn-info" value="submit" id="submit" name="submit" required>
                        <input type="reset" class="btn btn-warning" value="reset" id="reset" name="reset" required>   
                     </div>
                    <div allign="right">
                        <p><a href="index.jsp">Back</a></p>
                    </div>
                 
                </form>
            </div>
    </body>
</html>
