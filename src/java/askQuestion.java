package com.picturehouse.picturehouse441;

import com.picturehouse.picturehouse441.daos.eventDao;
import com.picturehouse.picturehouse441.models.eventModel;
import com.picturehouse.picturehouse441.models.orderModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/askquestion")
public class askQuestion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public askQuestion() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("otp");
        orderModel comparePass = checkPassword(password);
        String destPage = "questions.jsp";
        if (String.valueOf(comparePass.getOtp()).equals(password)) {
            request.getSession().setAttribute("eventpassword", password);
            eventDao productname = new eventDao(Utils.getConnection());
            eventModel pname = productname.getSingleProduct(comparePass.getProduct_id());
            request.getSession().setAttribute("eventname", pname.getName());
            destPage = "questions.jsp";
            request.getSession().removeAttribute("error");
        } else {
            request.getSession().setAttribute("error", "Incorrect Password!");
        }
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
    }


    private static final String INSERT_SQL = "insert into pic441.questions(product_id, customer_name," +
            "question) values(?,?,?)";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String question = request.getParameter("question");
        String product_name = (String) request.getSession().getAttribute("eventname");
        eventDao eventFinder = new eventDao(Utils.getConnection());
        eventModel eventInfo = eventFinder.getSingleProduct(product_name);
        int product_id = eventInfo.getId();
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(INSERT_SQL)){
            preparedStatement.setInt(1, product_id);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, question);
            preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        request.getSession().removeAttribute("eventpassword");
        request.getSession().removeAttribute("eventname");
        response.sendRedirect("questionReceived.jsp");

    }


    public static orderModel checkPassword(String otp){
        String realpassword = "failed";
        orderModel row = new orderModel();
        int chekerpassword = Integer.parseInt(otp);
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from pic441.orders where otp = " + chekerpassword);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                realpassword = rs.getString("otp");
                row.setId(rs.getInt("id"));
                row.setProduct_id(rs.getInt("product_id"));
                row.setProduct_link(rs.getString("product_link"));
                row.setEmail(rs.getString("email"));
                row.setOtp(rs.getString("otp"));
                row.setDate(rs.getString("date"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        if(String.valueOf(chekerpassword).equals(realpassword)){
            return row;
        }
        return row;
    }
}

