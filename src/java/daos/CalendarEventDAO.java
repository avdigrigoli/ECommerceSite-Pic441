package com.picturehouse.picturehouse441.daos;

import com.picturehouse.picturehouse441.Utils;
import com.picturehouse.picturehouse441.models.CalendarEvent;
import com.picturehouse.picturehouse441.models.eventModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CalendarEventDAO {
    public static String calendar_event_ids = "select id from pic441.calendar ";

    private static final String INSERT_CALENDAR_EVENT_SQL = "INSERT INTO pic441.calendar" + " (name, description, date, type, color, time) VALUES " + " (?, ?, ?, ?, ?, ?);";

    public CalendarEvent getEventById(int key){
        CalendarEvent calEvent = null;
        String sql = "SELECT * FROM pic441.calendar WHERE id=?";
        try {
            PreparedStatement ps = Utils.getConnection().prepareStatement(sql);
            ps.setInt(1, key);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                calEvent = new CalendarEvent();
                calEvent.setId(rs.getInt("id"));
                calEvent.setName(rs.getString("name"));
                calEvent.setDescription(rs.getString("description"));
                calEvent.setDate(rs.getString("date"));
                calEvent.setType(rs.getString("type"));
                calEvent.setColor(rs.getString("color"));
                calEvent.setTime(rs.getString("time"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return calEvent;
    }



    public static ArrayList<Integer> getIDs(){
        ArrayList<Integer> ids = new ArrayList<>();
        try {
            Connection connection = Utils.getConnection();
            PreparedStatement ps = connection.prepareStatement(calendar_event_ids);
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

    public static String getName(int id){
        String name = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select name from pic441.calendar where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return name;
    }

    public static String getDescription(int id){
        String description = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select description from pic441.calendar where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                description = rs.getString("description");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return description;
    }

    public static String getDate(int id){
        String date = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select date from pic441.calendar where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                date = rs.getString("date");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return date;
    }

    public static String getType(int id){
        String type = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select type from pic441.calendar where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                type = rs.getString("type");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return type;
    }

    public static String getColor(int id){
        String color = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select color from pic441.calendar where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                color = rs.getString("color");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return color;
    }

    public static String getTime(int id){
        String time = "failed";
        try {
            Connection con = Utils.getConnection();
            PreparedStatement ps = con.prepareStatement("select time from pic441.calendar where id = " + id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                time = rs.getString("time");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return time;
    }


    public static void addCalendarEvent(CalendarEvent calEvent)
    {
        try(
                PreparedStatement preparedStatement = Utils.getConnection().prepareStatement(INSERT_CALENDAR_EVENT_SQL, PreparedStatement.RETURN_GENERATED_KEYS)){
            preparedStatement.setString(1, calEvent.getName());
            preparedStatement.setString(2, calEvent.getDescription());
            preparedStatement.setString(3, calEvent.getDate());
            preparedStatement.setString(4, calEvent.getType());
            preparedStatement.setString(5, calEvent.getColor());
            preparedStatement.setString(6, calEvent.getTime());
            preparedStatement.executeUpdate();

            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()){
                calEvent.setId(generatedKeys.getInt(1));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<CalendarEvent> getAllEvents() {
        List<CalendarEvent> book = new ArrayList<>();
        try {
            Connection con = Utils.getConnection();
            String query = "select * from pic441.calendar";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                CalendarEvent row = new CalendarEvent();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setDescription(rs.getString("description"));
                row.setDate(rs.getString("date"));
                row.setColor(rs.getString("color"));
                row.setTime(rs.getString("time"));
                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }



}


