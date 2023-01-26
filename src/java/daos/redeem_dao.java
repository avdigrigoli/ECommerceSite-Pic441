package com.picturehouse.picturehouse441.daos;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.adminUser;
import com.picturehouse.picturehouse441.models.redeemModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class redeem_dao {


    public String checkRedeem(String email, String otp) throws SQLException,
            ClassNotFoundException {
        Connection con = Utils.getConnection();
            String sql = "SELECT product_link FROM pic441.orders WHERE email = ? and otp = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, otp);

            ResultSet result = statement.executeQuery();

            redeemModel link = null;

            if (result.next()) {
                link = new redeemModel();
                link.setProduct_link(result.getString("product_link"));
            }
            else {
                con.close();
               return "http://www.picturehouse441.com/invalid_redeem.jsp";
            }

            con.close();
            return link.getProduct_link();

    }

}