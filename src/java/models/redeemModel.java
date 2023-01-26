package com.picturehouse.picturehouse441.models;

public class redeemModel {
    private String email;
    private String otp;

    private String product_link;

    public redeemModel(){

    }

    public redeemModel(String email, String otp, String product_link) {
        super();

        this.email = email;
        this.otp = otp;
        this.product_link = product_link;
    }

     public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public String getProduct_link(){return product_link;}

    public void setProduct_link(String product_link){this.product_link=product_link;}
}
