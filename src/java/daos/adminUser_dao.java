package com.picturehouse.picturehouse441.daos;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.adminUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class adminUser_dao {


        public adminUser checkLogin(String uname, String upwd) throws SQLException,
                ClassNotFoundException {
            Connection con = Utils.getConnection();
            String sql = "SELECT * FROM pic441.users WHERE uname = ? and upwd = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, uname);
            statement.setString(2, upwd);

            ResultSet result = statement.executeQuery();

            adminUser user = null;

            if (result.next()) {
                user = new adminUser();
                user.setUname(result.getString("uname"));
                user.setUpwd(upwd);
            }

            con.close();

            return user;
        }
    }

