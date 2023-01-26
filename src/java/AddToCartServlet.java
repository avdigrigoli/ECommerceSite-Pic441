package com.picturehouse.picturehouse441;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.picturehouse.picturehouse441.models.*;


@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
//        	out.print("add to cart servlet");

            ArrayList<cartModel> cartList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            cartModel cm = new cartModel();
            cm.setId(id);
            cm.setQuantity(1);
            HttpSession session = request.getSession();
            ArrayList<cartModel> cart_list = (ArrayList<cartModel>) session.getAttribute("cart-list");
            if (cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect("shop.jsp");
            } else {
                cartList = cart_list;

                boolean exist = false;
                for (cartModel c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('ITEM ALREADY IN CART');");
                        out.println("location='checkout.jsp';");
                        out.println("</script>");
                     }
                }

                if (!exist) {
                    cartList.add(cm);
                    response.sendRedirect("shop.jsp");
                }
            }
        }
    }

}
