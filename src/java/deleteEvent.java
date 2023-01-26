package com.picturehouse.picturehouse441;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;



@WebServlet(name = "deleteEvent", value = "/deleteEvent")
public class deleteEvent extends HttpServlet {

    private static final String DELETE_EVENT_SQL = "DELETE FROM pic441.events WHERE id = ?";
    private static final String DELETE_ORDERS_SQL = "DELETE FROM pic441.orders WHERE product_id = ?";
    private static final String DELETE_QUESTIONS_SQL = "DELETE FROM pic441.questions WHERE product_id = ?";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try(
            PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(DELETE_EVENT_SQL)){
            preparedStatement.setInt(1, Integer.parseInt(id));
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement2 = Utils.getConnection().prepareStatement(DELETE_ORDERS_SQL);
            preparedStatement2.setInt(1, Integer.parseInt(id));
            preparedStatement2.executeUpdate();

            preparedStatement2 = Utils.getConnection().prepareStatement("DELETE  FROM pic441.ordersduplicate where product_id = ?");
            preparedStatement2.setInt(1, Integer.parseInt(id));
            preparedStatement2.executeUpdate();

            PreparedStatement preparedStatement3 = Utils.getConnection().prepareStatement(DELETE_QUESTIONS_SQL);
            preparedStatement3.setInt(1, Integer.parseInt(id));
            preparedStatement3.executeUpdate();



        }catch (Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("add_event.jsp");


    }
}
