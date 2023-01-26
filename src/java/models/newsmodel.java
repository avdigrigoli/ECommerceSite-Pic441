package com.picturehouse.picturehouse441.models;

public class newsmodel {
    private int id;

    private String email;

    public newsmodel(){}

    public newsmodel(String email)
    {
        super();
        this.email = email;
    }

    public int getId(){return id;}
    public void setId(int id){this.id = id;}

    public String getEmail(){return email;}
    public void setEmail(String email){this.email = email;}

}

