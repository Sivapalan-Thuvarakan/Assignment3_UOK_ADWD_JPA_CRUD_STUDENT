
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--import of sql packages-->
<%@page import="java.sql.*"%>

<%
    if(request.getParameter("submit") != null)
    {
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
        pst = con.prepareStatement("insert into records(stname,course,fee)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();  
        %>
            <script>
                alert("Record added...");
            </script>
        <%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1 style="text-align: center">Student Registration System</h1>
        <br>
        <div class="row">
            <div class="col-sm-4" style="margin:10px 0px 20px 450px">
                <form  method="POST" action="#">
                    <div alight="left">
                        <label class="form-label" for="sname">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" id="sname" name="sname" required>
                    </div>
                    <br>
                    <div alight="left">
                        <label class="form-label" for="course">Course</label>
                        <input type="text" class="form-control" placeholder="Course" id="course" name="course" required>
                    </div>
                    <br>
                    <div alight="left">
                        <label class="form-label" for="fee">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" id="fee" name="fee" required>
                    </div>
                    <br>
                     <div alight="right">
                        <input type="submit" class="btn btn-info" value="submit" id="submit" name="submit" required>
                        <input type="reset" class="btn btn-warning" value="reset" id="reset" name="reset" required>   
                     </div>
                </form>
            </div>
            <div class="col-sm-8" style="margin:10px 0px 10px 200px">
                
                <div class="panel-body">
                    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            <%
                                                Connection con;
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
                                                
                                                String query = "select * from records";
                                                Statement st = con.createStatement();
                                                rs = st.executeQuery(query);
                                                
                                                while(rs.next())
                                                {
                                                    String id = rs.getString("id");
                                                
                                                

                            %>
                            <tr>
                                 <td><%=rs.getString("stname") %></td>
                                 <td><%=rs.getString("course") %></td>
                                 <td><%=rs.getString("fee") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                            </tr>          
                            <%
                                    }
                            %>
                            
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>