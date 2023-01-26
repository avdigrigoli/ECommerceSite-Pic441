package com.picturehouse.picturehouse441.daos;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.subscriberModel;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class subscriberDao {


    private static final String INSERT_SUBSCRIBER = "INSERT INTO pic441.subscribers" + "(email, expiration_date) VALUES" + "(?, ?);";


    public void insertSub1month(subscriberModel sub)
    {
        try(
                PreparedStatement ps = Utils.getConnection().prepareStatement(INSERT_SUBSCRIBER, Statement.RETURN_GENERATED_KEYS)){
            ps.setString(1, sub.getEmail());
            ps.setDate(2, Date.valueOf(LocalDate.now().plusMonths(1)));
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next()){
                sub.setId(generatedKeys.getInt(1));
            }
        }catch (Exception E){
            E.printStackTrace();
        }
    }

    public void insertSub6month(subscriberModel sub)
    {
        try(
                PreparedStatement ps = Utils.getConnection().prepareStatement(INSERT_SUBSCRIBER, Statement.RETURN_GENERATED_KEYS)){
            ps.setString(1, sub.getEmail());
            ps.setDate(2, Date.valueOf(LocalDate.now().plusMonths(6)));
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next()){
                sub.setId(generatedKeys.getInt(1));
            }
        }catch (Exception E){
            E.printStackTrace();
        }
    }


    public void insertSub12month(subscriberModel sub)
    {
        try(
                PreparedStatement ps = Utils.getConnection().prepareStatement(INSERT_SUBSCRIBER, Statement.RETURN_GENERATED_KEYS)){
            ps.setString(1, sub.getEmail());
            ps.setDate(2, Date.valueOf(LocalDate.now().plusYears(1)));
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next()){
                sub.setId(generatedKeys.getInt(1));
            }
        }catch (Exception E){
            E.printStackTrace();
        }
    }


    public static String sub_ids = "select id from pic441.subscribers";

    public static ArrayList<Integer> getIDs(){
        ArrayList<Integer> ids = new ArrayList<>();
        try {
            Connection connection = Utils.getConnection();
            PreparedStatement ps = connection.prepareStatement(sub_ids);
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
            PreparedStatement ps = con.prepareStatement("select email from pic441.subscribers where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                title = rs.getString("email");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return title;
    }

    public List<subscriberModel> getSubs() {
        List<subscriberModel> book = new ArrayList<>();
        try {
            Connection con = Utils.getConnection();
            String query = "select * from pic441.subscribers";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                subscriberModel row = new subscriberModel();
                row.setId(rs.getInt("id"));
                row.setEmail(rs.getString("email"));
                row.setDate(rs.getString("expiration_date"));
                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
}
