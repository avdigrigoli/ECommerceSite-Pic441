package com.picturehouse.picturehouse441;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;



@WebServlet(name = "deleteOrder", value = "/deleteOrder")
public class deleteOrder extends HttpServlet {

    private static final String DELETE_BLOG_SQL = "DELETE FROM pic441.ordersduplicate WHERE id = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(DELETE_BLOG_SQL)){
            preparedStatement.setInt(1, Integer.parseInt(id));
            preparedStatement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("orderBackups.jsp");


    }
}
