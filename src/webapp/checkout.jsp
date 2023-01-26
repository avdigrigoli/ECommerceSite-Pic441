<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.picturehouse.picturehouse441.models.cartModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.picturehouse.picturehouse441.daos.eventDao" %>
<%@ page import="com.picturehouse.picturehouse441.Utils" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
   ArrayList<cartModel> cart_list = (ArrayList<cartModel>) session.getAttribute("cart-list");
   List<cartModel> cartProduct = null;
   if (cart_list != null) {
      eventDao pDao = new eventDao(Utils.getConnection());
      cartProduct = pDao.getCartProducts(cart_list);
      double total = pDao.getTotalCartPrice(cart_list);
      request.setAttribute("cart_list", cart_list);
      if(!String.valueOf(request.getSession().getAttribute("promo")).equals("NYUSTU")&&
              !String.valueOf(request.getSession().getAttribute("promo")).equals("450PH441")&&
              !String.valueOf(request.getSession().getAttribute("promo")).equals("312PH441")) {
         request.setAttribute("subtotal2", total);
         request.setAttribute("deduction2", "");
         request.setAttribute("total2", total);
      }
      else {
         request.setAttribute("subtotal2", total);
         request.setAttribute("deduction2", cart_list.size()*3);
         request.setAttribute("total2", cart_list.size() * 3);
      }
   }
%>
<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Checkout</title>

    <%@include file="head.jsp"%>

</head>

<body id="body" style="background-color: #fdf4eb">
<!-- Start Top Header Bar -->

<%@include file="navbar2.jsp"%>

<h1 style="text-align: center; color: #1F0D40">Checkout</h1>

<div class="page-wrapper">
   <div class="checkout shopping">
      <div class="container">
         <div class="row">
            <div class="col-md-7">
                <form action="checkout" method="post">
               <div class="block billing-details" style="color: #f8c892">
                  <div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			 max-width: 800px;
			text-align: left;
			margin-right: auto; margin-left: auto;">
                     <div class="row">
                        <div class="col-md-12">
                           <div class="content">
                              <%String checkout1 = grabText.getTextById(24).getText();%>
                              <h1 style="text-align: left; color:#fdf3e6;"><%=checkout1%></h1>
                           </div>
                        </div>
                     </div>
                  </div>
                  <br>
                  <div class="checkout-form">
                     <div class="form-group">
                        <label for="name" style="font-size: large">Full Name</label>
                        <input style="font-size: large" type="text" class="form-control" name="name" id="name" placeholder="" required>
                     </div>
                     <div class="form-group">
                        <label for="user_address" style="font-size: large">Address</label>
                        <input style="font-size: large" type="text" class="form-control" name="address" id="user_address" placeholder="" required>
                     </div>
                        <div class="form-group">
                           <label for="user_post_code" style="font-size: large">Zip Code</label>
                           <input style="font-size: large" type="text" class="form-control" id="user_post_code" name="zipcode" value="" required>
                        </div>
                        <div class="form-group" >
                           <label for="user_city" style="font-size: large">City</label>
                           <input style="font-size: large" type="text" class="form-control" id="user_city" name="city" value="" required>
                        </div>
                     <div class="form-group">
                        <label for="user_country" style="font-size: large">Country</label>
                        <input type="text" style="font-size: large" class="form-control" name="country" id="user_country" placeholder="" required>
                     </div>
                     <div style="text-align: center">
                        <label for="sub_checkbox" style="font-size: x-large; color: #1F0D40">Subscribe to our Newsletter?</label>
                        <input type="checkbox" style="font-size: x-large" name="sub_checkbox" id="sub_checkbox" value="checked" checked>
                     </div>
                     <script
                             src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                             data-key="pk_live_51LfOoICkxKOFJaMRsyLYQ3CLe028v3N0vcpN3bNUwwHzzXe3NU5nIzFQEpOTBUAY3jrwXdl03JCmwHvDesdv7Gfi00HROmQdcO"
                             data-amount= "${total2*100}"
                             data-name="Picturehouse 441"
                             data-description="Secure Checkout"
                             data-image="./images/smalllogo2.jpg"
                             data-locale="auto"
                             data-billing-address="true"
                             data-currency="usd">
                     </script>
                     <script>
                        document.getElementsByClassName("stripe-button-el")[0].style.display = 'none';
                     </script>
                     <div style="text-align: center">
                        <button type="submit" class="btn btn-main mt-20">Pay With Card</button>
                     </div>
                  </div>
               </div>
                </form>
            </div>

            <div class="col-md-5">
               <div class="product-checkout-details" style="color: #f8c892">
                  <div class="block">
                     <div class="container" style=" z-index: 100;position: relative; background-color: #f8c892; width: 100%;
			 display: flex;
			 justify-content: right;
			 max-width: 800px;
			margin-right: auto; margin-left: auto;">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="content">
                                 <%String checkout2 = grabText.getTextById(21).getText();%>
                                 <h1 style="text-align: right;  color: #1F0D40;"><%=checkout2%></h1>
                              </div>
                           </div>
                        </div>
                     </div>
                     <br>

                     <%
                        if (cart_list != null) {
                           for (cartModel c : cartProduct) {
                     %>
                     <ul class="summary-prices" style="background-color: white; border: lightgray 1px solid">
                           <br>
                        <div class="media product-card">
                           <img style="margin-left: auto; margin-right: auto" class="media-object" src="create_event_image.jsp?id=<%=c.getId()%>" alt="<%=c.getId()%>" />
                        <div class="media-body">
                           <h3 class="media-heading" style="padding-top: 10px; text-align: center"><a><%=c.getName()%></a></h3>
                           <p class="price" style="text-align: center">$<%=dcf.format(c.getPrice())%></p>
                           <p style="text-align: center"><a class="remove" style="color: darkred" href="remove-from-cart?id=<%=c.getId() %>">Remove</a></p>
                        </div>
                     </div>
                     </ul>
                     <br>
                     <%}}
                     else { return;
                     }%>
                     <ul class="summary-prices" style="color: #1F0D40">
                        <li>
                           <%String checkout3 = grabText.getTextById(25).getText();%>
                           <span style="font-size: large"><%=checkout3%></span>
                           <span class="price" style="font-size: large">$ ${(subtotal2>0)?dcf.format(subtotal2):0}</span>
                        </li>
                        <li>
                           <%String checkout4 = grabText.getTextById(23).getText();%>
                           <span style="font-size: large"><%=checkout4%></span>
                           <span class="price" style="font-size: large">- ${deduction2}</span>
                        </li>
                     </ul>
                     <div class="summary-total" style="color: #1F0D40">
                        <%String checkout5 = grabText.getTextById(22).getText();%>
                        <span style="font-size: large"><%=checkout5%></span>
                        <span style="font-size: large">$ ${(total2>0)?dcf.format(total2):0}</span>
                     </div>
                     <br>
                     <form class="input-group" action="promo.jsp" method="post">
                        <input type="text" class="form-control" style="font-size: large" placeholder="Enter Promo Code" name="promo" id="promo" required>
                        <span class="input-group-btn">
				        <button class="btn btn-small" style="font-size: large;">Submit</button>
				      </span>
                     </form>
                     <br>
                     <%if(session.getAttribute("promocheck") == null){
                        session.setAttribute("promocheck", " ");}%>
                     <h3 style="text-align: center"><%=session.getAttribute("promocheck")%></h3>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
   
<%@include file="footer.jsp"%>



  </body>
  </html>