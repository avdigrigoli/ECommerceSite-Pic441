package com.picturehouse.picturehouse441;

import com.picturehouse.picturehouse441.daos.newsdao;
import com.picturehouse.picturehouse441.models.newsmodel;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/subscribe")
public class newsservlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    private newsdao sub_dao;

    public newsservlet(){}

    public void init(){this.sub_dao = new newsdao();}

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{this.doGet(request,response);}

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        insertSub(request, response);
    }

    public void insertSub(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String email = request.getParameter("email");
        sub_dao.dupliateChecker(new newsmodel(email));
        sub_dao.insertSub(new newsmodel(email));
        response.sendRedirect("subscribed.jsp");
    }




}
