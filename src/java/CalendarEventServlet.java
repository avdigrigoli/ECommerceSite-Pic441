package com.picturehouse.picturehouse441;

import com.picturehouse.picturehouse441.daos.CalendarEventDAO;
import com.picturehouse.picturehouse441.models.CalendarEvent;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalendarEventServlet", value = "/CalendarEventServlet")
public class CalendarEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        insertCalendarEvent(request, response);
    }

    public void insertCalendarEvent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String type = request.getParameter("type");
        String color = request.getParameter("color");
        String time = request.getParameter("time");
        CalendarEventDAO.addCalendarEvent(new CalendarEvent(name, description, date, type, color, time));
        response.sendRedirect("calendarOptions.jsp");
    }
}
