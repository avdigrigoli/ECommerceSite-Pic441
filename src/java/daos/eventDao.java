package com.picturehouse.picturehouse441.daos;


import java.sql.*;
import java.util.*;
import java.util.List;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.cartModel;
import com.picturehouse.picturehouse441.models.eventModel;

public class eventDao {
    private Connection con;

    private String query;
    private String query2;
    private PreparedStatement pst;
    private ResultSet rs;


    public eventDao(Connection con) {
        super();
        this.con = con;
    }

    /** What it does
     *  How it works
     * @inputs
     * @functionality
     * @return
     **/
    public List<eventModel> getAllProducts() {
        List<eventModel> book = new ArrayList<eventModel>();
        try {

            query = "select * from pic441.events";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                eventModel row = new eventModel();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setDate(rs.getString("date"));
                row.setDescription(rs.getString("description"));
                row.setGuest(rs.getString("guest"));
                row.setGuest_description(rs.getString("guest_description"));
                row.setPlatforms_to_watch(rs.getString("platforms_to_watch"));
                row.setActive(rs.getString("active"));
                row.setLink(rs.getString("link"));
                row.setPhoto(rs.getString("photo"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }


    public eventModel getSingleProduct(int id) {
        eventModel row = null;
        try {
            query = "select * from pic441.events where id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new eventModel();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setDate(rs.getString("date"));
                row.setDescription(rs.getString("description"));
                row.setGuest(rs.getString("guest"));
                row.setGuest_description(rs.getString("guest_description"));
                row.setPlatforms_to_watch(rs.getString("platforms_to_watch"));
                row.setActive(rs.getString("active"));
                row.setLink(rs.getString("link"));
                row.setPhoto(rs.getString("photo"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public eventModel getSingleProduct(String name) {
        eventModel row = null;
        try {
            query = "select * from pic441.events where name=? ";

            pst = this.con.prepareStatement(query);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new eventModel();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setDate(rs.getString("date"));
                row.setDescription(rs.getString("description"));
                row.setGuest(rs.getString("guest"));
                row.setGuest_description(rs.getString("guest_description"));
                row.setPlatforms_to_watch(rs.getString("platforms_to_watch"));
                row.setActive(rs.getString("active"));
                row.setLink(rs.getString("link"));
                row.setPhoto(rs.getString("photo"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public double getTotalCartPrice(ArrayList<cartModel> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (cartModel item : cartList) {
                    query = "select price from pic441.events where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }


    public List<cartModel> getCartProducts(ArrayList<cartModel> cartList) {
        List<cartModel> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (cartModel item : cartList) {
                    query = "select * from pic441.events where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        cartModel row = new cartModel();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setPrice(rs.getDouble("price"));
                        row.setDate(rs.getString("date"));
                        row.setDescription(rs.getString("description"));
                        row.setGuest(rs.getString("guest"));
                        row.setGuest_description(rs.getString("guest_description"));
                        row.setPlatforms_to_watch(rs.getString("platforms_to_watch"));
                        row.setActive(rs.getString("active"));
                        row.setLink(rs.getString("link"));
                        row.setPhoto(rs.getString("photo"));
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }



    public static byte[] getPhoto(int id){
        byte[] byteArray = null;
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select photo from pic441.events where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                //Blob blob = rs.getBlob("photo");
                //byteArray = blob.getBytes(1, (int) blob.length());
                byteArray = rs.getBytes("photo");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return byteArray;
    }
}
