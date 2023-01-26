package com.picturehouse.picturehouse441;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;

import static java.lang.System.out;


@WebServlet(name = "unsubscribe", value = "/unsubscribe")
public class unsubscribe extends HttpServlet {

    private static final String DELETE_BLOG_SQL = "DELETE FROM pic441.newsletter WHERE email = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(DELETE_BLOG_SQL)){
            preparedStatement.setString(1, email);
            preparedStatement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("index.jsp");
    }
}
