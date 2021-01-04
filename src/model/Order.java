package model;
import java.util.ArrayList;
import java.util.Date;
public class Order {
	private User user;
	private Date checkIn;
	private Date checkOut;
	private int adult;
	private int child;
	private ArrayList<Room> roomlist;
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public ArrayList<Room> getRoomlist() {
		return roomlist;
	}
	public void setRoomlist(ArrayList<Room> roomlist) {
		this.roomlist = roomlist;
	}
	
}
