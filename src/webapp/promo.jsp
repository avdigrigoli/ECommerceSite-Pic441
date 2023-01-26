<%
    String promo=request.getParameter("promo");
    if(promo!=null && !promo.equals("")){
        request.getSession().setAttribute("promo", promo);
        if(promo.equals("NYUSTU") || promo.equals("450PH441") || promo.equals("312PH441"))
        {
            request.getSession().setAttribute("promocheck", "Promo Code Applied!");
        }
        else {
            request.getSession().setAttribute("promocheck", "Invalid Promo Code!");
        }
    }

    response.sendRedirect("checkout.jsp");
    //String text=session.getAttribute("promo").toString();
%>