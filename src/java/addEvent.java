package com.picturehouse.picturehouse441;


import com.picturehouse.picturehouse441.daos.eventDao;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/add_event")
@MultipartConfig
public class addEvent extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private eventDao eventDao;

    public addEvent() {
    }

    public void init() {
        this.eventDao = new eventDao(Utils.getConnection());
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        insertUser(request, response);
    }

    public void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String date = request.getParameter("date");
        String description = request.getParameter("description");
        String guest = request.getParameter("guest");
        String guest_description = request.getParameter("guest_description");
        String platforms_to_watch = request.getParameter("platforms_to_watch");
        String active = request.getParameter("active");
        String link = request.getParameter("link");
        Part filePart = request.getPart("photo");
        String fileName = "/"+filePart.getSubmittedFileName()+".jpg";
        for(Part part: request.getParts()){
            part.write(getServletContext().getRealPath("/images") + fileName);
        }

        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://pic441.database.windows.net:1433;database=pic441;user=ant@pic441;password=December2900!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
            PreparedStatement ps = con.prepareStatement("insert into pic441.events(name, price, date, description," +
                    "guest, guest_description, platforms_to_watch, active, link, photo) values(?,?,?,?,?,?,?,?,?,?)");
            InputStream is = new FileInputStream(new File(getServletContext().getRealPath("/images") + fileName));
            ps.setString(1, name);
            ps.setDouble(2, Double.parseDouble(price));
            ps.setString(3, date);
            ps.setString(4, description);
            ps.setString(5, guest);
            ps.setString(6,guest_description);
            ps.setString(7, platforms_to_watch);
            ps.setString(8, active);
            ps.setString(9, link);
            ps.setBlob(10, is);
            ps.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();
        }

        String photo = request.getParameter("photo");
        response.sendRedirect("add_event.jsp");
    }



}