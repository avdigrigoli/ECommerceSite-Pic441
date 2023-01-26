<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%@ page import="com.picturehouse.picturehouse441.models.textEditModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Text Editor</title>

    <%@include file="head.jsp"%>

    <style>
        p{
            color: #122558;
        }

        h1,h2,h3,h4{
            color: #122558;
        }
    </style>
</head>
<script>
    function updateConfirm() {
        alert("Successfully Updated!");
    }
</script>
<body style="background-color: #fff4e9">
<%
    adminUser user = (adminUser) session.getAttribute("user");
    if(user != null)
    {

%>
<%@include file="navbar2.jsp"%>

<br>
<h3 style="text-align: center">Text Edit Options</h3>
<br>
<div id="adminoptions" style="text-align: center">
    <a id="adminoptionsbutton"  class="btn btn-main text-center" href="admin_interface.jsp"> Back to Options Menu </a>
</div>
<br>

<p style="text-align: center"> To skip a line write "br" between "<>" in the text field below. To put in italics, write "i" between
"<>" in the beginning of the italics and "/i" between "<>" at then end of the italics.</p>

<div style="width: 75%; margin-left: auto; margin-right: auto">
    <table class="table table-hover table-dark" border="1">
        <thead>
        <tr>
            <th> ID </th>
            <th> Page </th>
            <th> Text </th>
            <th> Update </th>
        </tr>
        </thead>
        <tbody>
        <% textEditDao pd = new textEditDao();
            List<textEditModel> products = pd.getAllText();
            if(!products.isEmpty()){
                //Collections.reverse(products);
                for(textEditModel p : products){
                    int id = p.getId();
                    String pagename = p.getPage();
                    String text = p.getText();

        %>
        <tr>
            <td><form id="form<%=id%>" action="updateText"><input type="hidden" name="id" value="<%=id%>" /></form><%= id%></td>
            <td><%=pagename%></td>
            <td><textarea style="width: 100%" form="form<%=id%>" type="text" name="text" value="<%=text%>" placeholder="<%=text%>"><%=text%></textarea></td>
            <td><input form="form<%=id%>" type="submit" value="Update" onclick="updateConfirm()"/></td>


        </tr>
        </tbody>
        <% }} %>
    </table>
</div>
<%@include file="footer.jsp"%>
<%
}
else
{


%>
<section class="page-404" style="background-color: #f6eee3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="index.jsp">
                    <img src="images/smalllogo2.jpg" width="25%" alt="site logo" />
                </a>
                <h2 style="color: #122558; font-size: xx-large">Access Denied</h2>
                <br>
                <h4 style="color: #122558">You're not supposed to be here ;)</h4>
                <a href="index.jsp" class="btn btn-main" style="background-color: #122558"><i class="tf-ion-android-arrow-back"></i> Home</a>
                <p class="copyright-text">Copyright &#169; 2022, Designed & Developed for PICTUREHOUSE441</p>
            </div>
        </div>
    </div>
</section>
<%
    }
%>


</body>
</html>
