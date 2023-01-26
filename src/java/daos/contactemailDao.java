package com.picturehouse.picturehouse441.daos;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.contactModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class contactemailDao {

    public List<contactModel> getAllEmails() {
        List<contactModel> book = new ArrayList<>();
        try {
            Connection con = Utils.getConnection();
            String query = "select * from pic441.contactemails";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                contactModel row = new contactModel();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setEmail(rs.getString("email"));
                row.setSubject(rs.getString("subject"));
                row.setMsg(rs.getString("msg"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    private static final String INSERT_SQL = "insert into pic441.contactemails(name,email," +
            "subject, msg) values(?,?,?,?)";

    public static void addEmailBackup(String name, String email, String subject, String msg)
    {
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(INSERT_SQL)){
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, subject);
            preparedStatement.setString(4, msg);
            preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
