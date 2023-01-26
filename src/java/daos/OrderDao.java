package com.picturehouse.picturehouse441.daos;


import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.CalendarEvent;
import com.picturehouse.picturehouse441.models.orderModel;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderDao {

    private Connection con;

    private String query;
    private String query2;
    private PreparedStatement pst;
    private ResultSet rs;



    public OrderDao(Connection con) {
        super();
        this.con = con;
    }

    public boolean insertOrder(orderModel model, String email) {
        boolean result = false;
        try {
            query = "insert into pic441.orders (product_id, product_link, email, otp, date) values(?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getProduct_id());
            pst.setString(2, model.getProduct_link());
            pst.setString(3, email);//model.getEmail());
            pst.setString(4,model.getOtp());
            pst.setString(5, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public boolean insertOrderDuplicate(orderModel model, String email) {
        boolean result = false;
        try {
            query2 = "insert into pic441.ordersDuplicate (product_id, product_link, email, otp, date) values(?,?,?,?,?)";
            pst = this.con.prepareStatement(query2);
            pst.setInt(1, model.getProduct_id());
            pst.setString(2, model.getProduct_link());
            pst.setString(3, email);//model.getEmail());
            pst.setString(4,model.getOtp());
            pst.setString(5, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    /**
     * FIGURE OUT HOW TO CONNECT THIS BY THE EMAIL INSTEAD OF USERID BECAUSE THAT IS WHAT IS IMPORTANT
     * WHEN FINDING WHAT SOMEONE ORDERED BASED ON THEIR OTP
     *
     * I THINK THIS IS HOW THE ORDERS ARE BEING DISPLAYED TO THE ADMIN BY USERID AND PRODUCT
     * I THINK ONLY A USER CAN SEE THE ORDERS THAT THEY MADE? MAKE IT THAT ADMIN CAN SEE THEM ALL
     *
     * FIGURED IT OUT... IT SHOWS THE ORDERS FOR A PARTICULAR USER. INSTEAD, I WILL MAKE IT SO THE
     * ADMIN CAN SEE ALL THE ORDERS WITHOUT THE USE OF A USERID BECAUSE THE USERS WILL HAVE THAT IN
     * THEIR EMAIL INSTEAD.
     **/
    /*
    public List<orderModel> userOrders(int id) {
        List<orderModel> list = new ArrayList<>();
        try {
            query = "select * from pic441.orders where u_id=? order by orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("p_id");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("o_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

     */

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from pic441.orders where id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }


    public List<orderModel> getAllOrders() {
        List<orderModel> book = new ArrayList<>();
        try {
            Connection con = Utils.getConnection();
            String query = "select * from pic441.ordersduplicate";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                orderModel row = new orderModel();
                row.setId(rs.getInt("id"));
                row.setProduct_id(rs.getInt("product_id"));
                row.setProduct_link(rs.getString("product_link"));
                row.setEmail(rs.getString("email"));
                row.setOtp(rs.getString("otp"));
                row.setDate(rs.getString("date"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
}