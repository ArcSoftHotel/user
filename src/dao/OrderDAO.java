package dao;
import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.*;
public class OrderDAO extends BasicDao {
	public boolean addOrder(Order order,String userid) {
		String sql = "INSERT INTO book(userid,roomid,checkin_time,checkout_time,adult,children) VALUES(?,?,?,?,?,?)";
		try{
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ArrayList<Room> rl = order.getRoomlist();
			for(Room r:rl) {
				pstmt.setString(1, userid);
				pstmt.setInt(2, r.getRoomid());
				pstmt.setDate(3, new java.sql.Date(order.getCheckIn().getTime()));
				pstmt.setDate(4, new java.sql.Date(order.getCheckOut().getTime()));
				pstmt.setInt(5, order.getAdult());
				pstmt.setInt(6, order.getChild());
				pstmt.executeUpdate();
			}
	        pstmt.close();
	        conn.close();
			return true;
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}
	}
	public boolean addConsume(Order order,String userid) {
		String sql = "INSERT INTO consume(userid,roomprice,service_price) VALUES(?,?,0)";
		String sql2 = "update consume set roomprice=roomprice+? where userid=?";
		try{
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ArrayList<Room> rl = order.getRoomlist();
			pstmt.setString(1, userid);
			pstmt.setDouble(2, rl.get(0).getPrice());
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = conn.prepareStatement(sql2);
			for(int i = 1;i<rl.size();i++) {				
				pstmt.setDouble(1, rl.get(i).getPrice());
				pstmt.setString(2, userid);
				pstmt.executeUpdate();
			}
	        pstmt.close();
	        conn.close();
			return true;
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}
	}
	public boolean updateConsume(Order order,String userid) {
		String sql = "update consume set roomprice=roomprice+? where userid=?";
		try{
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ArrayList<Room> rl = order.getRoomlist();			
			for(Room r:rl) {				
				pstmt.setDouble(1, r.getPrice());
				pstmt.setString(2, userid);
				pstmt.executeUpdate();
			}
	        pstmt.close();
	        conn.close();
			return true;
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}
	}
	public boolean addSport(double price,String userid,Date date) {
		String sql = "update consume set service_price=service_price+?,date=? where userid=?";
		try{
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
							
			pstmt.setDouble(1, price);
			pstmt.setDate(2, date);
			pstmt.setString(3, userid);
			pstmt.executeUpdate();

	        pstmt.close();
	        conn.close();
			return true;
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}
	}
}
