package com.picturehouse.picturehouse441;

import com.picturehouse.picturehouse441.daos.eventDao;
import com.picturehouse.picturehouse441.models.eventModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;



@WebServlet(name = "archiveEvent", value = "/archiveEvent")
public class archiveEvent extends HttpServlet {

    private static final String ACTIVE_TO_ARCHIVE_SQL = "UPDATE pic441.events SET active = 'archive' WHERE id = ?";
    private static final String ARCHIVE_TO_ACTIVE_SQL = "UPDATE pic441.events SET active = 'active' WHERE id = ?";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        eventDao checker = new eventDao(Utils.getConnection());
        eventModel switcher = checker.getSingleProduct(Integer.parseInt(id));
        if(switcher.getActive().equals("active")) {
            try (
                    PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(ACTIVE_TO_ARCHIVE_SQL)) {
                preparedStatement.setInt(1, Integer.parseInt(id));
                preparedStatement.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (switcher.getActive().equals("archive")) {
            try (
                    PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(ARCHIVE_TO_ACTIVE_SQL)) {
                preparedStatement.setInt(1, Integer.parseInt(id));
                preparedStatement.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("add_event.jsp");


    }
}
