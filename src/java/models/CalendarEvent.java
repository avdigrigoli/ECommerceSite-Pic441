package com.picturehouse.picturehouse441.models;

public class CalendarEvent {
    private int id;
    private String name;
    private String description;
    private String date;
    private String type;
    private String color;
    private String time;

    public CalendarEvent(String name, String description, String date, String type, String color, String time) {
        super();
        this.name = name;
        this.description = description;
        this.date = date;
        this.type = type;
        this.color = color;
        this.time = time;
    }

    public CalendarEvent() {

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }


    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
