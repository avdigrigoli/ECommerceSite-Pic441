package com.picturehouse.picturehouse441.models;

import com.picturehouse.picturehouse441.Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class questionModel {

    private Connection con = Utils.getConnection();
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    private int id;
    private int product_id;
    private String customer_name;
    private String question;

    public questionModel(){}

    public questionModel(int product_id, String customer_name, String question)
    {
        super();
        this.product_id = product_id;
        this.customer_name = customer_name;
        this.question = question;
    }

    public int getId(){return id;}
    public void setId(int id){this.id = id;}
    public int getProduct_id() {return product_id;}
    public void setProduct_id(int product_id) {this.product_id = product_id;}
    public String getCustomer_name() {return customer_name;}
    public void setCustomer_name(String customer_name) {this.customer_name = customer_name;}
    public String getQuestion() {return question;}
    public void setQuestion(String question) {this.question = question;}


    public List<questionModel> getSingleEventQuestions(int product_id) {
        List<questionModel> book = new ArrayList<questionModel>();
        try {
            query = "select * from pic441.questions where product_id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, product_id);
            rs = pst.executeQuery();

            while (rs.next()) {
                questionModel row = new questionModel();
                row.setId(rs.getInt("id"));
                row.setProduct_id(rs.getInt("product_id"));
                row.setCustomer_name(rs.getString("customer_name"));
                row.setQuestion(rs.getString("question"));
                book.add(row);

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return book;
    }



}

