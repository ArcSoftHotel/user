package dao;

import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao extends BasicDao {
	 //进行数据库相关查询的操作
    private Connection conn = null;
    private PreparedStatement psmt = null;
    private ResultSet rs = null;

    //用户登录判断
    public User Login_U(String username,String password){
        String sql="select userid, password, name, phone_number, document_number,status from user where userid=? AND password=?";
        User user=new User();
        try {
            conn=dataSource.getConnection();

            psmt=conn.prepareStatement(sql);
            psmt.setString(1, username);
            psmt.setString(2, password);

            rs=psmt.executeQuery();
            if(rs.next()){
                user.setUserId(username);
                user.setPassword(password);
                user.setName(rs.getString("name"));
                user.setDoucmentnumber(rs.getString("document_number"));
                user.setStatus(rs.getString("status"));
            }else{
                return null;
            }
            rs.close();
            psmt.close();
            conn.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    //用户注册个人信息
    public Boolean add(String username,String password,String name,String phone,String documentnumber){
        String sql="insert into user values(?,?,?,?,?,default,default,default)";
        try {
            conn=dataSource.getConnection();

            psmt=conn.prepareStatement(sql);
            psmt.setString(1,username);
            psmt.setString(2,password);
            psmt.setString(3,name);
            psmt.setString(4,phone);
            psmt.setString(5,documentnumber);
            psmt.executeUpdate();
            psmt.close();
            conn.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

    //本地查找人脸
    public User findByFace(byte[] face) {
        User user=new User();
        String sql = "SELECT * FROM check_in WHERE face=?";
        try {
            conn = dataSource.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setBytes(1, face);
            rs = psmt.executeQuery();
            while (rs.next()) {
                user.setUserId(rs.getString("userid"));
                user.setName(rs.getString("name"));
                user.setPhone(rs.getString("phone_number"));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    //插入消费金额
    public boolean addmoney(String userid ,double price){
        Consume consume=new Consume();
        String sql="insert into consume values (?,default,0,?,default)";
        try {
            conn=dataSource.getConnection();
            psmt=conn.prepareStatement(sql);
            psmt.setString(1,userid);
            psmt.setDouble(2,price);
            psmt.executeUpdate();

            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public boolean finduserconsume(String userid){
        String sql="select userid from consume where userid=?";
        User user=new User();
        try {
            conn=dataSource.getConnection();

            psmt=conn.prepareStatement(sql);
            psmt.setString(1, userid);
            rs=psmt.executeQuery();
            if(rs.next()){
                user.setUserId(userid);
            }else{
                return false;
            }
            rs.close();
            psmt.close();
            conn.close();
            
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
        return true;
    }
    
    //计算消费总金额并更新数据表
    public boolean among(String userid, double price){
        Consume consume=new Consume();
        String sql="update consume set service_price=service_price+? where userid=?";
        try {
            conn=dataSource.getConnection();
            psmt=conn.prepareStatement(sql);
            psmt.setDouble(1,price);
            psmt.setString(2,userid);

            int result=psmt.executeUpdate();
            if(result>0)return true;
            else return false;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
