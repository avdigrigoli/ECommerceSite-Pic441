package com.picturehouse.picturehouse441;

import com.picturehouse.picturehouse441.daos.eventDao;
import com.picturehouse.picturehouse441.models.eventModel;
import com.picturehouse.picturehouse441.models.orderModel;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
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
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Properties;




@WebServlet(name = "adminAddOrder", value = "/adminAddOrder")
public class manualAddOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final Connection con = Utils.getConnection();

    private PreparedStatement pst;
    private ResultSet rs;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        String date = LocalDate.now().toString();
        eventDao link_getter = new eventDao(Utils.getConnection());
        eventModel link = link_getter.getSingleProduct(product_id);
        String product_link = link.getLink();
        orderModel model = new orderModel(product_id, product_link, email, otp);
        model.setDate(date);
        insertOrder(model, email);
        insertOrderDuplicate(model, email);
        eventModel infoPuller = link_getter.getSingleProduct(product_id);
        String otpemail = "Hello, \n\nPlease find here a one-time passcode for our Q&A with " + infoPuller.getGuest()+ " on " + infoPuller.getName() + ": " + otp + "\n\nThe code must be entered exactly as written into the \"Redeem\" section of our website to join the event. Please only use that code at the time of the event.\n\nIf you have any questions, please let us know, and we look forward to having you with us!\n\nBest,\nPicturehouse 441";
        sendEmail(request,response, "customer_name", email, "Your Picturehouse 441 One-Time Passcode", otpemail);
        response.sendRedirect("orderBackups.jsp");
    }

    public void insertOrder(orderModel model, String email) {
        try {
            String query = "insert into pic441.orders (product_id, product_link, email, otp, date) values(?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getProduct_id());
            pst.setString(2, model.getProduct_link());
            pst.setString(3, email);//model.getEmail());
            pst.setString(4,model.getOtp());
            pst.setString(5, model.getDate());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void insertOrderDuplicate(orderModel model, String email) {

        try {
            String query2 = "insert into pic441.ordersDuplicate (product_id, product_link, email, otp, date) values(?,?,?,?,?)";
            pst = this.con.prepareStatement(query2);
            pst.setInt(1, model.getProduct_id());
            pst.setString(2, model.getProduct_link());
            pst.setString(3, email);//model.getEmail());
            pst.setString(4,model.getOtp());
            pst.setString(5, model.getDate());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }


    protected void sendEmail(HttpServletRequest request, HttpServletResponse response, String name, String email, String subject, String msg) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        // String name = request.getParameter("name");
        // String email = request.getParameter("email");
        // String subject = request.getParameter("subject");
        // String msg = request.getParameter("message");

        final String username = "info@picturehouse441.com";//your email id
        final String password = "muzqfzsgugwxcwwa";// your password
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "*");

        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text = msg;
            textPart.setText(final_Text);
            message.setSubject(subject);
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
            //out.println("Sending");
            try {
                Transport.send(message);
            }
            catch (MessagingException e) {
                e.printStackTrace();
            }
            //out.println("<center><h2 style='color:green;'>Email Sent Successfully.</h2>");
            //out.println("Thank you " + name + ", your message has been submitted to us.</center>");
        } catch (Exception e) {
            out.println(e);
        }
    }
}
