package com.picturehouse.picturehouse441;

import java.time.LocalDate;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import com.picturehouse.picturehouse441.daos.*;
import com.picturehouse.picturehouse441.models.*;
import com.stripe.Stripe;
import com.stripe.model.Charge;



@WebServlet(name = "subscription-payment", urlPatterns = "/subscription-payment")
public class subscribeCheckout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private subscriberDao sub_dao;

    public void init(){this.sub_dao = new subscriberDao();}



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subscriptionType = "none";
        String price = "0000";
        if(request.getParameter("subscriptionType").equals("onemonth")){
            subscriptionType = "onemonth";
            price = "1500";
        }
        else if(request.getParameter("subscriptionType").equals("sixmonth")){
            subscriptionType = "sixmonth";
            price = "15000";
        }
        else if(request.getParameter("subscriptionType").equals("oneyear"))
        {
            subscriptionType = "oneyear";
            price = "25000";
        }
        else{
            response.sendRedirect("error.jsp");
            return;
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");// Set response content type
        String title = "Stripe payment";
        String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";

        try {

            Stripe.apiKey = getServletContext().getInitParameter("stripeSecretKey");
            Map<String, String[]> httpParameters = request.getParameterMap();

            //extract request parameters
            Map<String, Object> userBillingData = new HashMap<>();
            String userEmail = httpParameters.get("stripeEmail")[0];
            userBillingData.put("email", userEmail);
            userBillingData.put("stripeToken", httpParameters.get("stripeToken")[0]);

            Map<String, Object> params = new HashMap<>();
            //System.out.println(total);
            params.put("amount", price); // or get from request
            params.put("currency", "usd");  // or get from request
            params.put("source", userBillingData.get("stripeToken"));// or get from request
            params.put("receipt_email", userEmail);

            Charge charge;

            charge = Charge.create(params);

            String chargeID = charge.getId();

            switch (subscriptionType) {
                case "onemonth": {
                    insertSub1month(request, response, userEmail);
                    String message = "Hello,\n\nThank you for your subscription purchase! Your subscription will be active until "+ LocalDate.now().plusMonths(1) + ". Until then, you will be sent one-time passcodes to join all events held in that time period.\n\nIf you have any questions, please let us know, and thank you again for joining us!\n\nBest,\nPicturehouse 441";
                    sendEmail(request, response, userEmail, userEmail, "Your Picturehouse 441 Subscription Confirmation", message);
                    break;
                }
                case "sixmonth": {
                    insertSub6month(request, response, userEmail);
                    String message = "Hello,\n\nThank you for your subscription purchase! Your subscription will be active until "+ LocalDate.now().plusMonths(6) + ". Until then, you will be sent one-time passcodes to join all events held in that time period.\n\nIf you have any questions, please let us know, and thank you again for joining us!\n\nBest,\nPicturehouse 441";
                    sendEmail(request, response, userEmail, userEmail, "Your Picturehouse 441 Subscription Confirmation", message);
                    break;
                }
                case "oneyear": {
                    insertSub12month(request, response, userEmail);
                    String message = "Hello,\n\nThank you for your subscription purchase! Your subscription will be active until "+ LocalDate.now().plusMonths(12) + ". Until then, you will be sent one-time passcodes to join all events held in that time period.\n\nIf you have any questions, please let us know, and thank you again for joining us!\n\nBest,\nPicturehouse 441";
                    sendEmail(request, response, userEmail, userEmail, "Your Picturehouse 441 Subscription Confirmation", message);
                    break;
                }
                default:
                    response.sendRedirect("error.jsp");
                    return;
            }

        } catch (Exception ex) {
            response.sendRedirect("error.jsp");
            //out.println(ex);
        }
    }

    public void insertSub1month(HttpServletRequest request, HttpServletResponse response, String email) throws IOException{
        sub_dao.insertSub1month(new subscriberModel(email, String.valueOf(LocalDate.now())));
        response.sendRedirect("confirmation.jsp");
    }

    public void insertSub6month(HttpServletRequest request, HttpServletResponse response, String email) throws IOException{
        sub_dao.insertSub6month(new subscriberModel(email, String.valueOf(LocalDate.now())));
        response.sendRedirect("confirmation.jsp");
    }

    public void insertSub12month(HttpServletRequest request, HttpServletResponse response, String email) throws IOException{
        sub_dao.insertSub12month(new subscriberModel(email, String.valueOf(LocalDate.now())));
        response.sendRedirect("confirmation.jsp");
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
        } catch (Exception e) {
            out.println(e);
        }
    }



}