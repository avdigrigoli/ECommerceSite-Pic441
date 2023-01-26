package com.picturehouse.picturehouse441;


/*
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.OrderDao;
import cn.techtutorial.model.*;
import com.picturehouse.picturehouse441.models.cartModel;
import com.picturehouse.picturehouse441.models.orderModel;


@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
            String email = request.getParameter("email");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            ArrayList<cartModel> cart_list = (ArrayList<cartModel>) request.getSession().getAttribute("cart-list");
            if(cart_list != null) {
                for(cartModel c:cart_list) {
                    Random rand = new Random();
                    int otpvalue = rand.nextInt(999999);
                    orderModel order = new orderModel();
                    order.setId(c.getId());
                    order.setProduct_id(c.getName());
                    order.setProduct_link(c.getLink());
                    order.setEmail(email);
                    order.setOtp(String.valueOf(otpvalue));
                    order.setDate(formatter.format(date));

                    OrderDao oDao = new OrderDao(DbCon.getConnection());
                    boolean result = oDao.insertOrder(order);
                    if(!result) break;
                }
                cart_list.clear();
                response.sendRedirect("orders.jsp");
            }else {
                if(auth==null) {
                    response.sendRedirect("login.jsp");
                }
                response.sendRedirect("cart.jsp");
            }
        } catch (ClassNotFoundException|SQLException e) {

            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}

 */

