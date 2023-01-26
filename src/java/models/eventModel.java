package com.picturehouse.picturehouse441.models;

public class eventModel {
    private int id;
    private String name;
    private Double price;
    private String date;
    private String description;
    private String guest;
    private String guest_description;
    private String platforms_to_watch;
    private String active;
    private String link;
    private String photo;


    public eventModel() {
    }


    public eventModel(int id, String name,Double price,String date, String description, String guest,
                      String guest_description, String platforms_to_watch, String active, String link, String photo) {
        super();
        this.id = id;
        this.name = name;
        this.price = price;
        this.date = date;
        this.description = description;
        this.guest = guest;
        this.guest_description = guest_description;
        this.platforms_to_watch = platforms_to_watch;
        this.active = active;
        this.link = link;
        this.photo = photo;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getGuest()
    {
        return guest;
    }

    public void setGuest(String guest)
    {
        this.guest = guest;
    }

    public String getLink()
    {
        return link;
    }

    public void setLink(String link)
    {
        this.link = link;
    }


    public String getGuest_description() {
        return guest_description;
    }

    public void setGuest_description(String guest_description) {
        this.guest_description = guest_description;
    }

    public String getPlatforms_to_watch() {
        return platforms_to_watch;
    }

    public void setPlatforms_to_watch(String platforms_to_watch) {
        this.platforms_to_watch = platforms_to_watch;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "Product [" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", date='" + date + '\'' +
                ", description='" + description + '\'' +
                ", guest='" + guest + '\'' +
                ", guest_description='" + guest_description + '\'' +
                ", platforms_to_watch='" + platforms_to_watch + '\'' +
                ", active='" + active + '\'' +
                ", link='" + link + '\'' +
                ", photo='" + photo + '\'' +
                ']';
    }

   /* @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", description=" + description + ", guest=" + guest + ", price=" + price + ", link=" + link + ", photo="
                + photo + "]";
    }


    */

}