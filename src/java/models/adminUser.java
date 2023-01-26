package com.picturehouse.picturehouse441.models;

public class adminUser {
    private int id;
    private String uname;
    private String upwd;
    private String uemail;
    private String umobile;

    public adminUser(){

    }

    public adminUser(String username, String password, String email, String mobile) {
        super();
        this.uname = username;
        this.upwd = password;
        this.uemail = email;
        this.umobile = mobile;
    }

    public int getId(){return id;}
    public void setId(int id){this.id = id;}

    public String getUname() {
        return uname;
    }

    public void setUname(String user_name) {
        this.uname = user_name;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String pword) {
        this.upwd = pword;
    }
}
