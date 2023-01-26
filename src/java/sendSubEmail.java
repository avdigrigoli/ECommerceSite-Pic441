package com.picturehouse.picturehouse441;

import com.picturehouse.picturehouse441.daos.OrderDao;
import com.picturehouse.picturehouse441.daos.eventDao;
import com.picturehouse.picturehouse441.daos.subscriberDao;
import com.picturehouse.picturehouse441.models.eventModel;
import com.picturehouse.picturehouse441.models.orderModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;
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

@WebServlet(name = "sendSubscriberEmail", urlPatterns = {"/sendSubscriberEmail"})
public class sendSubEmail extends HttpServlet {

    String name, subject, email, msg, product_link;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        deleteExpiredSubscriptions();
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        name = request.getParameter("name");
        email = request.getParameter("email");
        subject = request.getParameter("subject");
        msg = request.getParameter("message");
        product_link = request.getParameter("product_link");

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
        subscriberDao dao = new subscriberDao();
        ArrayList<Integer> idlist = dao.getIDs();
        for (int id : idlist) {
            String toemail = dao.getEmail(id);
            try {
                Random rand = new Random();
                int otpvalue = rand.nextInt(999999);
                insertSubOrder(request, response, toemail, otpvalue);
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toemail));
                MimeBodyPart textPart = new MimeBodyPart();
                Multipart multipart = new MimeMultipart();
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                eventDao eventDao = new eventDao(Utils.getConnection());
                eventModel theEvent = eventDao.getSingleProduct(product_id);
                String final_Text = "Dear Subscriber,\n\nPlease find here a one-time passcode for our Q&A with "+ theEvent.getGuest() + " on " + theEvent.getName() + ": " + otpvalue +"\n\nThe code must be entered exactly as written into the \"Redeem\" section of our website to join the event. Please only use that code at the time of the event.\n\nIf you have any questions, please let us know, and we look forward to having you with us!\n\nBest,\nPicturehouse 441";
                textPart.setText(final_Text);
                message.setSubject(subject);
                multipart.addBodyPart(textPart);
                message.setContent(multipart);
                //out.println("Sending");
                try {
                    Transport.send(message);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("admin_interface.jsp");
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

    protected void insertSubOrder(HttpServletRequest request, HttpServletResponse response, String subEmail, int otpvalue){
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String otp = String.valueOf(otpvalue);
        String date = LocalDate.now().toString();
        eventDao link_getter = new eventDao(Utils.getConnection());
        eventModel link = link_getter.getSingleProduct(product_id);
        String product_link = link.getLink();
        orderModel subOrder = new orderModel(product_id, product_link, subEmail, otp);
        subOrder.setDate(date);
        OrderDao addSubOrder = new OrderDao(Utils.getConnection());
        addSubOrder.insertOrder(subOrder, subEmail);
        addSubOrder.insertOrderDuplicate(subOrder, subEmail);
    }

    private static final String DELETE_EXPIRED = "DELETE FROM pic441.subscribers WHERE expiration_date < CAST(GETDATE() AS DATE)";

    protected void deleteExpiredSubscriptions(){
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(DELETE_EXPIRED)){
            preparedStatement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }

    }

}