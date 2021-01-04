package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BasicDao {
	DataSource dataSource;
	public BasicDao(){
		try {
			Context context=new InitialContext();
			dataSource=(DataSource)context.lookup("java:comp/env/jdbc/hoteldbDS");
		}catch(NamingException ne){
			ne.printStackTrace();
		}
	}
	public Connection getConnection() throws Exception{
		return dataSource.getConnection();
	}
}
