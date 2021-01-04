package dao;
import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.*;

public class RoomDAO extends BasicDao {
	public ArrayList<Room> 	GetAllRooms(){
		ArrayList <Room> roomlist = new ArrayList<Room>();
		String sql = "SELECT * FROM room order by roomprice asc";
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rst = pstmt.executeQuery();
			while(rst.next()) {
				Room room = new Room();
				room.setRoomid(rst.getInt("roomid"));
				room.setPrice(rst.getDouble("roomprice"));
				room.setType(rst.getString("roomtype"));
				room.setPic(rst.getString("roomimg"));
				room.setState(rst.getString("state"));
				roomlist.add(room);
			}
			if(roomlist.isEmpty()) {
				return null;
			}
			rst.close();
	        pstmt.close();
	        conn.close();
	        return roomlist;
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e);
			return null;
		}
		
	}
	
	public Room GetRoomById(int id) {
		Room room = new Room();
		String sql = "SELECT * FROM room WHERE roomid=?";
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rst = pstmt.executeQuery();
			while(rst.next()) {
				room.setRoomid(rst.getInt("roomid"));
				room.setPrice(rst.getDouble("roomprice"));
				room.setType(rst.getString("roomtype"));
				room.setPic(rst.getString("roomimg"));
				room.setState(rst.getString("state"));			
			}
			rst.close();
	        pstmt.close();
	        conn.close();
	        return room;
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e);
			return null;
		}
	}
}
