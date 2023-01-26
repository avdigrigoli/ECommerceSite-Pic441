package com.picturehouse.picturehouse441.models;


import com.picturehouse.picturehouse441.models.eventModel;

public class orderModel extends eventModel {
    private int id;
    private int product_id;
    private String product_link;
    private String email;
    private String otp;
    private String date;

    public orderModel() {
    }

    public orderModel(int id, int product_id, String product_link, String email, String otp, String date) {
        super();
        this.id = id;
        this.product_id = product_id;
        this.product_link = product_link;
        this.email = email;
        this.otp = otp;
        this.date = date;
    }

    public orderModel(int product_id, String product_link, String email, String otp) {
        super();
        this.product_id = product_id;
        this.product_link = product_link;
        this.email = email;
        this.otp = otp;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_link() {
        return product_link;
    }
    public void setProduct_link(String product_link) {
        this.product_link = product_link;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email=email;
    }

    public String getOtp()
    {
        return otp;
    }

    public void setOtp(String otp)
    {
        this.otp = otp;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
}
