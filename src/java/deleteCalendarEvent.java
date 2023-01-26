package com.picturehouse.picturehouse441;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;



@WebServlet(name = "deleteCal", value = "/deleteCal")
public class deleteCalendarEvent extends HttpServlet {

    private static final String DELETE_BLOG_SQL = "DELETE FROM pic441.calendar WHERE id = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        //String name = request.getParameter("name"+id);
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(DELETE_BLOG_SQL)){
            preparedStatement.setInt(1, Integer.parseInt(id));
            preparedStatement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("calendarOptions.jsp");


    }
}
