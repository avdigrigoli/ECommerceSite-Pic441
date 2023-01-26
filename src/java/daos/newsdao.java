package com.picturehouse.picturehouse441.daos;

import com.picturehouse.picturehouse441.models.newsmodel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.orderModel;

public class newsdao {

    private static final String INSERT_SUBSCRIBER = "INSERT INTO pic441.newsletter" + "(email) VALUES" + "(?);";
    private static final String CHECKER = "DELETE FROM pic441.newsletter WHERE email = ?";



    public void insertSub(newsmodel sub)
    {
        try(
                PreparedStatement ps = Utils.getConnection().prepareStatement(INSERT_SUBSCRIBER, Statement.RETURN_GENERATED_KEYS)){
                ps.setString(1, sub.getEmail());
                ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next()){
                sub.setId(generatedKeys.getInt(1));
            }
        }catch (Exception E){
            E.printStackTrace();
        }
    }

    public void dupliateChecker(newsmodel sub)
    {
        try(
            PreparedStatement ps = Utils.getConnection().prepareStatement(CHECKER, Statement.RETURN_GENERATED_KEYS)){
            ps.setString(1, sub.getEmail());
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next()){
                sub.setId(generatedKeys.getInt(1));
            }
        }catch (Exception E){
            E.printStackTrace();
        }
    }

    public static String news_ids = "select id from pic441.newsletter ";

    public static ArrayList<Integer> getIDs(){
        ArrayList<Integer> ids = new ArrayList<>();
        try {
            Connection connection = Utils.getConnection();
            PreparedStatement ps = connection.prepareStatement(news_ids);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ids.add(rs.getInt("id"));
            }

        }
        catch (Exception e){
            System.err.println(e.getLocalizedMessage());
        }
        return ids;
    }

    public static String getEmail(int id){
        String title = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select email from pic441.newsletter where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                title = rs.getString("email");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return title;
    }

    public List<newsmodel> getNews() {
        List<newsmodel> book = new ArrayList<>();
        try {
            Connection con = Utils.getConnection();
            String query = "select * from pic441.newsletter";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                newsmodel row = new newsmodel();
                row.setId(rs.getInt("id"));
                row.setEmail(rs.getString("email"));
                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

}
