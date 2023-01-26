package com.picturehouse.picturehouse441;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import com.picturehouse.picturehouse441.daos.OrderDao;
import com.picturehouse.picturehouse441.daos.adminUser_dao;
import com.picturehouse.picturehouse441.daos.eventDao;
import com.picturehouse.picturehouse441.daos.redeem_dao;
import com.picturehouse.picturehouse441.models.*;

@WebServlet(name = "redeem", urlPatterns = "/redeem")
public class redeem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Redeem Event!");
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");

        redeem_dao userDao = new redeem_dao();

        try {
            String link = userDao.checkRedeem(email, otp);

            response.sendRedirect(link);
            con = Utils.getConnection();
            pst = con.prepareStatement("delete from pic441.orders where otp=?");
            pst.setInt(1, Integer.parseInt(otp));
            pst.executeUpdate();


        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }

}
