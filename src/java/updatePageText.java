package com.picturehouse.picturehouse441;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;



@WebServlet(name = "updateText", value = "/updateText")
public class updatePageText extends HttpServlet {

    private static final String UPDATE_TEXT_SQL = "UPDATE pic441.pages SET text = ? WHERE id = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String text = request.getParameter("text");
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(UPDATE_TEXT_SQL)){
            preparedStatement.setString(1, text);
            preparedStatement.setInt(2, Integer.parseInt(id));
            preparedStatement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            System.err.println(e);
        }

        response.sendRedirect("interfaceLayout.jsp");


    }
}
