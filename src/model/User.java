package model;

import java.util.Date;

public class User {
    private String userId;
    private String password;
    private String name;
    private String phone;
    private String doucmentnumber;
    private byte[] face;
    private Date checkin_date;
    private Date checkout_date;
    private String status;
    
    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDoucmentnumber() {
        return doucmentnumber;
    }

    public void setDoucmentnumber(String doucmentnumber) {
        this.doucmentnumber = doucmentnumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public byte[] getFace() {
        return face;
    }

    public void setFace(byte[] face) {
        this.face = face;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCheckin_date() {
        return checkin_date;
    }

    public void setCheckin_date(Date checkin_date) {
        this.checkin_date = checkin_date;
    }

    public Date getCheckout_date() {
        return checkout_date;
    }

    public void setCheckout_date(Date checkout_date) {
        this.checkout_date = checkout_date;
    }
}
