package com.picturehouse.picturehouse441.models;

public class subscriberModel {

    private int id;
    private String email;
    private String date;

    public subscriberModel() {
    }

    public subscriberModel(String email, String date) {
        super();
        this.email = email;
        this.date = date;
    }



    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email=email;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
}

