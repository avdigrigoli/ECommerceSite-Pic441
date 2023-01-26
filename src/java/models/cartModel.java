package com.picturehouse.picturehouse441.models;

public class cartModel extends eventModel implements java.io.Serializable{
    private int quantity;




    public cartModel() {
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
