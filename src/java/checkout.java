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
import com.picturehouse.picturehouse441.daos.OrderDao;
import com.picturehouse.picturehouse441.daos.eventDao;
import com.picturehouse.picturehouse441.daos.newsdao;
import com.picturehouse.picturehouse441.models.*;
import com.stripe.Stripe;
import com.stripe.model.Charge;
import com.stripe.model.issuing.Cardholder;


@WebServlet(name = "checkout", urlPatterns = "/checkout")
public class checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");// Set response content type
        String title = "Stripe payment";
        String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n\n";

        try {

            Stripe.apiKey = getServletContext().getInitParameter("stripeSecretKey");
            Map<String, String[]> httpParameters = request.getParameterMap();

            //extract request parameters
            Map<String, Object> userBillingData = new HashMap<>();
            String userEmail = httpParameters.get("stripeEmail")[0];
            userBillingData.put("email", userEmail);
            userBillingData.put("stripeToken", httpParameters.get("stripeToken")[0]);

            Map<String, Object> params = new HashMap<>();
            ArrayList<cartModel> cart_list = (ArrayList<cartModel>) request.getSession().getAttribute("cart-list");
            int total = 0;
            if(!String.valueOf(request.getSession().getAttribute("promo")).equals("NYUSTU")
                    && !String.valueOf(request.getSession().getAttribute("promo")).equals("450PH441")
                    && !String.valueOf(request.getSession().getAttribute("promo")).equals("312PH441")) {
                double totalD = new eventDao(Utils.getConnection()).getTotalCartPrice(cart_list);
                total = (int) totalD * 100;
            }
            else {
                double totalD = new eventDao(Utils.getConnection()).getTotalCartPrice(cart_list);
                total = (int) (totalD/2) * 100;
            }
            //int total = Integer.parseInt(String.valueOf(request.getSession().getAttribute("total"))) * 100;
            //System.out.println(total);
            params.put("amount", String.valueOf(total)); // or get from request
            params.put("currency", "usd");  // or get from request
            params.put("source", userBillingData.get("stripeToken"));// or get from request
            params.put("receipt_email", userEmail);

            Charge charge;

            charge = Charge.create(params);

            String chargeID = charge.getId();

            insertOrder(request, response, userEmail);

            String sub_checkbox = request.getParameter("sub_checkbox");
            if(sub_checkbox.equals("checked")){
                newsdao sub_dao = new newsdao();
                sub_dao.dupliateChecker(new newsmodel(userEmail));
                sub_dao.insertSub(new newsmodel(userEmail));
            }

        } catch (Exception ex) {
            response.sendRedirect("empty-cart.jsp");
            System.out.println(ex);
            //out.println(ex);
        }
    }

    public void insertOrder(HttpServletRequest request, HttpServletResponse response, String email) throws IOException, ServletException {


        ArrayList<cartModel> cart_list = (ArrayList<cartModel>) request.getSession().getAttribute("cart-list");
        List<cartModel> cartProduct = null;
        OrderDao inserting = new OrderDao(Utils.getConnection());
        if (cart_list != null) {
            eventDao pDao = new eventDao(Utils.getConnection());
            cartProduct = pDao.getCartProducts(cart_list);
            double total = pDao.getTotalCartPrice(cart_list);
            request.setAttribute("total", total);
            request.setAttribute("cart_list", cart_list);
            orderModel itemInCart = new orderModel();
            if (((ArrayList<?>) request.getSession().getAttribute("cart-list")).size() > 0) {
                for (cartModel c : cartProduct) {
                    itemInCart.setProduct_id(c.getId());
                    itemInCart.setProduct_link(c.getLink());
                    //String email = request.getParameter("email");
                    String customer_name = request.getParameter("name");
                    itemInCart.setEmail(email);
                    Random rand = new Random();
                    int otpvalue = rand.nextInt(999999);
                    itemInCart.setOtp(String.valueOf(otpvalue));
                    itemInCart.setDate(LocalDate.now().toString());
                    inserting.insertOrder(itemInCart, email);
                    inserting.insertOrderDuplicate(itemInCart, email);
                    String confirmemail = "Hello, \n\nThank you for purchasing a ticket for our Q&A with "+ c.getGuest()+ " on " + c.getName() + "! You will be sent a one-time passcode to join the Zoom discussion in a separate email. Please only use that code at the time of the event. As our events are Q&A only, we request that you view the film on your own time before the event, if you haven't already! To find where to stream the film, you can look on our events page. \n\nIf you have any questions, please let us know, and we look forward to having you with us!\n\nBest,\nPicturehouse 441";
                    String otpemail = "Hello, \n\nPlease find here a one-time passcode for our Q&A with " + c.getGuest()+ " on " + c.getName() + ": " + otpvalue + "\n\nThe code must be entered exactly as written into the \"Redeem\" section of our website to join the event. Please only use that code at the time of the event.\n\nIf you have any questions, please let us know, and we look forward to having you with us!\n\nBest,\nPicturehouse 441";
                    sendEmail(request,response, customer_name, email, "Your Picturehouse 441 Q&A Confirmation", confirmemail);
                    sendEmail(request,response, customer_name, email, "Your Picturehouse 441 One-Time Passcode", otpemail);

                }

                }
            else{
                response.sendRedirect("empty-cart.jsp");
                return;
            }
        }
        else{
            response.sendRedirect("empty-cart.jsp");
            return;
        }
        ((ArrayList<?>) request.getSession().getAttribute("cart-list")).clear();
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
            //out.println("<center><h2 style='color:green;'>Email Sent Successfully.</h2>");
            //out.println("Thank you " + name + ", your message has been submitted to us.</center>");
        } catch (Exception e) {
            out.println(e);
        }
    }

}
