package com.picturehouse.picturehouse441.models;

public class contactModel {
    private int id;
    private String name;
    private String email;
    private String subject;
    private String msg;

    public contactModel(String name, String email, String subject, String msg) {
        super();
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.msg = msg;

    }

    public contactModel() {

    }

    public int getID() {
        return id;
    }
    public void setId(int id){this.id = id;}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
