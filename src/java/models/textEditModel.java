package com.picturehouse.picturehouse441.models;

public class textEditModel {

    private int id;

    private String page;

    private String text;


    public textEditModel(int id, String page, String text){
        this.id = id;
        this.page = page;
        this.text = text;
    }

    public textEditModel() {

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
