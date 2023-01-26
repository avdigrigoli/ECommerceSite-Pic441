package com.picturehouse.picturehouse441.daos;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.textEditModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class textEditDao {
    public static String page_text_ids = "select id from pic441.pages ";


    public textEditModel getTextById(int key){
        textEditModel pageText = null;
        String sql = "SELECT * FROM pic441.pages WHERE id=?";
        try {
            PreparedStatement ps = Utils.getConnection().prepareStatement(sql);
            ps.setInt(1, key);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                pageText = new textEditModel();
                pageText.setId(rs.getInt("id"));
                pageText.setPage(rs.getString("page"));
                pageText.setText(rs.getString("text"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return pageText;
    }



    public static ArrayList<Integer> getIDs(){
        ArrayList<Integer> ids = new ArrayList<>();
        try {
            Connection connection = Utils.getConnection();
            PreparedStatement ps = connection.prepareStatement(page_text_ids);
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

    public static String getPage(int id){
        String page = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select page from pic441.pages where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                page = rs.getString("page");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return page;
    }

    public static String getText(int id){
        String text = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select text from pic441.pages where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                text = rs.getString("description");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return text;
    }

    public List<textEditModel> getAllText() {
        List<textEditModel> book = new ArrayList<>();
        try {
            Connection con = Utils.getConnection();
            String query = "select * from pic441.pages";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                textEditModel row = new textEditModel();
                row.setId(rs.getInt("id"));
                row.setPage(rs.getString("page"));
                row.setText(rs.getString("text"));
                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }



}


