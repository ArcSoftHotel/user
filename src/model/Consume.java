package model;

import java.util.Date;

public class Consume {
        private String userid;
        private int roomid;
        private double roomprice;
        private double service_price;
        private Date date;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public double getRoomprice() {
        return roomprice;
    }

    public void setRoomprice(double roomprice) {
        this.roomprice = roomprice;
    }

    public double getService_price() {
        return service_price;
    }

    public void setService_price(double service_price) {
        this.service_price = service_price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
